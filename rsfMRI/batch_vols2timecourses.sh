#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt) in the same
# folder and will run job_vols2timecourses.sh
# for each subject in that list.
#

STUDY=`cat study.txt`
SUBJLIST=`cat subject_list.txt`

for SUBJ in $SUBJLIST
 do qsub -v SUBID=${SUBJ} -N vols2timecourses -o /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_vols2timecourses_output.txt -e /vxfsvol/home/research/"${STUDY}"/rsfMRI/scripts/output/"${SUBJ}"_vols2timecourses_error.txt job_vols2timecourses.sh
done
