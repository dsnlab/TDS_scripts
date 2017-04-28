# Qualtrics Data Flow

If you are using this script for the first time, you need to copy clean_this_study_template.r and process_qualtrics_options_template.r to new files with the same filenames but without '_template'. 
These are the files the script will look for, and so you should edit the content of these two files to be consistent with your project.

This will read DSN survey data from qualtrics, csv file rubrics, and use them to produce scored scale data. Output is currently limited to histograms, and long and wide csv files.

To run from the command line, type `sh render_qualtrics_r.sh` and then inspect the file "process_qualtrics_data.html."

