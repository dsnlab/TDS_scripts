library(data.table) #This package makes everything go a lot faster.

#Your base folder for YLG project
ylg_folder<-'/home/jflournoy/danbo/tds/'
#the folder within the YLG folder where your CSV files live
behave_folder<-'behavioral/stoplight/tds2'
#create the full path to the csv files
files_folder<-paste0(ylg_folder,behave_folder)
#where to write the combined data file
folder_to_write_agglom<-paste0(ylg_folder,'behavioral/')

#collect all the file names -- mind the string given to `pattern`
files_to_read<-as.list(dir(files_folder,recursive=T,pattern='.*csv_.*.csv$'))

#we want to work in the directory where the csv files are
setwd(files_folder)
#this reads all the files into a single list of data frames 
#and all data frames are stacked on top of one another. 
sl_data<-rbindlist(
		   lapply(
			  files_to_read,
			  fread))

#which columns in the data files are numeric?
sl_numeric_cols<-c(1:2,4:6,9:12,15,17:18)

#Shouldn't get any warnings here -- we're just setting the
# numeric columns to be numeric.
sl_data[,(sl_numeric_cols):=lapply(.SD,as.numeric),.SDcols=sl_numeric_cols]
#this gives you an idea of how big the data file is.
format(object.size(sl_data),units='Mb')

#this sets an index for trial number
sl_data[,
	trial_index:=1+`intersection-id`-min(`intersection-id`),
	by=list(`run-id`,`subject-name`)]

#remove duplicates in case some of your csv files were exported multiple times.
sl_data<-unique(sl_data) # MAKE SURE NO KEY IS SET

write.csv(sl_data, paste0(folder_to_write_agglom, 'YLG_trial_data.csv'))
