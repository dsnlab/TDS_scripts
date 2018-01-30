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
SOURCE=/drives/c/Users/chengt/Box\ Sync/tds_test-30 # /Users/theresacheng/ on personal laptop

# Set subject list
SUBJLIST=`cat test-30_subject-list.txt`

# Set exacloud directory and pipeline
DEST=/home/exacloud/lustre1/fnl_lab/data/HCP/processed
PROJECT=UO_TDS
PIPELINE=HCP_release_20170910_v1.1

# 
for SUB in $SUBJLIST
	do
		cd "${SOURCE}"/${SUB}
		for i in `find -name '*.nii'`; do gzip "$i"; done # this loop gzips all files in the subject directory
		# concatenate task fMRI into one nifti to generate vid1.nii.gz and vid2.nii.gz

		# rename all files to pipeline format
		cd "${SOURCE}"/${SUB}
		mv fmaps/fieldmap_01.nii.gz ${SUB}_FieldMap_Magnitude.nii.gz
		mv fmaps/fieldmap.nii.gz ${SUB}_FieldMap_Phase.nii.gz
		mv rsfMRI/resting_bold_mb6_2_5mm_tr780.nii.gz ${SUB}_rfMRI_REST1.nii.gz
		mv sMRI/mprage_defaced.nii.gz ${SUB}_T1w_MPR1.nii.gz
		#mv vid1/vid1.nii.gz ${SUB}_tfMRI_TASK1.nii.gz
		#mv vid2/vid2.nii.gz ${SUB}_tfMRI_TASK2.nii.gz
		#rm -r fmaps rsfMRI sMRI vid1 vid2 # UNLESS I need the info text files?
		#rsync -n -aiv -e ssh $SOURCE/$SUB/* chengt@exahead1.ohsu.edu:${DEST}/${PROJECT}/${SUB}/visit/${PIPELINE}/$SUB/unprocessed/NIFTI
done