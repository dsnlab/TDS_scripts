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
SOURCE=/Volumes/TDS/nonbids_data

# Set subject list
SUBJLIST=`cat test-30_subject-list.txt`

# Where are the mri_deface templates?
DEST=/Users/theresacheng/Box\ Sync/tds_test-30

for SUB in $SUBJLIST
	do
		cd "${DEST}"
		mkdir $SUB
		rsync -aiv ${SOURCE}/sMRI/subjects_defaced/${SUB}/* "${DEST}"/${SUB}
		echo "moved sMRI for $SUB"
		#rsync -aiv ${SOURCE}/rsfMRI/subjects/${SUB}/* "${DEST}"/${SUB}
		#echo "moved rsfMRI for $SUB"
		#rsync -aiv ${SOURCE}/fMRI/subjects/${SUB}/fmaps/* "${DEST}"/${SUB}
		#echo "moved fmaps for $SUB"
		#rsync -aiv ${SOURCE}/fMRI/subjects/${SUB}/vid1/* "${DEST}"/${SUB}
		#echo "moved vid1 for $SUB"
		#rsync -aiv ${SOURCE}/fMRI/subjects/${SUB}/vid2/* "${DEST}"/${SUB}
		#echo "moved vid2 for $SUB"
done