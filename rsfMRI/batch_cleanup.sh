#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt) in the same
# folder and will call on job_cleanup.sh
# which will do the following:
# a. make all files created with rsfMRI_ppi
#    available using chmod 775
# b. remove the unnecessary and large
#    output from the rsfMRI_ppi
#

STUDY=`cat study.txt`
SUBJLIST=`cat subject_list.txt`

for SUBJ in $SUBJLIST
 do qsub -v SUBID=${SUBJ} -N katecleanup -o /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_cleanup_output.txt -e /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_cleanup_error.txt job_cleanup.sh
done
