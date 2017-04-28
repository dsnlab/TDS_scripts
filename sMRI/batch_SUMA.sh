#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt). And 
# runs the job_SUMA.sh file for 
# each subject. It saves the ouput
# and error files in their specified
# directories.
#
# Set your study
STUDY=tds

# Set subject list
SUBJLIST=`cat subject_list.txt`

# 
for SUBJ in $SUBJLIST
do
 qsub -v SUBID=${SUBJ} -N SUMAprep -o /vxfsvol/home/research/"${STUDY}"/sMRI/scripts/output/"${SUBJ}"_SUMAprep_output.txt -e /vxfsvol/home/research/"${STUDY}"/sMRI/scripts/output/"${SUBJ}"_SUMAprep_error.txt job_SUMA.sh
done
