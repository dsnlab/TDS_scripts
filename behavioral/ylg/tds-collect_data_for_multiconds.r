#########
#!!! Remember to run 'module add R' at the command line first
#########
#Paths are set to run locally, not on the grid.
#If you want to run this whole file, you can copy/paste the line below into the console in R Studio. 
#Don't uncomment it, or it will recursively run itself.

osuRepo<-'http://ftp.osuosl.org/pub/cran/'

#Check if the packages we need are installed, and if not, install them
packages<-c('dplyr', 'tidyr', 'data.table', 'R.matlab')
if(length(setdiff(packages, rownames(installed.packages())))>0) {
  install.packages(setdiff(packages, rownames(installed.packages())))
}
lapply(packages, library, character.only=TRUE)

## CHANGE IF NEEDED ##
tds_folder<-'/Volumes/TDS/'
behave_folder<-'Data_Behavioral/YLG/'
scans_folder<-'/Users/ralph/Documents/tds/fMRI/subjects'

files_folder<-paste(tds_folder,behave_folder,'raw/',sep='')
folder_to_write_agglom<-paste(tds_folder,behave_folder,'processed/',sep='')
files_to_read<-as.list(dir(files_folder,recursive=T,pattern='csv_run_output.*csv$'))
intersection_types_file<-paste(files_folder,'intersection_types.csv',sep='')
scans_to_count_folder<-paste(scans_folder,sep='')
scans_to_count<-data.table(scan_files=dir(
	scans_to_count_folder,
	recursive=T,
	pattern='^stop[3-8]_[0-9]+\\.nii'))
#############################
counted_scans<-scans_to_count %>%
filter(grepl('^[0-9]{3}',scan_files)) %>%
mutate(
	sid=as.numeric(
		sub('^([1-9][0-9][0-9]).*','\\1',scan_files)),
	rid=as.numeric(
		sub('^[1-9][0-9][0-9].*/stop([3-8])/.*','\\1',scan_files)),
	trid=as.numeric(
		sub('^[1-9][0-9][0-9].*/stop[3-8]_([0-9]+)\\.nii','\\1',scan_files))) %>%
group_by(sid,rid) %>%
summarise(n_vols=n(),max_trid=max(trid)) %>%
mutate(run_length=n_vols*2000)# %>%
# #chain this in if you want to check that the count is the same as the max
# #volume number coded in the file name:
# mutate(check=n_vols==max_trid) %>% filter(!check) %>% kable()
# ungroup() %>%
# summarise(checkcheck=all(check))

intersection_types<-fread(intersection_types_file) %>% 
gather(`profile-name`,value) %>% separate(value,c('intersection_num','type'),sep=-2) %>% 
group_by(`profile-name`) %>%
mutate(trial_index=1:n()) %>%
left_join(data.table(
		type=c('E','M','L'),
		crash_prob=c(.75,.5,.25))) %>%
arrange(`profile-name`,trial_index) %>% as.data.table

setwd(files_folder)

reload_data <- FALSE #Set to TRUE, is you want to reload the data
if(reload_data){
  sl_data<-lapply(
    files_to_read,
    fread) %>% 
    rbindlist()  
  saveRDS(sl_data, file = paste0(folder_to_write_agglom, 'sl_data.RDS'))
} else {
  sl_data <- readRDS(file = paste0(folder_to_write_agglom, 'sl_data.RDS'))
}

#sl_data_copy<-copy(sl_data)
#sl_data<-copy(sl_data_copy)

sl_numeric_cols<-c(1:2,4:6,9:12,15,17:18)

## CHANGE IF NEEDED ##
# Edits to specific subjects' data
sl_data[`subject-name`=='107C',`subject-name`:='107'] # For some reason this subject has a misnamed run
sl_data[`subject-name`=='170' & grepl('2015-04-25', `when-run-started`),`subject-name`:='168'] # Accidentaly misnamed subject for all runs
sl_data[`subject-name`=='174' & grepl('2015-05-02', `when-run-started`),`subject-name`:='172'] # Accidentaly misnamed subject for practice runs only
sl_data[`subject-name`=='317' & grepl('2014', `when-run-started`),`subject-name`:='999'] # Andrew's runs (his fake ID was 317)
sl_data[`subject-name`=='364' & grepl('2014', `when-run-started`),`subject-name`:='999'] # Natalie's runs (her fake ID was 364)
sl_data[`subject-name`=='348' & grepl('2016-11-12', `when-run-started`),`subject-name`:='999'] # Subject got sick, came back and redid practice runs
#######################
# Filters subjects with subIDs starting with 1|3|4 and containing 3 numbers
sl_data <- sl_data[grepl('^[134][0-9][0-9]$', `subject-name`),]

#Shouldn't get any warnings here
sl_data[,(sl_numeric_cols):=lapply(.SD,as.numeric),.SDcols=sl_numeric_cols]
format(object.size(sl_data),units='Mb')
# sl_data%>%summarise_each(funs(isna=sum(is.na(.))))
# sl_data[is.na(`scenario-ms`),]
# sl_data_copy[`subject-id`==48,]
# sl_data_copy[`run-id`==76 & `intersection-id`==678,]

sl_data[,
	trial_index:=1+`intersection-id`-min(`intersection-id`),
	by=list(`run-id`,`subject-name`)]

#Evidence of duplicates
sl_data[,list(N=dim(.SD)[1]),by=list(`run-id`,`subject-name`)][N==40,]
sl_data[`run-id`==1148,]

sl_data<-copy(unique(sl_data)) # MAKE SURE NO KEY IS SET

# %>% distinct(run_rank) #Should only have 8 run_ranks below
setorder(sl_data,`subject-name`,`when-run-started`)
run_ranks_data<-copy(sl_data[,
	list(run_index=rank(unique(`when-run-started`)),
		`when-run-started`=unique(`when-run-started`)),
	by=`subject-name`])
setkey(run_ranks_data,`subject-name`,`when-run-started`)
setkey(sl_data,`subject-name`,`when-run-started`)
# sl_data[run_ranks_data]
sl_data<-copy(run_ranks_data[sl_data])
setkey(intersection_types,`profile-name`,trial_index)
setkey(sl_data,`profile-name`,trial_index)
sl_data<-copy(intersection_types[sl_data])
sl_data[,subject_index:=.GRP,by=`subject-name`]

setorder(sl_data,`subject-name`,`run_index`,`trial_index`)

# Prints YLG behavioral data for behavioral analysis:
write.csv(sl_data,file=paste(folder_to_write_agglom,'/tds-all_trial_by_trial.csv',sep=''))

##FILTERING OUT SID THAT DID BEHAVIORAL SESSION (no MRI)
multicond_dt<-copy(sl_data) %>% 
filter(!(`subject-name` %in% c(103, 107, 112, 138, 143, 176, 191, 305, 318, 319, 339, 345))) %>%
group_by(scenario,decision) %>%
do({
	aDT<-data.table(
		sid=as.numeric(.$`subject-name`),
		rid=as.numeric(.$run_index),
		tid=.$trial_index,
		game_end=.$`run-time-ms`+3000,
		decision_name={
			if (is.na(.$decision[[1]])) 'GO'
			else if (.$decision[[1]] == 'NONE') 'NONE'
			else .$decision[[1]]			
		},
		decision_onset=.$`yellow-light-ms`+3000, 
		decision_duration=0,  #this could be 0 or `decision-ms` - `yellow-light-ms`
		outcome_onset=.$`scenario-ms`+3000,
		outcome_duration=0,
		outcome_name={
			if (is.na(.$scenario[[1]])) 'MISS'
			else if (.$scenario[[1]] == 'CROSSCAR') 'CR'
			else if (.$scenario[[1]] == 'CRASH') 'MISS'
			else if (.$scenario[[1]] == 'PENALTY') 'PENALTY'
			else if (.$scenario[[1]] == 'SAFE' & .$decision[[1]] == 'GO') 'HIT'
			else if (.$scenario[[1]] == 'SAFE' & .$decision[[1]] == 'STOP') 'FA'
			else 'NONE'
		})
	aDT
}) %>% arrange(sid, rid, tid) %>% as.data.table

multicond_dt_with_scan_length<- copy(multicond_dt)%>% 
ungroup %>%
left_join(counted_scans) %>% as.data.table

multicond_dt_decout<-copy(multicond_dt_with_scan_length)%>% 
unite(decision_outcome_name,decision_name,outcome_name)%>% as.data.table

unique(multicond_dt_decout$decision_outcome_name)

multicond_dt_decout[,
	decision_outcome_name:=factor(
		decision_outcome_name,
		levels=c(
			'GO_HIT','GO_MISS','STOP_CR','STOP_FA','STOP_NONE','NONE_PENALTY'))]
multicond_dt_decout[,
	decout_name_num:=as.numeric(decision_outcome_name)]

multicond_dt_decout_outcomes<-copy(multicond_dt_with_scan_length)%>% 
  unite(decision_outcome_name,decision_name,outcome_name) %>%
  arrange(sid,rid,tid) %>%
  select(
    sid,rid,tid,
    decision_outcome_name,
    decision_onset,
    decision_duration,
    outcome_onset,
    outcome_duration,
    game_end) %>%
  gather(
    key,value,
    decision_onset,decision_duration,outcome_onset,outcome_duration) %>%
  separate(key,c('d_or_c','ons_or_dur'),extra='merge',sep='_') %>%
  unite(condition,decision_outcome_name,d_or_c) %>%
  ungroup() %>%
  spread(ons_or_dur,value)%>% as.data.table

unique(multicond_dt_decout_outcomes$condition)

multicond_dt_decout_outcomes[,
                    condition:=factor(
                      condition,
                      levels=c(
                        'GO_HIT_decision','GO_MISS_decision','STOP_CR_decision','STOP_FA_decision',
                        'GO_HIT_outcome','GO_MISS_outcome','STOP_CR_outcome','STOP_FA_outcome',
                        'NONE_PENALTY_decision','NONE_PENALTY_outcome'))]
multicond_dt_decout_outcomes[,
                             condition_num:=as.numeric(condition)]

multicond_dt_decout_collapsed<-copy(multicond_dt_with_scan_length) %>%
unite(decision_outcome_name,decision_name,outcome_name) %>%
mutate(
	supercondition_name=rep(c('mock','alone','peer','excl'),each=2)[rid],
	supercondition_id=rep(c(1:4),each=2)[rid]) %>%
group_by(sid,supercondition_id) %>%
mutate(run_length_previous=lag(run_length,20,default=0)) %>% 
mutate(
	decision_onset_c=decision_onset+run_length_previous,
	outcome_onset_c=outcome_onset+run_length_previous,
	game_end_c=game_end+run_length_previous) %>%
ungroup() %>%
arrange(sid,rid,tid) %>%
select(
	sid,supercondition_id,rid,tid,
	decision_outcome_name,
	decision_onset_c,
	decision_duration,
	outcome_onset_c,
	outcome_duration,
	game_end_c) %>%
gather(
	key,value,
	decision_onset_c,decision_duration,outcome_onset_c,outcome_duration) %>%
separate(key,c('d_or_c','ons_or_dur'),extra='merge',sep='_') %>%
unite(condition,decision_outcome_name,d_or_c) %>%
ungroup() %>%
spread(ons_or_dur,value)%>% as.data.table

# unique(multicond_dt_decout_collapsed$condition)

multicond_dt_decout_collapsed[,
	condition:=factor(
		condition,
		levels=c(
			'GO_HIT_decision',
			'GO_MISS_decision',
			'STOP_FA_decision',
			'STOP_CR_decision',
			'GO_HIT_outcome',
			'GO_MISS_outcome',
			'STOP_FA_outcome',
			'STOP_CR_outcome',
			'NONE_PENALTY_decision','NONE_PENALTY_outcome'))]
multicond_dt_decout_collapsed[,
	condition_num:=as.numeric(condition)]
multicond_dt_decout_collapsed[,list(condition,condition_num)]

# %>%
# select(sid,rid,tid,supercondition_id,run_length,run_length_previous,outcome_onset,outcome_onset_c) %>% 
# slice(101:150) %>%
# kable

multicond_dt_long<-copy(multicond_dt_with_scan_length) %>% ungroup() %>%
select(-scenario,-decision) %>%
gather(key,value,-sid,-rid,-tid,-game_end,-run_length) %>%
separate(key,c('type','var'),sep='_') %>%
spread(var,value,convert=T)%>% as.data.table

multicond_dt_long[,
	name:=factor(
		name,
		levels=c(
			'GO','STOP',
			'HIT','MISS','FA','CR','NONE', 'PENALTY'))]
multicond_dt_long[,
	name_num:=as.numeric(name)]

setkey(multicond_dt_long,sid,rid,tid)
setkey(multicond_dt_decout,sid,rid,tid)
setkey(multicond_dt_decout_outcomes,sid,rid,tid)
setkey(multicond_dt_decout_collapsed,sid,rid,tid)

#write.csv(multicond_dt_long,file=paste(folder_to_write_agglom,'/tds-multi_cond_basis_long.csv',sep=''))
#write.csv(multicond_dt_decout,file=paste(folder_to_write_agglom,'/tds-multi_cond_basis_decout.csv',sep=''))
#write.csv(multicond_dt_decout_outcomes,file=paste(folder_to_write_agglom,'/tds-multi_cond_basis_decout_outcomes.csv',sep=''))
write.csv(multicond_dt_decout_collapsed,file=paste(folder_to_write_agglom,'/tds-multi_cond_basis_decout_collapsed.csv',sep=''))

multicond_for_processingMat_long<-na.omit(as.matrix(
	multicond_dt_long[
		rid %in% 3:8,
		list(
			sid,rid,tid,
			name_num,
			onset,
			duration,
			game_end)]))

multicond_for_processingMat_decout<-na.omit(as.matrix(
	multicond_dt_decout[
		rid %in% 3:8,
		list(
			sid,rid,tid,
			decout_name_num,
			decision_onset,
			decision_duration,
			outcome_onset,
			outcome_duration,
			game_end)]))

multicond_for_processingMat_decout_outcomes<-na.omit(as.matrix(
  multicond_dt_decout_outcomes[
    rid %in% 3:8,
    list(
      sid,rid,tid,
      condition_num,
      onset,
      duration,
      game_end)]))


multicond_for_processingMat_decout_collapsed<-na.omit(as.matrix(
	multicond_dt_decout_collapsed[
		rid %in% 3:8,
		list(
			sid,supercondition_id,tid,
			condition_num,
			onset_c,
			duration,
			game_end_c)]))

# writeMat(
# 	paste(folder_to_write_agglom,'/tds-multicond_for_processing_long.mat',sep=''),
# 	multicondSRC=multicond_for_processingMat_long)
# writeMat(
# 	paste(folder_to_write_agglom,'/tds-multicond_for_processing_decout.mat',sep=''),
# 	multicondSRC=multicond_for_processingMat_decout)
# writeMat(
#   paste(folder_to_write_agglom,'/tds-multicond_for_processing_decout_outcomes.mat',sep=''),
#   multicondSRC=multicond_for_processingMat_decout_outcomes)
writeMat(
	paste(folder_to_write_agglom,'/tds-multicond_for_processing_decout_collapsed.mat',sep=''),
	multicondSRC=multicond_for_processingMat_decout_collapsed)

#### Check to make sure reaction time and number of events is similar across peer and exclusion runs
# 
# excl_sid<-c(101:108,110,111,127,134,164,176,179)
# multicond_dt_decout_collapsed_check<-copy(multicond_dt_decout_collapsed) %>%
#   filter(!sid %in% excl_sid)
# 
# n_events_per_s<-
#   multicond_dt_decout_collapsed_check %>% 
#   filter(
#     supercondition_id %in% c(3,4),
#     condition_num %in% 1:4) %>%
#   group_by(condition,sid,supercondition_id) %>%
#   summarise(n_conds=n(),m_dur=mean(duration))
# 
# library(ggplot2)  
# ggplot(n_events_per_s,aes(x=n_conds))+geom_histogram()+facet_grid(supercondition_id~condition)
# ggplot(n_events_per_s,aes(x=m_dur))+geom_histogram()+facet_grid(supercondition_id~condition)
# 
# n_events_per_s %>% filter(n_conds < 3)
# n_events_per_s %>% filter(sid==155)
# multicond_dt_decout_collapsed_check %>% filter(sid==155,condition=='GO_MISS_decision')
# 
# n_events_per_s_run<-
#   multicond_dt_decout_collapsed_check %>% 
#   filter(
#     supercondition_id %in% c(3,4),
#     condition_num %in% 1:4) %>%
#   group_by(condition,sid,rid) %>%
#   summarise(n_conds=n(),m_dur=mean(duration))
# 
# library(knitr)
# n_events_per_s_run %>% filter(n_conds < 2)  %>% kable
# 
# m_n_events<-n_events_per_s %>% 
#   group_by(condition,supercondition_id) %>%
#   summarise(m_n_conds=mean(n_conds),med_n_cons=as.double(median(n_conds)))
# 
# m_dur<-multicond_dt_decout_collapsed_check %>% 
#   filter(supercondition_id %in% c(3,4), condition_num %in% 1:4) %>%
#   group_by(condition,supercondition_id) %>%
#   summarise(m_dur=mean(duration))
# 
# amod_coef<-as.data.frame(coef(summary(lmer(duration~1+(1|sid),data=multicond_dt_decout_collapsed_check))))
# amod_coef$param<-rownames(amod_coef)
# 
# n_events_per_s %>% 
#   group_by(condition) %>%
#   do({
#     x<-.[supercondition_id==3,n_conds]
#     y<-.[supercondition_id==4,n_conds]
#     rez<-t.test(x,y,paired=T)
#     data.frame(
#       m_x=mean(x),
#       m_y=mean(y),
#       estimate=rez$estimate,
#       t=rez$statistic,
#       p=rez$p.value)
#   })
# 
# library(lme4)
# multicond_dt_decout_collapsed_check %>% 
#   filter(supercondition_id %in% c(3,4), condition_num %in% 1:4) %>%
#   group_by(condition) %>%
#   do({
#     data<-.
#     data$peer_cond_factor<-factor(data$supercondition_id)
#     rez<-lmer(duration~1+peer_cond_factor+(1+peer_cond_factor|sid),data=data)
#     coef_rez<-as.data.frame(coef(summary(rez)))
#     coef_rez$param<-rownames(coef_rez)
#     coef_rez
#   })

