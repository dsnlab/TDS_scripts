#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt). And 
# runs the job_autorecon.sh file for 
# each subject. It saves the ouput
# and error files in their specified
# directories.
# 

STUDY=tds
SUBJLIST=`cat subject_list.txt`

for SUBJ in $SUBJLIST
do
 qsub -v SUBID=${SUBJ} -N reconall -o /vxfsvol/home/research/"${STUDY}"/sMRI/scripts/output/"${SUBJ}"_reconall_output.txt -e /vxfsvol/home/research/"${STUDY}"/sMRI/scripts/output/"${SUBJ}"_reconall_error.txt job_reconall.sh
done
