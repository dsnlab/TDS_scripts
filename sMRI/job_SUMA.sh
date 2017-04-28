#!/bin/bash
#
# This script runs AFNI's @SUMA_Make_Spec_FS
# command to prepare the FreeSurfer data for
# use by AFNI scripts. Run this script
# by running the batch_reconall.sh file
# and calling on subject_list.txt
#

echo "job_SUMA.sh ran on $(date) $line"

echo -e "\nSetting Up Freesurfer5.3"

source /home/research/tds/sMRI/scripts/SetUpFreeSurfer.sh 

echo -e "\nSetting up AFNI"

export PATH="/usr/local/afni_16.1.06:${PATH}"

echo -e "\nFreesurfer Home is $FREESURFER_HOME"

echo -e "\nThe Subject Directory is $SUBJECTS_DIR"

cd $SUBJECTS_DIR/$SUBID

echo -e "\nRunning SUMA Make Spec on ${SUBID}"

@SUMA_Make_Spec_FS -sid "${SUBID}" -NIFTI

cd SUMA

echo -e "\nCreating ventricle and white matter masks"

3dcalc -a aparc+aseg.nii -datum byte -prefix "${SUBID}"_vent.nii -expr 'amongst(a,4,43)'
3dcalc -a aparc+aseg.nii -datum byte -prefix "${SUBID}"_WM.nii -expr 'amongst(a,2,7,16,41,46,251,252,253,254,255)'

