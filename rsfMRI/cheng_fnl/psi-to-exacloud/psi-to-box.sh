#!/bin/bash
#--------------------------------------------------------------
# Inputs:
#	* SOURCE = study folders
#	* SUBJLIST = test-30_subject_list.txt
#	* DEST = destination
#
# Outputs:
# 	* Moves files from PSI to Box nested within subject
#
# T Cheng 2018.1.16 | Run from Talapas
#--------------------------------------------------------------

# Set your source directory
SOURCE=/drives/z/nonbids_data # /Volumes/TDS/ if running on Mac

# Set subject list
SUBJLIST=`cat test-30_subject-list.txt`

# Where are the mri_deface templates?
DEST=/drives/c/Users/chengt/Box\ Sync/tds_test-30 # /Users/theresacheng/ on personal laptop

for SUB in $SUBJLIST
	do
		#mkdir $SUB
		#rsync -aiv ${SOURCE}/sMRI/subjects_defaced/${SUB}/* "${DEST}"/${SUB}
		#echo "moved sMRI for $SUB"
		cd "${DEST}"/${SUB}
		echo "${DEST}"/${SUB}
		#mkdir sMRI rsfMRI fmaps vid1 vid2
		#mv mprage_defaced.nii sMRI/mprage_defaced.nii
		#mv mprage_info.txt sMRI/mprage_info.txt
		rsync -aiv ${SOURCE}/rsfMRI/subjects/${SUB}/* "${DEST}"/${SUB}/rsfMRI
		echo "moved rsfMRI for $SUB"
		#rsync -aiv -r ${SOURCE}/fMRI/subjects/${SUB}/fmaps/* "${DEST}"/${SUB}/fmaps
		#echo "moved fmaps for $SUB"
		#rsync -aiv ${SOURCE}/fMRI/subjects/${SUB}/vid1/* "${DEST}"/${SUB}/vid1
		#echo "moved vid1 for $SUB"
		#rsync -aiv ${SOURCE}/fMRI/subjects/${SUB}/vid2/* "${DEST}"/${SUB}/vid2
		#echo "moved vid2 for $SUB"
done