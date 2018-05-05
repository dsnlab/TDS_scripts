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
#	* Create directory structure and rsync raw mprages from PSI to Talapas -OR-
#	* Rsyncs defaced mprage files from Talapas to PSI
#
# T Cheng 2018.1.16 | Run locally
#--------------------------------------------------------------

# Set your study directory; currently where MPRAGEs are temp stored for defacing
STUDY=/Volumes/TDS/nonbids_data/sMRI/subjects_defaced

# Set subject list
SUBJLIST=`cat deface_subject_list.txt`

# Where are the raw mprage files?
RAWMPRAGE=/Volumes/TDS/nonbids_data/sMRI/subjects

# Where are the files headed? Uhhh ignore this for a hot sec, not sure where the defaced files are GOING after so it's best to just take it one step at a time
## Options are: "to talapas", moving raw mprages from PSI to & "offload", moving defaced images back to PSI
#TO="to_talapas"

#if [$TO == "to_talapas"]; then
	for SUB in $SUBJLIST
		do
		 mkdir -p ${STUDY}/${SUB}
		 rsync -aiv -e ssh ${RAWMPRAGE}/${SUB}/mprage.nii ${STUDY}/${SUB}/
		 echo "rsynced mprage $SUB"
	done
#else [$TO == "offload"]; then ## CHANGE THIS IF NOT MOVING BACK TO PSI
#	for SUB in $SUBJLIST
#		do
#		 rsync -aiv -e ssh tcheng@talapas-ln1.uoregon.edu:${STUDY}/${SUB}/mprage_defaced.nii ${RAWMPRAGE}/${SUB}/
#		 echo "rsynced mprage_defaced $SUB" 
#	done
#fi
