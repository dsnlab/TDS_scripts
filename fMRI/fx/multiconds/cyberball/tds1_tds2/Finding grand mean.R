# Theresa Cheng | Nandita Vijayakumar
# 4/12/2016
# This script provides descriptive stats for identifying the grand mean for pmods 
# RESULTS: TDS1_TDS2_cyb1: 2.763247
#          TDS1_TDS2_cyb2: 6.229692

```{r, warning=FALSE, echo=FALSE}
# LOAD PACKAGES
osuRepo<-'http://ftp.osuosl.org/pub/cran/'

#Check if the packages we need are installed, and if not, install them
if(!require(plyr)){
  install.packages('plyr',repos=osuRepo)
}
library(plyr)

if(!require(dplyr)){
  install.packages('dplyr',repos=osuRepo)
}
library(dplyr)
if(!require(tidyr)){
  install.packages('tidyr',repos=osuRepo)
}
library(tidyr)
if(!require(data.table)){
  install.packages('data.table',repos=osuRepo)
}
library(data.table)
if(!require(R.matlab)){
  install.packages('R.matlab',repos=osuRepo)
}

if(!require(chron)){
  install.packages('R.matlab',repos=osuRepo)
}
library(chron)
library(R.matlab)
if(!require(knitr)){
  install.packages('R.matlab',repos=osuRepo)
}
library(knitr)
```

```{r, warning=FALSE, echo=FALSE} 
# LOAD FILES
rm(list=ls())

#define folder locations
tds_folder<-'/Volumes/TDS/'
summary_cyberball_folder<-'behavior/CyberBall/multiconds/Summary/tds1_tds2'
summary_files_folder<-paste(tds_folder,summary_cyberball_folder,sep='')
setwd(summary_files_folder)

#list the files 
listFiles<-list.files(recursive=T, pattern='summary_events_cyb[1|3].*_1.csv$') # Can be 1 or 2 to examine inc or exc runs 
```

```{r, warning=FALSE, echo=FALSE}
# MERGE ALL SUMMARY FILES
df<-do.call("rbind", lapply(listFiles, read.csv, header = TRUE))

df_pmod <- subset(df,df$names==4) #change to 3 to identify pmods for computer throws (i.e. exclusion) or 4 to identify pmods for inclusion.

df_pmod$index = NA

for(i in 1:NROW(df_pmod)){
  if (is.na(df_pmod$pmod[i+1])) {
    df_pmod$index[i] = 1}
  else if (!(df_pmod$pmod[i] - df_pmod$pmod[i+1]) == -1) {
    df_pmod$index[i] = 1
  } else {
  }}

df_pmod <- subset(df_pmod,df_pmod$index==1)
mean(df_pmod$pmod)
summary(df_pmod$pmod)
sd(df_pmod$pmod)

