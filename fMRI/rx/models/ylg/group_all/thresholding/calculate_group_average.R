# This script calculates the group average of the ACF parameters
# D.Cos 12/2018

# user input
model_dir = "/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/"
output_dir = "/projects/dsnlab/shared/tds/TDS_scripts/fMRI/fx/models/ylg/thresholding/"

# load packages
library(tidyverse)

# load ACF param files
file_pattern = "ACFparameters_average.1D"
file_list = list.files(model_dir, pattern = file_pattern, recursive = TRUE)

task = data.frame()

for (file in file_list) {
    temp = tryCatch(read.csv(paste0(model_dir,file), header = FALSE) %>%
      mutate(file = file) %>%
      rownames_to_column() %>%
      spread(rowname, V1) %>%
      extract(file, "subjectID", "(FP[0-9]{3}).*"), error = function(e) NULL)
    task = rbind(task, temp)
    rm(temp)
}

# calculate average and write file
task %>%
  gather(key, value, 2:5) %>%
  group_by(key) %>%
  summarize(mean = mean(value, na.rm = TRUE)) %>%
  spread(key, mean) %>%
  select(-4) %>%
  write.table(sprintf("%sACFparameters_group_average.txt", output_dir), sep = " ", col.names = FALSE, row.names = FALSE)
