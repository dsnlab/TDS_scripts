# Acquire descriptive statistics re: censored volumes in cyberball runs
# T. Cheng | 10.10.2017

packages = c("tidyr", "dplyr", "knitr")

# load packages, install as needed
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE) }})

rm(list=ls())

# acquire relevant summaryRun.csv and subjectList files
df_raw=read.csv("/projects/dsnlab/tds/fMRI/analysis/fx/motion/auto-motion-output/tds2_summaryRun.csv") 
subjList=read.csv("/projects/dsnlab/tds/TDS_scripts/fMRI/fx/shell/schedule_spm_jobs/cyb/tds2/subject_list_fx.txt", header=FALSE, col.names="subjectID")
df=filter(df_raw, run=="cyb1" | run=="cyb2") # filter by the relevant runs
df=left_join(subjList, df) # subject ID list

# acquire descriptive statistics "of those volumes marked for motion..."
df_motion=filter(df, nVols>0)

nVol_min=min(df_motion$nVols)
nVol_max=max(df_motion$nVols)
nVol_mean=mean(df_motion$nVols)
nVol_sd=sd(df_motion$nVols)

percent_min=min(df_motion$percent)
percent_max=max(df_motion$percent)
percent_mean=mean(df_motion$percent)
percentl_sd=sd(df_motion$percent)

tally(df, nVols>0)
