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
SUBJLIST=`cat subject_list_nomissingruns.txt` # specials processed manually
#Which SID should be replaced?
REPLACESID='101'

# Set MATLAB script pat
COMPNAME=ralph
SCRIPT=/Users/${COMPNAME}/Documents/${STUDY}/fMRI/ppc/spm/tds2/ppc1_tds2_job.m



# Tag the results files
RESULTS_INFIX=ppc1

# Set output dir
OUTPUTDIR=/Users/${COMPNAME}/Documents/${STUDY}/fMRI/ppc/shell/schedule_spm_jobs/tds2/output/

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
	 qsub -v REPLACESID=${REPLACESID},SCRIPT=${SCRIPT},SUB=${SUB} -N ${RESULTS_INFIX} -o "${OUTPUTDIR}"/"${SUB}"_${RESULTS_INFIX}_output.txt -e "${OUTPUTDIR}"/"${SUB}"_${RESULTS_INFIX}_error.txt spm_job.sh
	done

elif [ "${PROCESS}" == "local" ]; then 
	for SUB in $SUBJLIST
	do
	 echo "submitting locally"
	 bash spm_job.sh ${REPLACESID} ${SCRIPT} ${SUB} > "${OUTPUTDIR}"/"${SUBJ}"_${RESULTS_INFIX}_output.txt 2> /"${OUTPUTDIR}"/"${SUBJ}"_${RESULTS_INFIX}_error.txt
	done
elif [ "${PROCESS}" == "parlocal" ]; then 
	parallel --verbose --results "${OUTPUTDIR}"/{}_${RESULTS_INFIX}_output -j${MAXJOBS} bash spm_job.sh ${REPLACESID} ${SCRIPT} :::: subject_list.txt
fi
