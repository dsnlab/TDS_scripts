#!/bin/bash
#
# This batch file calls on your subject
# list (named subject_list.txt). And 
# runs the job_reconall.sh file for 
# each subject. It saves the ouput
# and error files in their specified
# directories.
#
# Set your study
STUDY=/projects/dsnlab/shared/tds

# Set subject list
SUBJLIST=`cat subject_list_fx_allconds_nopmod_main.txt`

# 
for SUBJ in $SUBJLIST
do
 sbatch --export SUBID=${SUBJ} --job-name indACF --partition=short --mem-per-cpu=8G --time=1:00:00 --cpus-per-task=1 -o "${STUDY}"/TDS_scripts/fMRI/rx/models/ylg/all/thresholding/output/"${SUBJ}"_indACF_out.txt -e "${STUDY}"/TDS_scripts/fMRI/rx/models/ylg/all/thresholding/output/"${SUBJ}"_indACF_err.txt job_indACF.sh
done
