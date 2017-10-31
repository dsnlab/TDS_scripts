#!/usr/bin/env Rscript
#install.packages('tidyverse')
library(tidyverse)
clean_nii_dir <- "/Volumes/TDS/nonbids_data/"

clean_nii_file_raw <- data_frame(file = dir(path = clean_nii_dir, recursive = T))
clean_nii_filelist <- clean_nii_file_raw %>%
  mutate(basename = basename(file),
         dirname = dirname(file)) %>%
  extract(dirname, into = c('modality', 'sid', 'run', 'split_dicom'),
          regex = '(r*[sf]{1,2}MRI)/subjects/(TDS_*[[:digit:]]{2,3}/*|[[:digit:]]{2,3}/*)([[:alpha:]]+[[:digit:]]|fmaps|structurals)*(/.*)*',
          #regex = '(TDS_*[[:digit:]]{2,3}/*|[[:digit:]]{2,3}/*)([[:alpha:]]+[[:digit:]]|fmaps|structurals)*(/.*)*',
          remove = F) %>%
  filter(grepl('nii$', basename), !is.na(modality))

clean_nii_filelist_sum <- clean_nii_filelist %>%
  group_by(modality, sid, run, split_dicom) %>%
  filter(!grepl("\\.txt$", basename)) %>%
  summarize(nfiles = n())

clean_nii_filelist_count_dupes <- clean_nii_filelist_sum %>%
  group_by(modality, sid, run) %>%
  summarize(nscans = n())

clean_nii_filelist_sum_dupes <- left_join(clean_nii_filelist_sum, clean_nii_filelist_count_dupes)

clean_nii_filelist_sum_dupes %>% ungroup() %>%
  mutate(nfile_lag = lag(nfiles),
         lagname = lag(run),
         samenfiles = nfile_lag==nfiles) %>% 
  filter(samenfiles) %>%
  select(sid, run, lagname, nfiles) %>% View

if(FALSE){
  clean_nii_filelist_sum_dupes %>%
    filter(run == 'stop9')
  
  clean_nii_filelist_sum_dupes %>%
    group_by(sid) %>%
    summarize(has_stop9 = any(run == 'stop9' & nfiles > 0)) %>%
    filter(has_stop9)
  
  clean_nii_file_raw %>%
    filter(grepl('stop9', file))
}

file_count <- clean_nii_filelist_sum_dupes %>% 
  filter(modality == 'fMRI') %>%
  group_by(sid) %>%
  summarize(`N Scans` = n(), 
            `N Struct` = sum(ifelse(run == 'structurals', nfiles, 0)),
            `N Fmap` = sum(ifelse(run == 'fmaps', nfiles, 0)),
            `N Task > 50` = sum(ifelse(grepl('(stop|cyb|vid)', run), nfiles, 0) > 50))

file_count %>% knitr::kable()
write.csv(file_count, file = file.path(clean_nii_dir, 'file_count.csv'))

clean_nii_filelist_proper_folders <- clean_nii_filelist_sum_dupes %>%
  filter(!is.na(split_dicom)) %>%
  group_by(modality, sid, run) %>%
  mutate(split_dir_to_use = split_dicom[nfiles == max(nfiles)])

if(FALSE){
  clean_nii_mv_best_nii <- clean_nii_filelist_proper_folders %>%
    ungroup() %>%
    distinct(modality, sid, run, split_dir_to_use) %>%
    group_by(modality, sid, run) %>%
    mutate(full_path_to_use = file.path(clean_nii_dir, modality, 'subjects', sid, run, split_dir_to_use),
           cmd = paste0('mv -v ', full_path_to_use, '/* ', full_path_to_use, '/..')) %>%
    arrange(modality, sid, run)

  clean_nii_mv_best_nii$cmd
  
  split_dir_mv_rez <- clean_nii_mv_best_nii %>% ungroup() %>%
    group_by(cmd)%>%
    do({
      result <- system(.$cmd[[1]], intern = T)
      data_frame(cmd = .$cmd, result = list(result))
    })
  saveRDS(split_dir_mv_rez, file = file.path(clean_nii_dir, 'split_dir_mv_rez.RDS'))
  
  clean_nii_rm_old_split_folders <- clean_nii_filelist_proper_folders %>%
    filter(!is.na(split_dicom)) %>%
    mutate(full_path_to_use = file.path(clean_nii_dir, modality, 'subjects', sid, run, split_dicom),
           rmcmd = paste0('rm -rfv ', full_path_to_use)) %>%
    group_by(modality, sid, run, full_path_to_use, split_dir_to_use, split_dicom, rmcmd, nfiles, nscans) %>%
    do(confirmed = length(dir(file.path(.$full_path_to_use[[1]], '../'), pattern = '*nii'))) %>%
    arrange(modality, sid, run)
  
  #shouldn't return anything
  clean_nii_rm_old_split_folders %>%
    filter(!grepl('[[:digit:]]_[[:digit:]]{8}$', rmcmd)) %>% #should end with the data for any dirs to be removed
    select(rmcmd)
  
  clean_nii_rm_old_split_folders$rmcmd
  
  split_dir_rm_rez <- clean_nii_rm_old_split_folders %>% ungroup() %>%
    group_by(rmcmd)%>%
    do({
      result <- system(.$rmcmd[[1]], intern = T)
      data_frame(cmd = .$rmcmd, result = list(result))
    })
  saveRDS(split_dir_rm_rez, file = file.path(clean_nii_dir, 'split_dir_rm_rez.RDS'))
}


