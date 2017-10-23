#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt). And 
# runs the dicom_convert-convert_dicoms.sh script
# for each subject. It saves the ouput
# and error files in their specified
# directories.
#
# SUBJLIST is a tab separated text file that parallel uses
#   to find the command-line arguments for the dicom_convert-convert_dicoms.sh.
#   Look at subject_list_template.txt for an example, as well as the comments in
#   the main script.
# PATH_FOR_OUTPUT is where the terminal output is saved to (errors and such).
#
# All other paths are set in the dicom_convert-convert_dicoms.sh script.

# Set subject list
SUBJLIST="/Users/ralph/Documents/tds/tds_repo/org/scripts/subject_list.txt"
PATH_FOR_OUTPUT='/Users/ralph/Documents/tds/tds_repo/org/scripts/output/local_dicom_convert'

parallel --results "${PATH_FOR_OUTPUT}"/{} --verbose -j1 --colsep '\t' bash dicom_convert-convert_dicoms.sh	:::: "${SUBJLIST}"
