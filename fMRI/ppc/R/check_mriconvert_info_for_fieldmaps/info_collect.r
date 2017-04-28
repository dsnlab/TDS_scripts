library(knitr)
library(tidyverse)
library(data.table)

# go to this subject directory
setwd('/home/research/tds/fMRI/subjects')

# get all the info file filenames
info_files <- data_frame(file=dir(path='./', pattern='*info.txt', recursive=T))

# for each info file, read in the data, and then only save the variables we care about
infoDF <- info_files %>% 
  group_by(file) %>%
  do({
    aDF <- fread(.$file[1])
    names(aDF) <- c('variable', 'value')
    aDF
  }) %>% 
  filter(grepl('(Echo time|Total readout)', variable)) %>%
  spread(variable, value)

##
# infoDF is the data frame we care about. Inspect this however you think best
##

kable(infoDF)
