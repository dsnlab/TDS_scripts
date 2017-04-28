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
STUDY_DIR=tds

# Set subject list
SUBJLIST=`cat subject_list.txt`

# 
for SUBJ in $SUBJLIST
do
 qsub -v SUBID=${SUBJ},STUDYDIR=${STUDY_DIR} -N dicomconvert -o /vxfsvol/home/research/"${STUDY_DIR}"/org/scripts/output/"${SUBJ}"_dicomconvert_output.txt -e /vxfsvol/home/research/"${STUDY_DIR}"/org/scripts/output/"${SUBJ}"_dicomconvert_error.txt dicom_convert.sh
done

