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
SUBJLIST="/projects/dsnlab/tds/TDS_scripts/org/subject_list_10312017.txt"
PATH_FOR_OUTPUT='/projects/dsnlab/tds/TDS_scripts/org/output'

parallel --results "${PATH_FOR_OUTPUT}"/{} --verbose -j1 --colsep '\t' bash dicom_convert-convert_dicoms_copy.sh	:::: "${SUBJLIST}"
