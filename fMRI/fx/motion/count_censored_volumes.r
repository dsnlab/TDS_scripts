rptxtDir <- '/home/research/tds/motion_QC/G80/rp_art_txt/'


library(dplyr)
library(stringr)
library(tidyr)
library(knitr)

setwd(rptxtDir)
rawmotion<-data.frame(rp_file=list.files(path=rptxtDir, recursive=T, pattern='^rp_.*\\.txt')) %>% # Make the directory listing into a data frame
# 	slice(1:2) %>% # for testing
	group_by(rp_file) %>% # Group by each rp_file
	do( # For each rp_file, do:
		read.table( # read the text file as if it's a data table (which it is)
			file=as.character(.$rp_file[1]),
			col.names=c('abs_trans','abs_rot','deriv_trans','deriv_rot','thresh')) %>%
			mutate(vol=1:n())
		)
#If there is an error above it probably means one of the files is empty
rawmotion_clean <- rawmotion %>% ungroup() %>%
	extract(rp_file, c('SID', 'run'), 'rp_t([0-9]{3})_(\\w+)\\.txt') %>%
	mutate(SID=as.numeric(SID))

rawmotion_clean %>% 
  group_by(SID, run) %>%
  summarize(nCensored=sum(thresh>0), nTot=n(), pCensored=nCensored/nTot) %>%
  filter(pCensored>0) %>%
  kable(digits=2,
        caption="Participant runs with some volume censoring")
