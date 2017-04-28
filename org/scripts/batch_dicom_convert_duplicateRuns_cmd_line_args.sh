#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt). And 
# runs the dicom_convert.sh script
# for each subject. It saves the ouput
# and error files in their specified
# directories.
#
# Set your study
STUDY_DIR=tds/

# Set subject list
SUBJLIST="/Users/ralph/Documents/tds/tds_repo/org/scripts/subject_list_redo.txt"
PATH_FOR_OUTPUT='/Users/ralph/Documents/tds/tds_repo/org/scripts/output/local_dicom_convert'

# 
#for SUBJ in $SUBJLIST
#do
#	bash dicom_convert_duplicateRuns_cmd_line_args.sh "${SUBJ}"
#done

parallel --results "${PATH_FOR_OUTPUT}"/{} --verbose -j1 --colsep '\t' bash dicom_convert_duplicateRuns_cmd_line_args.sh :::: "${SUBJLIST}"