#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt).
# 

STUDY=tds
SUBJLIST=`cat subject_list.txt`
for SUBJ in $SUBJLIST
 do qsub -v SUBID=${SUBJ} -N x4dmerge -o /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_4dmerge_output.txt -e /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_4dmerge_error.txt 4dmerge.sh
done
