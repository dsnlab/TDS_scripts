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

# Set your study and output directory; currently where MPRAGEs are temp stored for defacing
STUDY=/Volumes/TDS/nonbids_data/sMRI/subjects_defaced

# Set subject list
SUBJLIST=`cat deface_subject_list.txt`

# Where are the raw mprage files?
#MPRAGEIN = /Volumes/TDS/nonbids_data/sMRI/subjects

# Where are the mri_deface templates?
TEMPLATESDIR=/projects/dsnlab/tds/TDS_scripts/rsfMRI/cheng_fnl/mri_deface

for SUB in $SUBJLIST
	do
	./mri_deface ${STUDY}/$SUB/mprage.nii ${TEMPLATESDIR}/talairach_mixed_with_skull.gca ${TEMPLATESDIR}/face.gca ${STUDY}/$SUB/mprage_defaced.nii
	echo "defaced $SUB"
done
