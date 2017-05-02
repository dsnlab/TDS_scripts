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
SUBJLIST=`cat subject_list.txt`
#Which SID should be replaced?
REPLACESID='101'


# Set MATLAB script path
COMPNAME=ralph
SCRIPT=/Users/${COMPNAME}/Documents/${STUDY}/fMRI/scripts/templates/masks/spm/tds2/tds_gw_join_smooth_job.m
SCRIPTNAME=tds_gw_mask

# Tag the results files
RESULTS_INFIX=gw_join_smooth

# Set output dir
OUTPUTDIR=/Users/${COMPNAME}/Documents/${STUDY}/fMRI/scripts/templates/masks/shell/tds2/output

# Set processor
# use "qsub" for HPC
# use "local" for local machine
# use "parlocal" for local parallel processing

PROCESS=parlocal
MAXJOBS=8

# Create and execute batch job
if [ "${PROCESS}" == "qsub" ]; then 
	for SUBJ in $SUBJLIST
	do
	 echo "submitting via qsub"
	 qsub -v SUBID=${SUBJ},STUDY=${STUDY} -N x4dmerge -o "${OUTPUTDIR}"/"${SUBJ}"_4dmerge_output.txt -e "${OUTPUTDIR}"/"${SUBJ}"_4dmerge_error.txt 4dmerge.sh
	done

elif [ "${PROCESS}" == "local" ]; then 
	for SUBJ in $SUBJLIST
	do
	 echo "submitting locally"
	 bash ppc_mvpa.sh ${SUBJ} ${SCRIPT} > "${OUTPUTDIR}"/"${SUBJ}"_${SCRIPTNAME}_output.txt 2> /"${OUTPUTDIR}"/"${SUBJ}"_${SCRIPTNAME}_error.txt
	done
elif [ "${PROCESS}" == "parlocal" ]; then 
	parallel --verbose --results "${OUTPUTDIR}"/{}_${RESULTS_INFIX}_output -j${MAXJOBS} bash spm_job.sh ${REPLACESID} ${SCRIPT} :::: subject_list.txt
fi
