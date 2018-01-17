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
#	* If TO_TALAPAS = TRUE, this script syncs raw mprages from PSI to Talapas
# 	* If FROM_TALAPAS = TRUE, this script syncs defaced mprages from Talapas to PSI
#
# T Cheng 2018.1.16
#--------------------------------------------------------------

# Set your study directory; currently where MPRAGEs are temp stored for defacing
STUDY=/projects/dsnlab/shared/tds/fMRI/deface_temp

# Set subject list
SUBJLIST=`cat deface_subject_list.txt`

# Where are the raw mprage files?
RAWMPRAGE=/Volumes/TDS/nonbids_data/sMRI/subjects

# Where are the files headed? Uhhh ignore this for a hot sec, not sure where the defaced files are GOING after so it's best to just take it one step at a time
## Options are: "to talapas", moving raw mprages from PSI to & "to PSI" 
#TO="to_talapas"

for SUB in $SUBJLIST
	do
	 ssh tcheng@talapas-ln1.uoregon.edu "mkdir -p ${STUDY}/${SUB}"
	 rsync -aiv -e ssh ${RAWMPRAGE}/${SUB}/mprage.nii tcheng@talapas-ln1.uoregon.edu:$STUDY}/${SUB}/
	 echo "rsynced $SUB mprage"
	done