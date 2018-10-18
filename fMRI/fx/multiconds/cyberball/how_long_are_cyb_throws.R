# how long are computer throws to one another?
# how long are player throws to one another?
# T Cheng | 10/15/2018

# load packages, install as needed
packages = c("dplyr", "tidyr", "skimr")

package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE) }})

# load files
multiconds_folder<-'/Volumes/psy-ctn/psy-ctn/TDS/behavior/CyberBall/multiconds/'
labeled_files_folder<-paste(multiconds_folder, 'Labelled_Data/', sep='')
summary_files_folder<-paste(multiconds_folder, 'Summary/tds2/', sep='')
setwd(labeled_files_folder)

#list the files
list_inc_files <- list.files(labeled_files_folder, recursive=T, pattern='cyb[1].*_1.csv$')
list_files <- c(list_inc_files, list.files(labeled_files_folder, recursive=T, pattern='cyb[1].*_2.csv$'))

# initialize the dataframe
df <- read.csv(list_files[1])

# from the second item in the list to the end
for (i in 2:length(list_files)){
  new_df <- read.csv(list_files[i])
  df <- rbind(df, new_df)
}

# format the time 
df$timestamp <- as.character(df$timestamp)
timestamp <- stringr::str_extract(df$timestamp, "\\d\\d:\\d\\d:\\d\\d") # extract timestamp
milliseconds <- stringr::str_extract(df$milliseconds, ".\\d+") # extrat miliseconds w/o "0."
df$time <- paste0(timestamp, milliseconds)

# format as time
#op <- options(digits.secs = 3)
df$temp <- as.POSIXct(df$time, format = "%H:%M:%OS") 

# get the time difference for each type
df <- df %>% 
  mutate(time_diff = 
           round(temp - lag(temp), 3))

# filter out subject 158, who is later excluded due to data quality // also filter out wait time and first throw
df <- df[df$userid != "158" & df$X != 1 & df$X != 2, ]

# label behaviors of interest
df$behavior <- plyr::mapvalues(df$behavior.type, c("throw(player1)", "throw(player3)", "throw(player1-player2)", "throw(player3-player2)", "throw(player1-player3)","throw(player3-player1)"), c("pt_throw", "pt_throw", "cp_to_pt", "cp_to_pt", "cp_to_cp", "cp_to_cp"))

# summarise throws
df_summary <- df %>% 
                      group_by(behavior) %>% 
                      summarise(mean = round(mean(time_diff), 3), 
                                sd = round(sd(time_diff), 3), 
                                min = min(time_diff), 
                                max = max(time_diff))


