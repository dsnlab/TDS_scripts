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
STUDY=tds/TDS_scripts

# Set subject list
SUBJLIST=`cat subject_list_dartel.txt`

# Set MATLAB script path
COMPNAME=ralph
SCRIPT=/Users/${COMPNAME}/Documents/${STUDY}/fMRI/scripts/ppc/spm/tds2/tds_dartel_tds2_job.m
SCRIPTNAME=dartel

# Set output dir
OUTPUTDIR=/Users/${COMPNAME}/Documents/${STUDY}/fMRI/scripts/ppc/shell/schedule_spm_jobs/tds2/output/

# Set processor
# use "qsub" for HPC
# use "local" for local machine
# use "parlocal" for local parallel processing

PROCESS=parlocal
MAXJOBS=1

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
	parallel --verbose --results "${OUTPUTDIR}"/{}_${SCRIPTNAME}_output -j${MAXJOBS} bash spm_job.sh ${SCRIPT} :::: subject_list.txt
fi
