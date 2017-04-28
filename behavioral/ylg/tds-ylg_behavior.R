##Check if the packages we need are installed, and if not, install them
packages<-c('dplyr', 'tidyr', 'data.table', 'R.matlab', 'ggplot2', 'lme4')
if(length(setdiff(packages, rownames(installed.packages())))>0) {
  install.packages(setdiff(packages, rownames(installed.packages())))
}
lapply(packages, library, character.only=TRUE)

##Set paths (data is located on psi-svr-file)
tds_folder<-'/Volumes/TDS/'
ylg_folder<-paste(tds_folder,'Data_Behavioral/YLG/processed/',sep='')
demo_folder<-paste(tds_folder,'Data_Behavioral/Redcap/',sep='')

##Collect data
ylg_data<-read.csv(paste(ylg_folder,'tds-all_trial_by_trial.csv',sep=''))
demo_data<-read.csv(paste(demo_folder,'age_gender_iq.csv',sep=''))

##Check for invalid data (per subject)
count_trials_per_sub<-ylg_data %>% group_by(subject.name) %>% summarize(n())
count_trials_per_run<-ylg_data %>% group_by(subject.name, profile.name) %>% summarize(n())
subject <- ylg_data %>% filter(`subject.name`==348) #%>% group_by(`profile.name`) %>% summarize(n())

##Filter out invalid|incomplete data
# 103 = behavioral, no stop5-8
# 127 = no stop2
# 138 = behavioral, no stop5, froze temporarily during stop7
# 189 = no stop7|stop8
# 305 = behavioral, no stop8
# 315 = no practice runs (stop1|stop2)
# 319 = behavioral, no stop4
# 339 = behavioral, no stop3-8 (task failed)
# 344 = no practice runs (stop1|stop2)
# 345 = behavioral, no stop3-8 (task failed)
# 350 = no stop7|stop8
# 356 = no stop7|stop8
# >500 = YADS
exclude = c(103, 127, 138, 189, 305, 315, 319, 339, 344, 345, 350, 356)
ylg_data_filtered = ylg_data %>% filter(!subject.name %in% exclude) %>% filter(subject.name < 500)
count_trials_per_sub<-ylg_data_filtered %>% group_by(subject.name) %>% summarize(n())

##Add group ID variable
ylg_data_filtered = ylg_data_filtered %>% mutate(tds_group = ifelse(grepl('^3', subject.name), 1,
                                                             ifelse(grepl('^1', subject.name), 2,
                                                             ifelse(grepl('^4', subject.name), 3, NA))),
                                                 tds_group = as.factor(tds_group))
n_per_group = ylg_data_filtered %>% group_by(tds_group) %>% summarize(n_subjects = n()/160)

##Add condition variable
ylg_data_filtered = ylg_data_filtered %>% mutate(condition = ifelse(grepl('1|2', run_index), 1,
                                                             ifelse(grepl('3|4', run_index), 2,
                                                             ifelse(grepl('5|6', run_index), 3, 
                                                             ifelse(grepl('7|8', run_index), 4, NA)))),
                                                 condition = as.factor(condition))
ylg_data_filtered$run_index <- as.factor(ylg_data_filtered$run_index)
condition_labels = c(`1`='Mock', `2`='Alone', `3`='Included by Peers', `4`='Excluded by Peers')

##################
## Go decisions ##
##################

##Calculate proportion of Go decisions for TDS-1 and TDS-2 samples only
go = ylg_data_filtered %>% mutate(go = ifelse(decision=='GO', 1, 0)) %>% filter(grepl('1|2', tds_group)) 

##Plot ylg behavior for TDS-1 and TDS-2 across all runs
go.plot = go %>% group_by(tds_group, condition, run_index) %>% 
  summarize(pGo = mean(go), sd = sd(go), n = n(), se = sd/sqrt(n), ci=qt(0.975, df=n-1)*se)

ggplot(go.plot, aes(x=run_index, y=pGo, color=tds_group)) +
  geom_point(position=position_dodge(.1), size=3) +
  geom_line(aes(group=tds_group), size=1) +
  geom_errorbar(aes(ymax=pGo + ci, ymin=pGo - ci), width=0.1, position=position_dodge(.1)) +
  facet_grid(.~condition, scales='free', labeller=as_labeller(condition_labels)) +
  labs(x='Run number', y='Proportion of Go decisions', color='Sample') +
  theme(text = element_text(size=20)) +
  scale_colour_discrete(labels=c('Foster Care (n=49)', 'Community (n=84)'))

# This didn't work on R version 3.2.5
#ggplot(go.plot, aes(x=run_index, y=pGo, color=tds_group)) +
#  stat_summary(fun.y = "mean", geom = "point") +                 
#  stat_summary(fun.data = "mean_cl_normal", geom = "linerange")

##Run effects on Go decisions
null.model <- glmer(go ~ (1|subject.name), data=go, family='binomial')
run.model <- glmer(go ~ run_index + (1|subject.name), data=go, family='binomial')
run_by_group.model <- glmer(go ~ run_index * tds_group + (1|subject.name), data=go, family='binomial', 
                            control=glmerControl(optimizer="bobyqa"))
anova(null.model, run.model)          #21.1      7   0.003625 **
anova(null.model, run_by_group.model) #54.792     15  1.936e-06 ***
anova(run.model, run_by_group.model)  #33.692      8   4.62e-05 ***
summary(run_by_group.model)
#run_index7:tds_group2  0.41430    0.11879   3.488 0.000487 ***
#run_index8:tds_group2  0.43912    0.11849   3.706 0.000211 ***

##Condition effects on Go decisions
null.model <- glmer(go ~ (1|subject.name), data=go, family='binomial')
condition.model <- glmer(go ~ condition + (1|subject.name), data=go, family='binomial')
condition_by_group.model <- glmer(go ~ condition * tds_group + (1|subject.name), data=go, family='binomial')
anova(null.model, condition.model)                #18.651      3  0.0003227 ***
anova(null.model, condition_by_group.model)       #50.735      7  1.036e-08 ***
anova(condition.model, condition_by_group.model)  #32.083      4   1.84e-06 ***
summary(condition_by_group.model)
#condition4:tds_group2  0.39678    0.08401   4.723 2.33e-06 ***

##################
## Demographics ##
##################
data<-merge(demo_data, ylg_data_filtered)
data=data %>% filter(grepl('1|2', tds_group))
data<-data %>% mutate(age_c=age-(mean(age)))

#n_by_gender<-data %>% group_by(tds_group, gender) %>% summarize(n=n()/160)
#n_by_gender<-data %>% group_by(tds_group, gender) %>% summarize(sum(!is.na(iq))/160)

age_by_group<-data %>% group_by(tds_group) %>% 
  summarize(mean = mean(age), sd = sd(age), n = n()/160, se = sd/sqrt(n), ci=qt(0.975, df=n-1)*se)

iq_by_group<-data %>% group_by(tds_group) %>% 
  summarize(mean = mean(iq, na.rm=T), sd = sd(iq, na.rm=T), n = sum(!is.na(iq))/160, se = sd/sqrt(n), ci=qt(0.975, df=n-1)*se)

data_reduced<-data %>% distinct(subject.name, age, iq, tds_group)
t.test(data_reduced$age~data_reduced$tds_group) #t = 0.2762, df = 94.89, p-value = 0.783
t.test(data_reduced$iq~data_reduced$tds_group)  #t = -3.576, df = 99.25, p-value = 0.0005411 ***
