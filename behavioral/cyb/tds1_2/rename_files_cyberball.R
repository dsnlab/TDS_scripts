#Theresa Cheng | Nandita Vijayakumar
#1/19/2016
#This script uses the "byDate" dataframe to rename "agileProgger....csv" files with their appropriate subject ID and run #

#########
#!!! Remember to run 'module add R' at the command line first
#########
#Paths are set to run locally, not on the grid.

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
library(R.matlab)

##Used Fix(byDate) command to rename 141 and 145 files by taking into account that the first run of the day at 10am was a test (DATE: Sat Mar 07 2015); 
##ALSO changed Jun 26 2015 so that the first file was practice, runs 1 and 2 for 187 were appropriately labeled, and the last two that day were also test
## Found row 119_2: SID= 119, Run = 2, stamp=Sun Dec 21 2014 15:53:04 GMT-0800 (PST)
## Labeled 196_2 using the stamp Sat Aug 15 2015 14:40:14 GMT-0700 (PDT)


#define folder locations
tds_folder<-'/Volumes/research/tds/'
cyberball_folder<-'behavioral/cyberball/TDS2_cyberball_data/unmerged'
files_folder<-paste(tds_folder,cyberball_folder,sep='')

setwd(files_folder)

#load files
load("cyberball_renaminglogfiles.RData")

#re-define folder locations (loading the file resets this)
cyberball_folder<-'behavioral/cyberball/TDS2_cyberball_data/unmerged'
labeled_cyberball_folder<-'behavioral/cyberball/TDS2_labeled_cyberball'
files_folder<-paste(tds_folder,cyberball_folder,sep='')
labeled_files_folder<-paste(tds_folder,labeled_cyberball_folder,sep='')

setwd(files_folder)

#list the files 
listFiles<-list.files(files_folder,recursive=T, pattern='agileProgger.*csv$')

#create a for loop which takes the files one by one
for(i in 1:length(listFiles)) 
{
  df<-read.csv(listFiles[i]) #read in the file
  timestamp<-as.character(df[1,2]) #change the timestamp into a character
  labeled_df<-filter(byDate,stamp==timestamp) #match the stamp in the byDate df with the timestamp in the file
  SID<-labeled_df$SID
  run<-labeled_df$run
  
  #renames SID and run within the file
  df$userid<-as.character(df$userid) 
  df$userid[df$userid=="agileProgger"]<-SID
  df$run<-run
  
  #delete irrelevant columns
  df<-df[,-c(5,6)]
  
  #writes the .csv file to a new folder
  setwd(labeled_files_folder)
  write.csv(df, paste("cyb",SID,"_",run,".csv", sep=""))
  setwd(files_folder)
  
}
end


