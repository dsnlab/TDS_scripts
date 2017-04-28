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
# KGB 11.09.2016 edited KJ 03.23.2017										 #	
##############################################################################
#
#Define variables and directories
SubID=178
RootDir=/Users/ralph/Documents/tds/fMRI/subjects/avg_fmap
StrucDir=$RootDir/$SubID/structurals
FuncDir=$RootDir/$SubID/fmaps
#
##
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
flirt -in mprage_oriented -ref $RootDir/templates/MNI152_T1_2mm_brain -out mprage_std
#
##
# Copy mprage to missing fieldmap participant's fmap folder and rename
echo -------------------------------------
echo Copy Struct to Fmap Folder
echo $SubID
cp $StrucDir/mprage_std.nii.gz $FuncDir/
cd $FuncDir/
mv mprage_std.nii.gz fieldmap_01.nii.gz
#
##
# Copy average fieldmap to missing fieldmap participant's fmap folder and rename
echo -------------------------------------
echo Copy Avg Fmap to Fmap Folder
echo $SubID
cp /Users/ralph/Documents/tds/fMRI/subjects/avg_fmap/fmaps/average_field_map_TDS.nii.gz $FuncDir/
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