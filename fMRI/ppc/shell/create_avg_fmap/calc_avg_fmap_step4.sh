#!/bin/bash
#$ -cwd
#$ -j y
#$ -N PPC_of_fieldmaps
#$ -o /Users/kathrynj/Documents/SCE/foravg/logs
#$ -S /bin/bash
#$ -V
#
##############################################################################
# Takes subject ID as input and prepares struct to be used as magnitude file #
# and average fieldmap to be used as phase file for participants who are     # 
# missing a fieldmap.														 #
# KGB 11.09.2016 edited KJ 03.23.2017, edited ZO 06.05.2017					 #	
##############################################################################
#
#Define variables and directories
subjects=(178 192)
# Notes: 178 is missing fmap, 192 has invalid fmap (different space than stop3+4)
RootDir=/projects/dsnlab/tds/fMRI/subjects_tds2/avg_fmap # this folder has been created manually in step 1
#
##
# Copies clean nii for mprage
for s in ${subjects[@]};
do
	echo $s
	cd $RootDir
	mkdir $s
	cd $s
	mkdir fmaps
	mkdir structurals
	echo directories created
	cd /Volumes/TDS/nonbids_data/fMRI/subjects/$s/structurals # location of clean nii for mprage
	cp mprage.nii $RootDir/$s/structurals/
	echo mprage copied
	echo $s finished
done
#
##
# Copies avg fmap to subjects
for s in ${subjects[@]};
do
	StrucDir=$RootDir/$s/structurals
	FuncDir=$RootDir/$s/fmaps
	# Put structural into standard orientation for FSL
	echo -------------------------------------
	echo Struct Orientation
	cd $StrucDir/
	fslreorient2std mprage mprage_oriented
	#
	##
	# Register structural to MNI standard space
	echo -------------------------------------
	echo Struct Registration
	cd $StrucDir/
	flirt -in mprage_oriented -ref /projects/dsnlab/SPM12/canonical/avg152T1 -out mprage_std
	#
	##
	# Copy mprage to missing fieldmap participant's fmap folder and rename
	echo -------------------------------------
	echo Copy Struct to Fmap Folder
	echo $s
	cp $StrucDir/mprage_std.nii.gz $FuncDir/
	cd $FuncDir/
	mv mprage_std.nii.gz fieldmap_01.nii.gz
	#
	##
	# Copy average fieldmap to missing fieldmap participant's fmap folder and rename
	echo -------------------------------------
	echo Copy Avg Fmap to Fmap Folder
	echo $s
	cp /projects/dsnlab/tds/fMRI/subjects_tds2/avg_fmap/standard_fmaps/average_field_map_TDS.nii.gz $FuncDir/
	cd $FuncDir/
	mv average_field_map_TDS.nii.gz fieldmap.nii.gz
	#
	##
	# Unzip files required for SPM
	echo -------------------------------------
	echo 	Unzip
	cd $FuncDir/
	gunzip -c fieldmap.nii.gz > fieldmap.nii
	gunzip -c fieldmap_01.nii.gz > fieldmap_01.nii
done