
# Average individual level acf estimates
# Authors: Theresa W. Cheng, Nandita Vijayakumar
# Date created; 11/21/2016; Last modified: 6/16/2017

# This script should be run after "acquireACFest.sh". It outputs the mean and median of the individual level acf estimates from second level residuals. The decision to use the mean versus the median is up to the researcher, and might be based on the usual considerations (e.g., examining the distribution and/or presence of outliers). The first three values of either the mean or median are the input for 3dClustSim. 

library(plyr)

# Inputs
rm(list=ls())
rx_directory="/projects/dsnlab/tds/fMRI/analysis/rx/ylg/alone/tds2_n79/regr/cov_puberty/9-bad_go-stop"

# Code
setwd(rx_directory) 
logs=list.files(pattern='log*') # list log files

df.logs=lapply(logs, read.table) # read in the list of files
df.logs=ldply(df.logs, data.frame) # combine the list into one dataframe

df.logs.acf=df.logs[(seq(2,to=nrow(df.logs),by=2)),] #take even rows (aka use acf values and ignore fwhm values)

summarise(df.logs, mean1=mean(df.logs.acf$V1), mean2=mean(df.logs.acf$V2), mean3=mean(df.logs.acf$V3), mean4=mean(df.logs.acf$V4)) #summarise results: mean

summarise(df.logs, median1=median(df.logs.acf$V1), median2=median(df.logs.acf$V2), median3=median(df.logs.acf$V3), mean4=median(df.logs.acf$V4)) #summarise results: median

