#!/bin/bash
#
# This script runs FreeSurfer 5.3 recon-all
# qcache, which is explained in more depth
# on the freesurfer website: 
# https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/QdecGroupAnalysis_tktools
# Run this script by running the 
# batch_qcache.sh file and calling 
# on the subjects_list.txt

echo -e "\nSetting Up Freesurfer5.3"

source /home/research/tds/sMRI/scripts/SetUpFreeSurfer.sh 

echo -e "\nFreesurfer Home is $FREESURFER_HOME"

echo -e "\nThe Subject Directory is $SUBJECTS_DIR"

echo -e "\Running recon-all qcache on ${SUBID}"

recon-all -subjid $SUBID -qcache

