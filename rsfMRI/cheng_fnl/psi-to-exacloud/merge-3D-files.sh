#!/bin/bash
#--------------------------------------------------------------
# Inputs:
#	* SOURCE = study folders
#	* SUBJLIST = test-30_subject_list.txt
#	* DEST = destination
#
# Outputs:
# 	* Merges task files on exacloud
#
# T Cheng 2018.1.30 | Run from Exacloud
#--------------------------------------------------------------

# Set your source directory
SOURCE=/drives/c/Users/chengt/Box\ Sync/tds_test-30 # /Users/theresacheng/ on personal laptop

# Set subject list
SUBJLIST=`cat test-30_subject-list.txt`

# Set exacloud directory and pipeline
DEST=/home/exacloud/lustre1/fnl_lab/data/HCP/processe
SdTUDY=uo_tds
PIPELINE=HCP_release_20170910_v1.1

# Rename files on box and sync to exacloud 
for SUB in $SUBJLIST
	do
		cd ${DEST}/${STUDY}/${SUB}/visit/${PIPELINE}/$SUB/unprocessed/NIFTI
		fslmerge -t ${SUB}_tFMRI_VID1.nii.gz vid1_*.nii.gz
		fslmerge -t ${SUB}_tFMRI_VID2.nii.gz vid2_*.nii.gz
		rm vid1_*.nii.gz
		rm vid2_*.nii.gz
	done