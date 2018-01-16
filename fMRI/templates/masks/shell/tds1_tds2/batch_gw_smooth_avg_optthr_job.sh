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
STUDY=/projects/dsnlab/shared/tds/TDS_scripts

#SPM Path
SPM_PATH=/projects/dsnlab/shared/SPM12

# Set MATLAB script path
SCRIPT=${STUDY}/fMRI/templates/masks/spm/tds1_tds2/tds1_tds2_gw_groupAverage_optthresh_job.m

# Tag the results files
RESULTS_INFIX=avg_optthresh

# Set output dir
OUTPUTDIR=${STUDY}/fMRI/templates/masks/shell/tds1_tds2/output/

# Set processor
# use "qsub" for HPC
# use "local" for local machine
# use "parlocal" for local parallel processing

PROCESS=slurm

# Max jobs only matters for par local
MAXJOBS=8

#Only matters for slurm
cpuspertask=1
mempercpu=10G

# Create and execute batch job
if [ "${PROCESS}" == "slurm" ]; then 
	 echo "submitting via slurm"
	 sbatch --export=REPLACESID=tds1_tds2,SCRIPT=$SCRIPT,SUB=tds1_tds2,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/"${SUB}"_"${RESULTS_INFIX}".log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh
	 sleep .25


elif [ "${PROCESS}" == "local" ]; then 
	for SUB in $SUBJLIST
	do
	 echo "submitting locally"
	 bash spm_job.sh ${REPLACESID} ${SCRIPT} ${SUB} > "${OUTPUTDIR}"/"${SUBJ}"_"${RESULTS_INFIX}"_output.txt 2> /"${OUTPUTDIR}"/"${SUBJ}"_"${RESULTS_INFIX}"_error.txt
	done

elif [ "${PROCESS}" == "parlocal" ]; then 
	parallel --verbose --results "${OUTPUTDIR}"/{}_${RESULTS_INFIX}_output -j${MAXJOBS} bash spm_job.sh ${REPLACESID} ${SCRIPT} :::: subject_list.txt
fi
