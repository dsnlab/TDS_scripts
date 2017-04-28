library(stringr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(cowplot)
library(lme4)
library(knitr)
jftheme <- theme_cowplot()+
  theme(axis.line=element_line(size=0),
        strip.background=element_rect(fill='white'))
theme_set(jftheme)
 
REESTIMATE_BINOM_MODEL=T
excl_ids <- c(110) # 110 didn't play the same game
root_dir <- '/home/' # This would be '/Volumes/' if you've mounted locally
raw_data_dir <- paste0(root_dir, 'research/tds/behavioral/raw/split/')
processed_data_dir <-  paste0(root_dir, 'research/tds/behavioral/processed/split/')
#previous iterations of this task included 'BannasOranges' and we don't want those trials
conditions <- c('HungryThirsty', 'DatingLooking', 'PopularUnpopular')
#We will use this later to separate the metacog questions from trial behavior
metacog_condition <- 'Confidence'
file_match_pattern <- 'split.*csv'

#This turns estimates on the logit scale back into probabilities
invlogit <- function(x) {
  exp(x)/(exp(x)+1)
}

files <- data_frame(file=dir(path=raw_data_dir, pattern=file_match_pattern)) 

splitDF_raw <- files %>% 
  extract(file, c('filename', 'id', 'timestamp'), 
          '(split-([0-9]{3}|bad_pid)[-_]([0-9]+)\\.csv)') %>% 
  filter(id < 500 & !id %in% excl_ids) %>%
  group_by(filename, id, timestamp) %>%
  do({dat=read.csv(paste0(raw_data_dir, .$filename[[1]]), stringsAsFactors=F)})

splitDF_ <- splitDF_raw %>%
  filter((trial_id == 'stim' & (key_press>0 | key_press==-1)) | (trial_id == 'metacog')) %>%
  extract(image, c('stim_image', 'sex'), '.*/(([fma])_f42887_e_[0-9]{3}\\.png)') %>%
  mutate(correcttrue=ifelse(key_press==-1, NA, as.numeric(correct=='true'))) %>%
  rowwise %>%
  mutate(condition=paste(sort(unlist(str_split(context, '_'))), collapse=''), 
         condition=ifelse(trial_id=='metacog', 'Confidence', condition),
         correcttrue=ifelse(trial_id=='metacog', 
                            as.numeric(score_response), correcttrue)) %>%
  filter(condition %in% c(conditions, metacog_condition)) %>%
  group_by(id, condition) %>%
  mutate(condition_trial_index=1:n(),
         block=((condition_trial_index-1) %/% 16) +1) %>%
  ungroup() %>%
  select(id, correcttrue, condition, condition_trial_index, sex, stim_image, trial_index, block)

metacogDF <- splitDF_ %>% 
  select(-sex, -stim_image) %>%
  filter(condition == metacog_condition,
         !is.na(correcttrue)) %>%
  mutate(block=(condition_trial_index+1)/2) %>% 
  spread(condition, correcttrue) %>%
  rename(confidence=Confidence) %>%
  select(-condition_trial_index, -trial_index)

splitDF<- splitDF_ %>% filter(condition != metacog_condition) %>%
  left_join(metacogDF) %>%
  mutate(scaled_index=scale(condition_trial_index),
         condition=factor(condition, levels=conditions, labels=abbreviate(conditions)))

write.csv(splitDF, file=paste0(processed_data_dir, 'tds2-split_data.csv'))

splitDF %>% filter(!is.na(correcttrue)) %>%
  group_by(id) %>% 
  distinct(condition) %>%
  summarise(n_conds=n()) %>%
  kable

splitDF %>%  filter(!is.na(correcttrue)) %>%
  group_by(id, condition, block) %>%
  summarise(n_trials=n(),
            pcor=mean(correcttrue, na.rm=T),
            confidence=unique(confidence)) %>%
#   select(-n_trials) %>%
  gather(key, value, n_trials, pcor, confidence) %>%
  unite(cond_stat, condition, key) %>%
  spread(cond_stat, value) %>%
  kable(digits=2)

#estimating this model takes awhile
if(REESTIMATE_BINOM_MODEL){
  binomMod_allRE <- glmer(correcttrue~1+
                      condition*scaled_index+
                      (1+condition*scaled_index|id),
                    family='binomial',
                    control = glmerControl(optimizer = c("bobyqa", "Nelder_Mead")),
                    data=splitDF)
  binomMod_intRE <- glmer(correcttrue~1+
                      condition*scaled_index+
                      (1|id),
                    family='binomial',
                    control = glmerControl(optimizer = c("bobyqa", "Nelder_Mead")),
                    data=splitDF)
  saveRDS(binomMod_allRE, file=paste0(processed_data_dir, 'split_binomMod_allRE.RDS'))
  saveRDS(binomMod_intRE, file=paste0(processed_data_dir, 'split_binomMod_intRE.RDS'))
} else {
  binomMod_allRE <- readRDS(file=paste0(processed_data_dir, 'split_binomMod_allRE.RDS'))
  binomMod_intRE <- readRDS(file=paste0(processed_data_dir, 'split_binomMod_intRE.RDS'))
}

splitDF$p_correcttrueRE <- predict(binomMod_allRE, newdata=splitDF, type='response')
splitDF$p_correcttrueFE <- predict(binomMod_allRE, newdata=splitDF, type='response', re.form=~0)

summary(binomMod_allRE)

idPlot_raw <- ggplot(splitDF, aes(x=condition_trial_index, y=correcttrue, group=id))+
  geom_line(aes(color='ids'), 
            stat='smooth', 
            method='loess')+
  geom_line(aes(group=NULL, color='beh'), 
            stat='smooth', 
            method='glm', 
            formula=y~poly(x,2), 
            method.args=list(family='binomial'),
            size=1)+
  geom_line(aes(group=NULL, color='beh_loess'), 
            stat='smooth', 
            method='loess', 
            size=1)+
  geom_line(aes(y=(confidence-1)/(5-1), group=NULL, color='conf'), 
            stat='smooth', 
            method='loess', 
            size=1)+
  scale_color_manual(breaks=c('beh', 'beh_loess', 'conf', 'ids'),
                     labels=c('Avg. Behavior', 'Avg. LOESS', 'Confidence', 'Indiv. Behavior'),
                     values=c('red', 'salmon', 'blue', '#bbbbbb'))+
  facet_wrap(~condition)
ggplot2::ggsave(filename = paste0(processed_data_dir, 'tds2-raw_behav_plot.svg'), 
                plot = idPlot_raw,
                width = 10,
                height= 6,
                dpi=150,
                units='in')

idPlot_mod <- ggplot(splitDF, aes(x=condition_trial_index))+
  geom_line(aes(y=correcttrue, group=id, color='ids_raw'), 
            stat='smooth', 
            method='loess', size=.25, alpha=.5)+
  geom_line(aes(y=p_correcttrueRE, group=id, color='p_RE'), alpha=.5)+
  geom_line(aes(y=p_correcttrueFE, color='p_FE'), size=1)+
  scale_color_manual(breaks=c('ids_raw', 'p_FE', 'p_RE'),
                     labels=c('Indiv. Behavior', 'Model FE', 'Model RE'),
                     values=c('#bbbbbb', 'red', 'blue'))+
  facet_wrap(~condition)+
  coord_cartesian(y=c(-.1, 1.1))
ggplot2::ggsave(filename = paste0(processed_data_dir, 'tds2-mod_behav_plot.svg'), 
                plot = idPlot_mod,
                width = 10,
                height= 6,
                dpi=150,
                units='in')

#+results='asis'
cat(paste0('![](',processed_data_dir, 'tds2-raw_behav_plot.svg)'))
cat(paste0('![](',processed_data_dir, 'tds2-mod_behav_plot.svg)'))
