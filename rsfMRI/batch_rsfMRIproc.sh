#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt) in the same
# folder and will run job_rsfMRIproc.tcsh
# for each subject in that list.
#

STUDY=tds
SUBJLIST=`cat subject_list.txt`

for SUBJ in $SUBJLIST
 do qsub -v SUBID=${SUBJ} -N rsfMRI_ppi -S /bin/tcsh -o /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_rsfMRIproc_output.txt -e /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_rsfMRIproc_error.txt job_rsfMRIproc.tcsh
done
