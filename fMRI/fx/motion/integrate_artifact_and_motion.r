newrptxtDir <- '/home/research/tds/motion_QC/G80/rp_art_txt/'
rptxtDir <- '/home/research/tds/motion_QC/G80/rp_txt/'
artifactDir <- '/home/research/tds/motion_QC/G80/manual_artifacts/'

library(dplyr)
library(stringr)
library(tidyr)
library(knitr)

artifacts <- data.frame(art_file=list.files(path=artifactDir, pattern='.*\\.csv')) %>%
	group_by(art_file) %>% # Group by each rp_file
	# slice(1:2) %>% # for testing
	do( # For each do:
		read.csv(file=paste0(artifactDir,as.character(.$art_file[1])),
			 colClasses='character')
		)

artifacts_clean <- artifacts %>% ungroup %>% 
	select(-art_file, -FSL.Vol..) %>%
	mutate_each(funs(str_replace_all(., c('^[a-zA-Z]$'='1', '^$'='0'))), -SID, -Real.Vol..) %>%
	mutate_each(funs(as.numeric)) %>%
	rename(vol=Real.Vol..) %>% 
	gather(run, artifact, -SID, -vol) %>%
	filter(artifact == 1)

artifacts_clean %>% select(run) %>% distinct

setwd(rptxtDir)
rawmotion<-data.frame(rp_file=list.files(path=rptxtDir, recursive=T, pattern='^rp_.*\\.txt')) %>% # Make the directory listing into a data frame
	# slice(1:2) %>% # for testing
	group_by(rp_file) %>% # Group by each rp_file
	do( # For each rp_file, do:
		read.table( # read the text file as if it's a data table (which it is)
			file=as.character(.$rp_file[1]),
			col.names=c('abs_trans','abs_rot','deriv_trans','deriv_rot','thresh')) %>%
			mutate(vol=1:n())
		)
rawmotion_clean <- rawmotion %>% 
	extract(rp_file, c('SID', 'run'), 'rp_t([0-9]{3})_(\\w+)\\.txt') %>%
	mutate(SID=as.numeric(SID))

motionArtRegs <- left_join(rawmotion_clean, artifacts_clean) %>%
	mutate(trash=as.numeric(!is.na(thresh | artifact)))


# motionArtRegs %>% filter(trash == 1) %>% select(SID, vol, thresh, artifact, trash) %>% kable

# left_join(rawmotion_clean %>% group_by(SID) %>%
# 	summarise(n1=n()),
# 	motionArtRegs %>% group_by(SID) %>%
# 		summarise(n2=n())) %>% 
# 	mutate(same=n1==n2) %>% kable

col_names_for_rp_write <- c('abs_trans', 'abs_rot', 'deriv_trans', 'deriv_rot', 'trash') 

rp_files_written <- motionArtRegs %>% 
	arrange(SID,run,vol) %>% 
	group_by(SID,run) %>% 
	select_(.dots=col_names_for_rp_write) %>% #select with a '_' after, and .dots lets us give `select` a vector of characters instead of raw column names
	do({
		fname=paste(
			newrptxtDir,
			'rp_t',.$SID[[1]],'_',.$run[[1]],'.txt',
			sep='')
		write.table(
			.[,c(-1,-2)],
			fname,
			quote=F,
			sep='   ',
			row.names=F,
			col.names=F)
		data.frame(rp_file_name=fname)
	})
