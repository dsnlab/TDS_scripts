#'---
#' author: DSN lab
#' title: DSN Lab Qualtrics Survey Collection and Summary
#' output: 
#'   html_document:
#'     toc: true
#'     toc_depth: 2
#'     toc_float: true
#'     self_contained: true
#'     fig_caption: true
#'---
#'
#'
#'
#' # POSSIBLY CONTAINS IDENTIFIABLE PHI
#'
#'
#'
#+ echo=FALSE, results='hide'

### CHANGE THESE VARIABLES ###
source('/projects/dsnlab/tds/TDS_Scripts/behavioral/score_qualtrics_tds/process_qualtrics_options.r')
###############################

### CHANGE THIS IF NECESSARY###
credsFile<-'/Volumes/TDS/behavior/Qualtrics/credentials.yaml.DEFAULT'
#For example, this is what the yaml file should look like, no leading '#'
#And it needs a 3rd line that is just blank, don't ask me why. Obviously fake token here.
#user: tagstudy#oregon
#token: asdasd3143asd148ReMtEBT6grm0opEPuiW2 
# 
###############################

osuRepo<-'http://ftp.osuosl.org/pub/cran/'

#Check if the packages we need are installed, and if not, install them
#+echo=F
packages <- c("rmarkdown", "ggplot2", "dplyr", "devtools", "tidyr", "knitr", "psych", "repmis", "lubridate")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}
lapply(packages, library, character.only = TRUE)

#Set options for knitr
opts_chunk$set(
  warning=FALSE,
  echo=FALSE,
  comment=NA,
  message=FALSE,
  dpi=72,
  dev='png',
  error=TRUE,
  cache=F,
  cache.comments=F)

#This downloads and installs the latest version of
#a package used to query Qualtrics for data.
#It's good to refresh this install each time because it's
#under active development (by John)
install_github('jflournoy/qualtrics')
library(qualtrics)
source('/Users/marge/Documents/tds/behavioral/scripts/score_qualtrics_tds/score_pds.r')

score_items<-function(item_values,scoring_methods,na.rm=F,mean.na.rm=T,scale_name='', scored_scale=''){
  # item_values should be a vector of numbers
  # scoring_methods should be a function that takes a vector, or '1'
  #check that all elements in `scoring` are the same

  if(!all(scoring_methods[1]==scoring_methods))
    stop(paste0('Scoring methods not all the same. Check that you\'re\n', 
         'grouping rows correctly, and that the rubric is correct.\n',
         '(scale name is ',scale_name,', scored scale is ',scored_scale,')\n',
         paste(scoring_methods, collapse='\n')))
  scoring_method<-unique(scoring_methods)
  if (scoring_method==1){
    scoring_func<-mean
    na.rm=mean.na.rm
  }
  else
    scoring_func<-try(get(scoring_method))
  if (class(scoring_func)=='try-error')
    stop(paste('Scoring method "',scoring_method,'" not found. (scale name is ',scale_name,')'))
  if(na.rm)
    do_for_na<-na.exclude
  else
    do_for_na<-na.pass
  scoring_func(do_for_na(item_values))
}

reverse_score<-function(
  item_values,
  min=stop('Must specify min and max score.'),
  max=stop('Must specify min and max score.')){
  rev_items<-max+min-item_values
  rev_items
}

rpi_flip<-function(item_values){
  one_indexes<-item_values==1
  two_indexes<-item_values==2
  item_values[one_indexes]<-2
  item_values[two_indexes]<-1
  item_values
}

get_rubrics<-function(rubric_filenames,source='csv'){
  #Takes a character vector of file paths named 'file'
  #Returns a long data frame of rubrics with names:
  # [1] "file"           "data_file_name" "scale_name"     "column_name"   
  # [5] "reverse"        "transform"      "scored_scale"   "include"       
  # [9] "min"            "max" 
  csv_rubrics<-rubric_filenames %>%
    mutate(file=as.character(file)) %>%
    group_by(file) %>%
    do({
      data_frame(rubric=list(read.csv(.$file[[1]], header=T,stringsAsFactors=F)))
    }) 
  rubric_data_long<-csv_rubrics %>%
    group_by(file) %>%
    do({
      names(.$rubric[[1]])<-tolower(gsub(' ','_',gsub('\\.','_',names(.$rubric[[1]]))))
      aDF<-gather(
        .$rubric[[1]],
        scored_scale,
        include,
        -one_of(
          "data_file_name",
          "scale_name",
          "column_name",
          "reverse",
          "transform",
          "min",
          "max")
      ) %>% mutate_each(funs(as.character))
    }) 
  rubric_data_long
}

get_survey_data<-function(surveysDF,pid_col=sid){
  #Takes the data.frame that is returned by `get_surveys`
  #Returns a long format data.frame of survey data with names
  # "SID variable name"         "item"        "value"       "survey_name"
  survey_data<-survey_info %>% 
    group_by(SurveyID) %>%
    do(
      survey_name=.$SurveyName[[1]],
      survey_data=get_survey_responses(
        creds,
        surveyid=.$SurveyID[[1]])
    )
  long_survey_data<-survey_data %>% 
    filter(dim(survey_data)[1]>0) %>%
    do({
      gather_cols<-names(.$survey_data)[!grepl(pid_col,names(.$survey_data))]
      aDF<-gather_(.$survey_data,
                   'item',
                   'value',
                   gather_cols)
      aDF$survey_name<-.$survey_name
      aDF
    })
  long_survey_data
}

transform_scores<-function(item_values,transformation,min=NA,max=NA){
  #`transformation` should be a function defined in terms of x that will
  #	be applied to the vector of item_values.
  #Conditional logic will be extracted for subsetting, also in terms of x.
  #`min` and `max` will be passed to `reverse_score` and `pomp_score`.
  #check that all elements in `transformation` are the same
  if(!all(transformation[1]==transformation)) 
    stop('Scoring methods not all the same. Check that you\'re 
         grouping rows correctly, and that the rubric is correct.')
  transformation<-unique(transformation)
  if(regexpr('^if *(\\(.*\\))( | *\\{).*',transformation) != -1){
    logic<-sub('^if *(\\(.*\\))( | *\\{).*','\\1',transformation)
    aFunction<-sub('^if *(\\(.*\\))( | *\\{)(.*)','\\3',transformation)
  }
  else {
    logic<-NULL
    aFunction<-transformation
  }
  if(grepl('reverse_score$',aFunction)){
    aFunction<-paste(aFunction,'(x,min,max)')
  }
  if(!grepl('^function(x)',aFunction)){
    aFunction<-paste('function(x) ',aFunction)
  }
  aFunction<-eval(parse(text=aFunction))
  x<-item_values
  if(is.null(logic)){
    aFunction(x)
  }
  else {
    ifelse(
      eval(parse(text=logic)),
      aFunction(x),
      x)
  }
}

score_questionnaire<-function(dataDF,rubricsDF){
  #Takes long-form question data and rubric data, and a logical
  # value specifying whether to use _part2 rubrics.
  #Returns scored scales.
  scores_with_scoring_params<-rubricsDF  %>%
    left_join(
      dataDF,
      by=c(
        #"data_file_name" = "survey_name",
        "column_name" = "item")) %>%
    filter(!(include %in% c(0,NA,'0','NA',''))) # this filters the rubrics
  
  nonNumeric_items = scores_with_scoring_params %>% filter(include %in% 'I')

  transform_scored<-
    scores_with_scoring_params %>%
    group_by(column_name) %>%
    mutate(
      value=as.numeric(
        ifelse(
          !(transform %in% c(0,NA,'')),
          transform_scores(
            value,
            transform,
            min=as.numeric(min[[1]]),
            max=as.numeric(max[[1]])),
          value)))
  
  reverse_scored<-
    transform_scored %>% 
    group_by(column_name) %>% 
    mutate(
      value=as.numeric(
        ifelse(
          reverse %in% 1,
          reverse_score(
            value,
            min=as.numeric(min[[1]]),
            max=as.numeric(max[[1]])),
          value))) %>%
    filter(!include %in% 'I')
  
  non_numeric <- nonNumeric_items %>%
    mutate(na.rm=F) %>%
    group_by(scale_name,scored_scale,SID) %>%
    summarise(
      score=score_items(value,include,na.rm=na.rm[[1]],scale_name=scale_name[[1]],scored_scale=scored_scale[[1]]),
      n_items=sum(!is.na(value)),
      n_missing=sum(is.na(value)),
      method=unique(include))
  
  scored<-reverse_scored %>% 
    mutate(na.rm=F) %>%
    group_by(scale_name,scored_scale,SID) %>%
    summarise(
      score=score_items(value,include,na.rm=na.rm[[1]],scale_name=scale_name[[1]],scored_scale=scored_scale[[1]]),
      n_items=sum(!is.na(value)),
      n_missing=sum(is.na(value)),
      method=unique(include)) %>%
    mutate(
      score=as.character(score)) %>%
    bind_rows(non_numeric,.)
}

score_step_one_and_two<-function(dataDF,rubricsDF){
  #Do step one of the scoring...	
  rubricsDF_part1<-rubricsDF %>% filter(!grepl('part2',scale_name))
  scored<-score_questionnaire(dataDF,rubricsDF_part1)
  #To do step 2, we need to get our names right, and make sure we
  # are only using the necessary rows.
  rubricsDF_part2<-rubricsDF %>% ungroup %>%
    filter(grepl('part2',scale_name)) %>%
    mutate(column_name=tolower(column_name)) %>%
    dplyr::select(-file,-data_file_name) %>%
    mutate(data_file_name=scale_name) %>%
    mutate(data_file_name=sub('(.*)_part2','\\1',data_file_name))
  part2_cols<-unique(rubricsDF_part2$column_name)
  scored.part1<-scored %>% filter(!scored_scale %in% part2_cols)
  dataDF.part2<-scored %>% 
    filter(scored_scale %in% part2_cols) %>%
    rename(survey_name=scale_name,item=scored_scale,value=score)
  scored.part2<-score_questionnaire(dataDF.part2,rubricsDF_part2)
  all_scored<-bind_rows(scored.part1,scored.part2)
  all_scored
}

#Get our Qualtrics user name and API token from a file
#setwd('/home/research/tds/behavioral/scripts/score_qualtrics_template') # run this line when working online from ong#:8787 (ZO)
creds<-creds_from_file(credsFile)

#Filter surveys based on survey name filter defined above and print
survey_info<-get_surveys(creds) %>%
  filter(grepl(survey_name_filter, SurveyName)) %>% 
  filter(!grepl(survey_name_dont_match, SurveyName)) %>% 
  dplyr::select(SurveyID, SurveyName)

#'
#' # Our Surveys
#'

#Print out the list of surveys we collected directly above
kable(survey_info,caption='Our Surveys',format='pandoc')

#download data from qualtrics (this takes a while - be patient!) & replaces -99 with NA
long_survey_data<-get_survey_data(survey_info,pid_col=sid) %>% mutate(value = ifelse(value == -99, NA, value))

#create a data.frame of rubric filenames and use it to import the rubrics
csv_rubrics<-data.frame(file=csv_files)
rubric_data_long<-get_rubrics(csv_rubrics)

#' # A data file for you
#'
#' Data files are written to behavioral/processed/qualtrics/
#'
#' # Surveys taken per participant ID
#'
#' Let's look for weird stuff with regard to how many times kids took surveys. Duplicates are problematic and need to be cleaned before the below is usable.
#'

long_survey_data_nodupes <- long_survey_data %>% ungroup() %>%
  filter(!SID %in% exclude_SID) %>%
  group_by(SID, item) %>% #group by rows with the same item name and SID
  do({ #for each group
    values <- na.exclude(as.numeric(.$value)) #get values in `values` column, make numeric (which yields NA if value==''), and exclude NA (no info, and no possible conflict)
    dropped <- FALSE #Keep track of whether we have to drop this observation due to conflicts
    if(length(values>0) && all(values==values[[1]])){ #if there are multiple values, but they agree (all values are equal to the first value)
      bestValue <- values[[1]] #then just take the first value
    } else {
      #If after excluding missing values, the values are not all the same, this means
      #there must be more than one value, and there are differences between them.
      #There's not a good heuristic here -- this means that either they took the 
      #questionnaire twice and answered differently (in which case, which is the 'right' answer),
      #or there is a problem with the SID column, and we need to figure out if 
      #there is a miscoding of SID. Either way, there is some manual intervention needed so
      #we set the value to NA, and flag this observation as dropped.
      bestValue <- NA
      dropped <- TRUE
    }
    adf <- .[1,] #retain all the info from the first row of this group
    adf$old.value <- list(values) #wrap up all the values from the group, and save them to aid error checking
    adf$value <- bestValue #set the value to what we decided above
    adf$dropped <- dropped #set the dropped flag
    adf #return the new data frame, which should now be 1 row per item per SID.
  })
#If you get warnings, that is probably okay.

#This creates a funciton called clean_this_study(some_data_frame) that returns a cleaned data frame
#The default for the function 'clear_this_study' created by the below R code is to just
#take a data frame, and return that same data frame, unedited. The first time you run
# 'process_qualtrics_data.r' you can look at the output generated in order to help you catch errors
#that you need to deal with in 'clean_this_study.r'. After you've edited 'clear_this_study.r' to
#correct those errors, you can rerun this script.
source('/projects/dsnlab/tds/TDS_scripts/behavioral/score_qualtrics_tds/clean_this_study.r')

long_survey_data_filtered<-long_survey_data_nodupes %>% 
  clean_this_study()
# 	mutate(survey_name=sub('TDS2 ', 'TDS ', survey_name), # make generalizable if this is a problem for other studies
# 	       survey_name=sub('.*CBCL.*', 'CBCL', survey_name))

long_survey_data_filtered %>% 
  dplyr::select(SID,item,value,survey_name) %>% 
  filter(grepl('qid',item)) %>% 
  distinct(SID,value, .keep_all=T) %>% 
  arrange(SID,survey_name) %>% 
  dplyr::select(SID,survey_name) %>% 
  group_by(SID,survey_name) %>%
  summarize(value=n()) %>%
  spread(survey_name, value) %>%
  kable

#'
#' # Gender and age distributions:
#'

# if(!is.na(age_var) & !is.na(gender_var)) {
#   age_gender <- long_survey_data_filtered %>% 
#     filter(item %in% c(age_var,gender_var)) %>%
#     mutate(value=as.numeric(value),
#            item=ifelse(item == age_var, "Age", "Gender"))
#   
#   age_gender %>% 
#     filter(item=='Age') %>% 
#     ggplot(aes(x=as.numeric(value)))+
#     geom_histogram()+
#     xlab('Age')+
#     theme(panel.background=element_rect(fill='white'))
#   
#   age_gender %>% 
#     filter(item=='Gender') %>% 
#     select(value) %>%
#     summarise(Males=sum(value==gender_male),Females=sum(value==gender_female)) %>%
#     kable()
#   
#   age_gender %>% 
#     filter(item %in% c('Age','Gender')) %>%
#     spread(item,value) %>%
#     group_by(Age) %>% 
#     summarise(Males=sum(Gender==gender_male),Females=sum(Gender==gender_female)) %>%
#     kable()
#   
#   age_gender %>% 
#     filter(item %in% c('Age','Gender')) %>%
#     spread(item,value) %>%
#     group_by(Age) %>% 
#     summarise(Males=sum(Gender==gender_male),Females=sum(Gender==gender_female)) %>%
#     gather(Gender,Count,-Age) %>%
#     ggplot(aes(x=Age,y=Gender))+geom_bin2d(aes(fill=Count))
# }
# 
# if(FALSE){
#   demoinfo <- long_survey_data_filtered %>%
#     filter(item %in% c('Age', 'Gender', 'Ethnicity', 'Hispanic', 
#                        'DOB_3_TEXT', 'DOB_2_TEXT', 'DOB_1_TEXT',
#                        'School', 'Grade') |
#              item=='StartDate' & survey_name=='CBCL') %>% 
#     spread(item, value) %>%
#     rename(dob.month=DOB_1_TEXT,
#            dob.day=DOB_2_TEXT,
#            dob.year=DOB_3_TEXT) %>%
#     mutate(date.long=paste(gsub('sept$', 'sep', dob.month), 
#                            dob.day, 
#                            gsub('^97$', '1997', dob.year)),
#            date.num=parse_date_time(date.long, order=c('mdy')),
#            StartDate=ymd_hms(StartDate),
#            ageCBCLint=interval(date.num, StartDate),
#            ageCBCLyrs=time_length(ageCBCLint, 'year'),
#            Grade=gsub('([0-9]{1,2}).*', '\\1', Grade))  
# cat("  
#   #'
#   #' ## CBCL DoB Age
#   #'
#   #' We can get a better age variable by using DoB from the CBCL. First, check that our calculations from CBCL DoB are correct:
#   #' 
# ")
#   
#   demoinfo%>%
#     select(SID,dob.month:dob.year,date.num,ageCBCLyrs)%>%
#     kable(caption='Ages calculated from parent-entered DOB')
#   
#   demoinfo %>% 
#     ggplot(aes(x=as.numeric(ageCBCLyrs)))+
#     geom_histogram(binwidth=.25)+
#     coord_cartesian(x=c(10, 19))+
#     xlab('Age from CBCL birthday')+
#     theme(panel.background=element_rect(fill='white'))+
#     ggtitle('More precise age distribution')
# cat("  
#   #'
#   #' # All demographics, raw
#   #' 
#   #'
# ") 
#   demoinfo%>%kable  
# }

if(hasRPI==1){
  scored_scales <- score_step_one_and_two(long_survey_data_filtered, rubric_data_long)
} else {
  scored_scales <- score_questionnaire(long_survey_data_filtered, rubric_data_long)
}

if(hasPDSS==1) {
    scored_pdss <- score_pdss(long_survey_data_filtered,gender=gender_mix,gendercode=pdss_gender_code)
    scored_scales <- bind_rows(scored_scales, scored_pdss)
}


duplicated.data <- long_survey_data_filtered[duplicated(dplyr::select(long_survey_data_filtered,
                                                               SID, item, survey_name)), ] %>%
  dplyr::select(-value)

# #'
# #' # Auto-scored scales
# #' 
# #' We have a set of scoring rubrics on dropbox that let us automatically score most of the scales. Here are histograms of
# #' scores on all scored scales.
# #'
# #' *Note well*: We're still testing. Let me know if you see anything odd.
# #'
# #+"ScoreHistograms",fig.height=2,fig.width=4,results='asis',dpi=72
# nada<-scored_scales %>% 
#   filter(!method %in% 'I') %>%
#   mutate(score=as.numeric(score)) %>%
#   unite(scale_subscale,scale_name,scored_scale, remove=F) %>%
#   mutate(prop_missing=n_missing/n_items) %>%
#   select(-method, -n_items, -n_missing) %>%
#   gather(aspect, value, score, prop_missing) %>%
#   group_by(scale_name) %>%
#   mutate(scale_index=1:n()) %>%
#   group_by(scale_name, scored_scale) %>%
#   do({
#     scale_name<-.$scale_name[[1]]
#     scored_scale<-.$scored_scale[[1]]
#     if(1 %in% .$scale_index){
#       cat(paste0('\n\n## ', scale_name,'\n\n'))
#     }
#     plot1<-ggplot(., aes(x=value))+
#       geom_histogram()+
#       facet_wrap(~aspect, scales='free', nrow=1)+
#       theme(panel.background=element_rect(fill='white'))+
#       labs(title=paste0(scored_scale))
#     print(plot1)
#     data_frame(plot1=list(plot1))
#   })
# 
# if(hasPDSS == 1){
#   #'
#   #' # PDS versus PDSS 
#   #'
#     
#   pds.plot.data <- scored_scales %>% ungroup %>%
#     filter(grepl('(male_mean|pdss|gender)', scored_scale),
#            !is.na(score)) %>%
#     select(scored_scale, SID, score) %>%
#     #       mutate(scored_scale=ifelse(grepl('mean_score', scored_scale),
#     # 				 'pds.standard',
#     # 				 scored_scale)) %>%
#     spread(scored_scale, score) %>%
#     rowwise %>%
#     do({
#       fmean <- .$female_mean_score
#       mmean <- .$male_mean_score
#       gen <- as.numeric(.$gender)
#       score <- NA
#       if (!is.na(fmean) & !is.na(mmean)){
#           score <- NA
#       } else if (!is.na(fmean) & is.na(mmean)){
#         score <- fmean
#         gen <- pdss_gender_code['f']
#       } else if (is.na(fmean) & !is.na(mmean)){
#         score <- mmean
#         gen <- pdss_gender_code['m']
#       }
#       theDF <- as_data_frame(.)
#       theDF$Gender <- gen
#       theDF$pds.standard <- score
#       theDF
#     }) %>% filter(!is.na(Gender))%>%
#     mutate(Gender=factor(Gender, levels=c('male'=pdss_gender_code['m'], 'female'=pdss_gender_code['f']), labels=c('male', 'female')),
#            pdss=as.numeric(pdss),
#            pds.standard=as.numeric(pds.standard))
#   
#   pds.plot.data %>%
#     ggplot(aes(x=pds.standard, y=pdss, group=Gender))+
#     geom_point(aes(color=Gender), position=position_jitter())+
#     geom_smooth(aes(color=Gender), alpha=.25)
#   
#   #'
#   #' This looks like some pretty tight rank-order stability between the two measures.
#   #'
#   
#   with(pds.plot.data, cor.test(pds.standard, pdss, method='pearson'))
#   with(pds.plot.data, cor.test(pds.standard, pdss, method='kendall'))
#   with(pds.plot.data, cor.test(pds.standard, pdss, method='spearman'))
#   
#   #'
#   #' How do the distributions change?
#   #'
#   
#   pds.plot.data %>%
#     gather(scale, score, pds.standard, pdss) %>%
#     ggplot(aes(x=score, group=Gender))+
#     geom_histogram(aes(fill=Gender), binwidth=.5, position=position_dodge())+
#     facet_wrap(~scale)
#   
#   pds.plot.data %>%
#     gather(scale, score, pds.standard, pdss) %>%
#     ggplot(aes(x=score, group=scale))+
#     geom_histogram(aes(fill=scale), binwidth=.5, position=position_dodge())+
#     facet_wrap(~Gender)
# }

#'
#'
#'
#'
#'  # Duplicate entries
#'
#' These indicate that either an SID was entered incorrectly, or that 
#' a person took a survey more than once (which can happen if they 
#' have to interrupt the first go, for example).
#' 
#' Some fields have been removed (e.g., DOB, and free text fields) to
#' keep this deidentified.
#'
#' These are not problematic if one is blank, but it *is* problematic if there are two values per item.
#' We need to figure out a way to choose between the two possible choices.
#'
#+ "duplicate_entries"

# left_join(duplicated.data,
#           long_survey_data_filtered) %>%
#   filter(item %in% rubric_data_long$column_name,
#          !grepl(identifiableData, item)) %>%
#   arrange(SID,survey_name,item) %>%
#   kable(caption='Duplicate entries for SID, Item, Survey Name')

# This image ends up being about 100 mb, so no dice.
#+"Pairs",fig.height=45,fig.width=45
# scored_scales %>% ungroup() %>%
# 	select(-method,-n_items,-n_missing) %>%
# 	gather(key,value,score) %>% 
# 	unite(scale_scale,scale_name,scored_scale) %>% 
# 	arrange(SID,scale_scale) %>%
# 	mutate(scale_scale=make.names(scale_scale)) %>%
# 	spread(scale_scale,value) %>%
# 	select(-SID,-key) %>%
# 	ggpairs()+
# 		theme(panel.background=element_rect(fill='white'))

scored_wide<-scored_scales %>% ungroup() %>%
  dplyr::select(-method) %>%
  gather(key,value,score,n_items,n_missing) %>% 
  unite(scale_stat,scored_scale,key) %>% 
  unite(scale_scale_stat,scale_name,scale_stat) %>%
  arrange(SID,scale_scale_stat) %>% 
  spread(scale_scale_stat,value)

write.csv(scored_wide,
          file=csv_wide_path,
          na='',
          row.names = FALSE)
write.csv(scored_scales,
          file=csv_long_path,
          na='',
          row.names = FALSE)
write.csv(dplyr::select(long_survey_data_filtered, -old.value),
          file=csv_longRaw_path,
          na='',
          row.names = FALSE)

#########################
# Uncomment the following if you wish to export a raw, wide file for every survey
#####

nada<-long_survey_data_filtered %>%
  filter(!SID %in% c('',NA)) %>%
  dplyr::select(-old.value) %>% dplyr::select(-dropped) %>%
  group_by(survey_name) %>%
  do({
    filename<-paste0(csv_wideRaw_path,
                     gsub(' ', '_', .$survey_name[[1]]),
                     '.csv')
    wide_data<-dplyr::select(., SID, item, value) %>%
      spread(key=item, value=value)
    write.csv(wide_data,
              file=filename,
              na='')
    data_frame(filename=filename, data=list(wide_data))
  })


# This helps with duplicate items for some questionnaires
#group_by(SID, item) %>%
#mutate(n=1:n(),dup=max(n)>1,item_trans=ifelse(dup, paste0(item,'_dup_',n),item)) %>%
#ungroup() %>% dplyr::select(SID, item_trans, value) %>%
