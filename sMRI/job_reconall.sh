#!/bin/bash
#
# This script runs FreeSurfer 5.3 recon-all
# and extracts the data, which includes the
# all morphological measurements at vertex
# and parcellated scales. Run this script
# by running the batch_reconall.sh file
# and calling on subject_list.txt
#

echo -e "\nSetting Up Freesurfer5.3"

source /home/research/tds/sMRI/scripts/SetUpFreeSurfer.sh 

echo -e "\nFreesurfer Home is $FREESURFER_HOME"

echo -e "\nThe Subject Directory is $SUBJECTS_DIR"

echo -e "\Running recon-all on ${SUBID}"

recon-all -i /vxfsvol/home/research/tds/sMRI/subjects/"${SUBID}"/mprage.nii.gz -subjid $SUBID -all
