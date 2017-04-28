#!/bin/bash
#
# This script uses fsl's fslmerge function
# to concatenante all the volumes from the
# participant's resting state scan.
#
# 
module load fsl

echo $SUBID
STUDY=tds
echo $STUDY

mkdir /home/research/"${STUDY}"/rsfMRI/subjects/"${SUBID}"

fslmerge -t /home/research/"${STUDY}"/rsfMRI/subjects/"${SUBID}"/rs1.nii /home/research/"${STUDY}"/archive/clean_nii/"${SUBID}"/*resting_bold*/*.nii
