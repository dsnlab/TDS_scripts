#!/bin/bash
#--------------------------------------------------------------
# Inputs:
#	* STUDY = study name
#	* SUBJLIST = subject_list.txt
#	* REPLACESID = initial subject
#	* MPRAGEIN = source of raw mprage files
# 	* MPRAGEDIR = mprage folder for processing
#	* RESULTS_INFIX = tag for output data
#	* OUTPUTDIR = Edit output and error paths
#
# Outputs:
# 	* Defaces the mprage on Talapas
#	* Syncs defaced mprage to PSI
# 	* Removes mprage and defaced mprage from Talapas
#
# T Cheng 2018.1.16 | Run from Talapas
#--------------------------------------------------------------

export PATH=/bin:/usr/bin:/sbin:/usr/sbin

# Set your study and output directory
STUDY=/projects/dsnlab/shared/tds/sMRI/deface_temp

# Set subject list
SUBJLIST=`cat deface_subject_list.txt`

# Which SID should be replaced?
#REPLACESID='109'

# Where are the raw mprage files?
#MPRAGEIN = /Volumes/TDS/nonbids_data/sMRI/subjects

# Where are the mri_deface templates?
TEMPLATESDIR=/projects/dsnlab/shared/tds/fMRI/analysis/templates/mri_deface_templates

for SUB in $SUBJLIST
	do
		./mri_deface $STUDY/101/mprage.nii $TEMPLATESDIR/talairach_mixed_with_skull.gca $TEMPLATESDIR/face.gca mprage_defaced.nii
		echo "defaced mprage $SUB"
	done