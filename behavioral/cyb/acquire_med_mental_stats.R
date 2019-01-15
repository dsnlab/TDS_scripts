# get med or mental variables for subjects within TDS cyb N = 69
# T Cheng | 12/29/2018

library(dplyr)

# get SID
get_sid_here <- read.csv("/Volumes/psy-ctn/psy-ctn/TDS/behavior/CyberBall/TDS2_N69_rsq.csv")
get_sid_here <- get_sid_here[1:138, ]
get_sid_here$SID <- as.character(get_sid_here$SID)
subject_ids <- unique(get_sid_here$SID)

# get med or mental variables
med_mental_full <- read.csv("~/Box\ Sync/projects/dim_of_adversity/uo_tds/tc_coded_variables.csv")

med_mental <- med_mental_full %>% 
  filter(med_mental_full$SID %in% subject_ids)

med_or_mental_subjects <- med_mental$SID[which(med_mental$mental_diag_ever | med_mental$medication)]
