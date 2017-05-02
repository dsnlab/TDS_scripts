#!/bin/bash
#--------------------------------------------------------------
# Inputs:
#	* STUDY = study name
#	* SUBJLIST = subject_list.txt
#	* SCRIPT = MATLAB script to create and execute batch job
#	* PROCESS = running locally, via qsub, or on the Mac Pro
#	* Edit output and error paths
#
# Outputs:
#	* Executes spm_job.sh for $SUB and $SCRIPT
#
# D.Cos 2017.3.7
#--------------------------------------------------------------


# Set your study
STUDY=tds/tds_repo

# Set subject list
#SUBJLIST=`cat subject_list.txt`

# Set MATLAB script path
COMPNAME=ralph
SCRIPTNAME=ppc1

# Set output dir
OUTPUTDIR=/Users/${COMPNAME}/Documents/${STUDY}/fMRI/scripts/ppc/shell/schedule_spm_jobs/output/

# Set processor

CORES=2

parallel --verbose --results "${OUTPUTDIR}"/{2}_${SCRIPTNAME}_output -j${CORES} --colsep ',' bash spm_job.sh :::: subject_list_specials.txt