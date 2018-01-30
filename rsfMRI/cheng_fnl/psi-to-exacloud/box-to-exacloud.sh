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
STUDY=uo_tds
PIPELINE=HCP_release_20170910_v1.1

#Rename files on box and sync to exacloud 
while read SUB;
	do
		cd "${SOURCE}"/${SUB}
		# this loop gzips all files in the subject directory
		for i in `find -name '*.nii'`; do gzip "$i"; done 
		# rename fmap, rsfMRI and sMRI files to pipeline format
		mv fmaps/fieldmap_01.nii.gz ${SUB}_FieldMap_Magnitude.nii.gz
		mv fmaps/fieldmap.nii.gz ${SUB}_FieldMap_Phase.nii.gz
		mv rsfMRI/resting_bold_mb6_2_5mm_tr780.nii.gz ${SUB}_rfMRI_REST1.nii.gz
		mv sMRI/mprage_defaced.nii.gz ${SUB}_T1w_MPR1.nii.gz
		# move task files up one level; can't concatenate locally bc need fslmerge on exacloud
		mv vid1/vid1_*.nii.gz .
		mv vid2/vid2_*.nii.gz .
		# remove empty folders
		rm -r fmaps rsfMRI sMRI vid1 vid2
		ssh -n chengt@exahead1.ohsu.edu mkdir -p ${DEST}/${STUDY}/${SUB}/visit/${PIPELINE}/${SUB}/unprocessed/NIFTI
		rsync -aiv -e ssh "${SOURCE}"/${SUB}/* chengt@exahead1.ohsu.edu:${DEST}/${STUDY}/${SUB}/visit/${PIPELINE}/${SUB}/unprocessed/NIFTI
done < test-30_subject-list.txt

# TO RUN AFTER merge-3d-files.sh
#for SUB in $SUBJLIST
#	do 
#		rsync -aiv -e ssh chengt@exahead1.ohsu.edu:${DEST}/${STUDY}/${SUB}/visit/${PIPELINE}/${SUB}/unprocessed/NIFTI/113_tfMRI*.nii.gz "${SOURCE}"/${SUB}
#		cd "${SOURCE}"/${SUB}
#		rm vid1_*.nii.gz
#		rm vid2_*.nii.gz
#	done