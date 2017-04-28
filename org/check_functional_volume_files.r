#####
# This script tells you how many volumes are found, and wether they're sequential
#  in order to help check that there are no missing volumnes.
##

#We live in the tidyverse
packages <- c("tidyverse", "knitr")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}
lapply(packages, library, character.only = TRUE)

#####
# Options
##
subject_data_location <- '/home/research/tds/fMRI/subjects/tds1'
subject_number <- '347'
# This regular expression determines which files get listed below.
search_regex <- paste0(file.path(subject_data_location, subject_number), '/\\w+/\\(cyb\\|vid\\|stop\\).*nii$')
extract_regex <- paste0(file.path(subject_data_location, subject_number), '/\\w+/(cyb[1-8]|stop[1-8]|vid[1-8])_([0-9]+)\\.nii')
#####

datalocation <- file.path(subject_data_location, subject_number)
#use `find` to get a list of scans
system_command <- paste0('find ', datalocation,' -regex "', search_regex, '" -exec ls -l "{}" \\;')
#run the command
system_output <- system(system_command, intern=T)
if(!length(system_output)>0){
  stop('System command did not run properly')
}
#turn the output into one long string separated by newlines for read_table below
system_output_one_string <- paste(system_output, collapse='\n')

someDat <- read_table(system_output_one_string, col_names=F) %>% # no col names
  select(X5, X9) %>%
  rename(size=X5, file=X9) %>%
  extract(file, 
          c('run', 'number'), #we need to separate the run and volume number
          extract_regex) %>%
  arrange(run, number) %>% 
  group_by(run) %>%
  mutate(number=as.numeric(number), #make volumne number numeric
         dist_from_prev=number-lag(number)) #subtract each previous volume number from this one (it should always be 1 less)

someDat %>% group_by(run) %>% # for each run
  filter(number != 1) %>% # don't use the first volume
  summarize(sequential=all(dist_from_prev==1), # check that all volumes are 1 number away from the next
            bigenough=all(size > 1000000), # check that all are at least 1MB big
            n=n()) %>% # count the volumes
  kable(format='pandoc')
