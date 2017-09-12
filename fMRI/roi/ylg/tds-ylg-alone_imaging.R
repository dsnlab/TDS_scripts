###############
## Data prep ##
###############
```{r}
##Check if the packages we need are installed, and if not, install them
packages<-c('dplyr', 'tidyr', 'data.table', 'R.matlab', 'ggplot2', 'lme4')
if(length(setdiff(packages, rownames(installed.packages())))>0) {
  install.packages(setdiff(packages, rownames(installed.packages())))
}
lapply(packages, library, character.only=TRUE)

##Set paths (data is located on psi-svr-filer)
tds_folder<-'/Volumes/TDS/behavior/'
ylg_folder<-paste(tds_folder, 'YLG/processed/', sep='')
demo_folder<-paste(tds_folder, 'Redcap/', sep='')
qualtrics_folder<-paste(tds_folder, 'Qualtrics/', sep='')

##Collect data
ylg_data<-read.csv(paste(ylg_folder,'tds-all_trial_by_trial.csv',sep=''))
demo_data<-read.csv(paste(demo_folder,'age_gender_iq.csv',sep=''))
qualtrics_data<-read.csv(paste(qualtrics_folder, 'scoring_script_output/TDS-2-auto_scored_scales_wide.csv', sep=''))
```
#######################
## Demographics N=81 ##
#######################
```{r}
# Select Qualtrics data needed
qualtrics_data_selection <- qualtrics_data %>% select(starts_with("SID"), starts_with("PDS"))

## Merge qualtrics and demo data
demo <- merge(demo_data, qualtrics_data_selection, by.x = 'subject.name', by.y = 'SID')

## Add variables
demo <- demo %>%
  mutate(age_group = ifelse(age < 14.0, 1, 2)) %>% # age groups based on median split
  mutate(age_c = age-14.1, age_rnd = floor(age), age_sq = age_c^2) %>%   # age variables
  mutate(iq_c = iq-100, iq_z = iq_c/15) %>%                   # iq variables
  mutate(PDS_mean_score=ifelse(                               # pds variables
    is.na(PDS_female_mean_score_score)==TRUE, PDS_male_mean_score_score, PDS_female_mean_score_score)) %>%
  mutate(PDS_stage = ceiling(PDS_mean_score), pds_group = ifelse(PDS_mean_score < 2.9, 1, 2)) %>%
  mutate(gender_flip = ifelse(gender==0, 'Male', 'Female'))   # flip gender for correct colors in graph

## Filter demo_data (N=81)
no_session2 = c(118, 123, 147, 148, 149, 153, 154, 166, 180)
behaviorals = c(103, 107, 112, 138, 143, 176, 191)
invalid_MRI = c(158, 189) # excessive dropout/motion
demo_filtered <- demo %>% filter(subject.name < 300) %>% 
  filter(!subject.name %in% no_session2) %>% 
  filter(!subject.name %in% behaviorals) %>%
  filter(!subject.name %in% invalid_MRI)

##################
## YLG behavior ##
##################
```{r}
# Add variables
ylg = ylg_data %>% 
  mutate(condition = ifelse(grepl('1|2', run_index), 1,
                            ifelse(grepl('3|4', run_index), 2,
                                   ifelse(grepl('5|6', run_index), 3, 
                                          ifelse(grepl('7|8', run_index), 4, NA))))) %>%
  mutate(time=run.time.ms/60000) %>%
  mutate(go = ifelse(decision=='GO', 1, 0)) %>%
  mutate(crash = ifelse(scenario=='CRASH', 1, 0)) %>%
  mutate(go_cr = ifelse(decision=='GO' & scenario=='CRASH', 1, 0))

# Convert to factors
ylg$run_index <- as.factor(ylg$run_index)
ylg$condition <- as.factor(ylg$condition)

# Filter out Alone data (stop1-4)
ylg_alone<-ylg %>% filter(grepl('1|2|3|4', run_index))

# Filter out subjects for imaging results (N=80)
# 301-399 = TDS-1
# 401-499 = TDS-3
# >500 = YADS
# 189 = incomplete dataset and excessive head motion
# 103, 107, 112, 138, 143, 176, 191 = behavioral
exclude = c(189, 103, 107, 112, 138, 143, 176, 191)
ylg_alone_filtered = ylg_alone %>% filter(subject.name < 300) %>% 
  filter(!subject.name %in% exclude)

# Dataset for behavioral analyses 
df <- merge(demo_filtered, ylg_alone_filtered, by = 'subject.name')

# Dataset for analyses involving PDS
df_pds <- df %>% filter(!is.na(PDS_mean_score))

# Set as factors
df$gender <- as.factor(df$gender)
df$gender_flip <- as.factor(df$gender_flip)

########################
## ROI analysis: NAcc ##
########################
roi_folder <- '/Volumes/TDS/nonbids_data/derivatives/fMRI/roi/ylg/'
anat_NAcc_go.stop <- read.csv(paste(roi_folder,'anat_NAcc_HO/ylg_go-stop_alone_results.csv',sep=''))
anat_NAcc_good.bad <- read.csv(paste(roi_folder,'anat_NAcc_HO/ylg_good-bad_alone_results.csv',sep=''))
anat_NAcc_good.stop.go <- read.csv(paste(roi_folder,'anat_NAcc_HO/ylg_good_stop-go_alone_results.csv',sep=''))
anat_NAcc_bad.stop.go <- read.csv(paste(roi_folder,'anat_NAcc_HO/ylg_bad_stop-go_alone_results.csv',sep=''))

NAcc_go.stop <- merge(demo_filtered, anat_NAcc_go.stop, by = 'subject.name') # N=79
NAcc_good.bad <- merge(demo_filtered, anat_NAcc_good.bad, by = 'subject.name') # N=79
NAcc_good.stop.go <- merge(demo_filtered, anat_NAcc_good.stop.go, by = 'subject.name') # N=77
NAcc_bad.stop.go <- merge(demo_filtered, anat_NAcc_bad.stop.go, by = 'subject.name') # N=78

no_pds <- c(160, 174)
NAcc_go.stop_pds <- NAcc_go.stop %>% filter(!subject.name %in% no_pds) # N=77
NAcc_good.bad_pds <- NAcc_good.bad %>% filter(!subject.name %in% no_pds) # N=77
NAcc_good.stop.go_pds <- NAcc_good.stop.go %>% filter(!subject.name %in% no_pds) # N=75
NAcc_bad.stop.go_pds <- NAcc_bad.stop.go %>% filter(!subject.name %in% no_pds) # N=76

### Continuous age effects ###
# Age effects on NAcc activation for Go > Stop decisions, controlling for sex and IQ
null.model <- lm(bilat_NAcc_go.stop ~ gender + iq_z, data=NAcc_go.stop)
main.model <- lm(bilat_NAcc_go.stop ~ age_c + gender + iq_z, data=NAcc_go.stop)
anova(null.model, main.model) 
# F(1,75)=1.586, p=0.2118
summary(null.model) 
# (Intercept)   b=1.37439    se=0.54321   t=2.530   p=0.0135 *
# gender        0.91053    0.68937   1.321   0.1905  
# iq_z          0.05988    0.44332   0.135   0.8929

# Age effects on NAcc activation for Good > Bad outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good.bad ~ gender + iq_z, data=NAcc_good.bad)
main.model <- lm(bilat_NAcc_good.bad ~ age_c + gender + iq_z, data=NAcc_good.bad)
anova(null.model, main.model) 
# F(1,75)=0.1372, p=0.7121
summary(null.model) 
# (Intercept)   0.9869     0.3912   2.522   0.0137 *
# gender        0.1351     0.4965   0.272   0.7864  
# iq_z          0.4731     0.3193   1.482   0.1425

# Age effects on NAcc activation for Good Stop > Good Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good_stop.go ~ gender + iq_z, data=NAcc_good.stop.go)
main.model <- lm(bilat_NAcc_good_stop.go ~ age_c + gender + iq_z, data=NAcc_good.stop.go)
anova(null.model, main.model) 
# F(1,73)=1.1353, p=0.2902
summary(null.model) 
# (Intercept)   0.2707     0.6451   0.420    0.676
#gender        0.7732     0.8159   0.948    0.346
#iq_z         -0.3128     0.5223  -0.599    0.551

# Age effects on NAcc activation for Bad Stop > Bad Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_bad_stop.go ~ gender + iq_z, data=NAcc_bad.stop.go)
main.model <- lm(bilat_NAcc_bad_stop.go ~ age_c + gender + iq_z, data=NAcc_bad.stop.go)
anova(null.model, main.model) 
# F(1,74)=1.0078, p=0.3187
summary(null.model) 
# (Intercept)   1.3068     0.5875   2.224   0.0291 *
#gender        0.9590     0.7389   1.298   0.1983  
#iq_z         -0.3444     0.4731  -0.728   0.4690

### Dichotemous age effects ###
# Age group effects on NAcc activation for Go > Stop decisions, controlling for sex and IQ
null.model <- lm(bilat_NAcc_go.stop ~ gender + iq_z, data=NAcc_go.stop)
main.model <- lm(bilat_NAcc_go.stop ~ age_group + gender + iq_z, data=NAcc_go.stop)
anova(null.model, main.model) 
# F(1,75)=0.248, p=0.6199
summary(null.model) 
# (Intercept)           1.37439    0.54321   2.530   0.0135 *
# gender                0.91053    0.68937   1.321   0.1905  
# iq_z                  0.05988    0.44332   0.135   0.8929

# Age group effects on NAcc activation for Good > Bad outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good.bad ~ gender + iq_z, data=NAcc_good.bad)
main.model <- lm(bilat_NAcc_good.bad ~ age_group + gender + iq_z, data=NAcc_good.bad)
anova(null.model, main.model) 
# F(1,75)=0.1978, p=0.6578
summary(null.model) 
# (Intercept)   0.9869     0.3912   2.522   0.0137 *
# gender        0.1351     0.4965   0.272   0.7864  
# iq_z          0.4731     0.3193   1.482   0.1425

# Age group effects on NAcc activation for Good Stop > Good Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good_stop.go ~ gender + iq_z, data=NAcc_good.stop.go)
main.model <- lm(bilat_NAcc_good_stop.go ~ age_group + gender + iq_z, data=NAcc_good.stop.go)
anova(null.model, main.model) 
# F(1,73)=1.1978, p=0.2774
summary(null.model) 
# (Intercept)   0.2707     0.6451   0.420    0.676
#gender        0.7732     0.8159   0.948    0.346
#iq_z         -0.3128     0.5223  -0.599    0.551

# Age group effects on NAcc activation for Bad Stop > Bad Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_bad_stop.go ~ gender + iq_z, data=NAcc_bad.stop.go)
main.model <- lm(bilat_NAcc_bad_stop.go ~ age_group + gender + iq_z, data=NAcc_bad.stop.go)
anova(null.model, main.model) 
# F(1,74)=0.0625, p=0.8033
summary(null.model) 
# (Intercept)   1.3068     0.5875   2.224   0.0291 *
#gender        0.9590     0.7389   1.298   0.1983  
#iq_z         -0.3444     0.4731  -0.728   0.4690

### Continuous puberty effects ###
# PDS effects on NAcc activation for Go > Stop decisions, controlling for sex and IQ
null.model <- lm(bilat_NAcc_go.stop ~ gender + iq_z, data=NAcc_go.stop_pds)
main.model <- lm(bilat_NAcc_go.stop ~ PDS_mean_score + gender + iq_z, data=NAcc_go.stop_pds)
anova(null.model, main.model) 
# F(1,73)=2.0801, p=0.1535
summary(null.model) 
# (Intercept)  1.41053    0.55790   2.528   0.0136 *
# gender       0.87414    0.70768   1.235   0.2207  
# iq_z         0.06039    0.45325   0.133   0.8944

# PDS effects on NAcc activation for Good > Bad outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good.bad ~ gender + iq_z, data=NAcc_good.bad_pds)
main.model <- lm(bilat_NAcc_good.bad ~ PDS_mean_score + gender + iq_z, data=NAcc_good.bad_pds)
anova(null.model, main.model) 
# F(1,73)=8.0273, p=0.005954 **
summary(main.model) 
# (Intercept)     -1.7107     1.0278  -1.664  0.10030
# PDS_mean_score   1.1267     0.3977   2.833  0.00595 **  
# gender          -0.7649     0.5753  -1.330  0.18781
# iq_z             0.5262     0.3107   1.694  0.09459 .

# PDS effects on NAcc activation for Good Stop > Good Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good_stop.go ~ gender + iq_z, data=NAcc_good.stop.go_pds)
main.model <- lm(bilat_NAcc_good_stop.go ~ PDS_mean_score + gender + iq_z, data=NAcc_good.stop.go_pds)
anova(null.model, main.model) 
# F(1,71)=1.0237, p=0.3151
summary(null.model) 
# (Intercept)   0.1964     0.6621   0.297    0.768
#gender        0.8666     0.8367   1.036    0.304
#iq_z         -0.3521     0.5334  -0.660    0.511

# PDS effects on NAcc activation for Bad Stop > Bad Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_bad_stop.go ~ gender + iq_z, data=NAcc_bad.stop.go_pds)
main.model <- lm(bilat_NAcc_bad_stop.go ~ PDS_mean_score + gender + iq_z, data=NAcc_bad.stop.go_pds)
anova(null.model, main.model) 
# F(1,72)=2.6747, p=0.1063
summary(null.model) 
# (Intercept)   1.4003     0.5973   2.344   0.0218 *
#gender        0.8193     0.7508   1.091   0.2788  
#iq_z         -0.2526     0.4785  -0.528   0.5991

### Dichotomous puberty effects ###
# PDS group effects on NAcc activation for Go > Stop decisions, controlling for sex and IQ
null.model <- lm(bilat_NAcc_go.stop ~ gender + iq_z, data=NAcc_go.stop_pds)
main.model <- lm(bilat_NAcc_go.stop ~ pds_group + gender + iq_z, data=NAcc_go.stop_pds)
anova(null.model, main.model) 
# F(1,73)=0.0567, p=0.8125
summary(null.model) 
# (Intercept)  1.41053    0.55790   2.528   0.0136 *
# gender       0.87414    0.70768   1.235   0.2207  
# iq_z         0.06039    0.45325   0.133   0.8944

# PDS group effects on NAcc activation for Good > Bad outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good.bad ~ gender + iq_z, data=NAcc_good.bad_pds)
main.model <- lm(bilat_NAcc_good.bad ~ pds_group + gender + iq_z, data=NAcc_good.bad_pds)
anova(null.model, main.model) 
# F(1,73)=4.7377, p=0.03274 *
summary(main.model) 
# (Intercept)  -0.5079     0.7920  -0.641   0.5234
# pds_group     1.2562     0.5771   2.177   0.0327 *  
# gender       -0.5254     0.5752  -0.913   0.3640
# iq_z          0.4332     0.3190   1.358   0.1786

# PDS group effects on NAcc activation for Good Stop > Good Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_good_stop.go ~ gender + iq_z, data=NAcc_good.stop.go_pds)
main.model <- lm(bilat_NAcc_good_stop.go ~ pds_group + gender + iq_z, data=NAcc_good.stop.go_pds)
anova(null.model, main.model) 
# F(1,71)=0.4436, p=0.5075
summary(null.model) 
# (Intercept)   0.1964     0.6621   0.297    0.768
#gender        0.8666     0.8367   1.036    0.304
#iq_z         -0.3521     0.5334  -0.660    0.511

# PDS group effects on NAcc activation for Bad Stop > Bad Go outcomes, controlling for sex and IQ
null.model <- lm(bilat_NAcc_bad_stop.go ~ gender + iq_z, data=NAcc_bad.stop.go_pds)
main.model <- lm(bilat_NAcc_bad_stop.go ~ pds_group + gender + iq_z, data=NAcc_bad.stop.go_pds)
anova(null.model, main.model) 
# F(1,72)=0.4308, p=0.5137
summary(null.model) 
# (Intercept)   1.4003     0.5973   2.344   0.0218 *
#gender        0.8193     0.7508   1.091   0.2788  
#iq_z         -0.2526     0.4785  -0.528   0.5991 

#####################################################################
## FIGURE 4: AGE AND PUBERTY EFFECTS ON NACC (GOOD > BAD OUTCOMES) ##
#####################################################################
fig.4a <- ggplot(NAcc_good.bad, aes(y = bilat_NAcc_good.bad, x = age, color = gender_flip)) +
  geom_point() +
  geom_smooth(method = lm) +
  labs(x='Age', y='NAcc activation\n(Good > Bad outcomes)', color='Sex') +
  theme(text = element_text(size=16))
ggsave('fig_4a.png', fig.4a)

fig.4b <- ggplot(NAcc_good.bad_pds, aes(y = bilat_NAcc_good.bad, x = PDS_mean_score, color = gender_flip)) +
  geom_point() +
  geom_smooth(method = lm) +
  labs(x='Mean PDS score', y='NAcc activation\n(Good > Bad outcomes)', color='Sex') +
  theme(text = element_text(size=16))
ggsave('fig_4b.png', fig.4b)

#############
## Outlier test using Mahalanobis Distance
#############
df_MD <- df_pds %>% select(subject.name, age, iq, PDS_mean_score, time, go, crash, go_cr)
df_mean_time <- df_MD %>% group_by(subject.name) %>% summarize(mean_time = mean(time))
df_mean_go <- df_MD %>% group_by(subject.name) %>% summarize(mean_go = mean(go))
df_mean_crash <- df_MD %>% group_by(subject.name) %>% summarize(mean_crash = mean(crash))
df_mean_go_cr <- df_MD %>% group_by(subject.name) %>% summarize(mean_go_cr = mean(go_cr))
df_MD <- merge(df_MD, df_mean_time, by = 'subject.name')
df_MD <- merge(df_MD, df_mean_go, by = 'subject.name')
df_MD <- merge(df_MD, df_mean_crash, by = 'subject.name')
df_MD <- merge(df_MD, df_mean_go_cr, by = 'subject.name')
df_MD <- df_MD %>% select(subject.name, age, iq, PDS_mean_score, mean_time, mean_go, mean_crash, mean_go_cr)
df_MD <- unique(df_MD)
df_MD <- df_MD[, -1]

mu <- colMeans(df_MD)
Sx <- cov(df_MD)
D2 <- mahalanobis(df_MD, center = mu, cov = Sx, inverted = TRUE)
D <- sqrt(D2)

plot(density(D2, bw = 0.5),
     main="Squared Mahalanobis distances, \nn=77, p=7") ; rug(D2)

qqplot(qchisq(ppoints(77), df = 7), D2,
       main = expression("Q-Q plot of Mahalanobis" * ~D^2 *
                           " vs. quantiles of" * ~ chi[7]^2))
abline(0, 1, col = 'gray')
