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
COMPNAME=ralph #use this for help specifying paths to run locally
SCRIPT=/home/flournoy/test.m

#SPM Path
SPM_PATH=/home/flournoy/code/SPM12

# Tag the results files
RESULTS_INFIX=test

# Set output dir
OUTPUTDIR=/home/flournoy/code/test_output

# Set processor
# use "slurm" for HPC
# use "serlocal" for local, serial processing
# use "parlocal" for local, parallel processing

PROCESS=slurm

#Only matters for parlocal
MAXJOBS=8

#Only matters for slurm
cpuspertask=1
mempercpu=2G

# Create and execute batch job
if [ "${PROCESS}" == "slurm" ]; then 
	for SUB in $SUBJLIST
	do
	 echo "submitting via qsub"
	 sbatch --export=REPLACESID=$REPLACESID,SCRIPT=$SCRIPT,SUB=$SUB,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/"${SUB}"_${RESULTS_INFIX}.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh
	 sleep .25
	done
elif [ "${PROCESS}" == "serlocal" ]; then 
	for SUB in $SUBJLIST
	do
	 echo "submitting locally"
	 bash spm_job.sh ${REPLACESID} ${SCRIPT} ${SUB} > "${OUTPUTDIR}"/"${SUBJ}"_${RESULTS_INFIX}_output.txt 2> /"${OUTPUTDIR}"/"${SUBJ}"_${RESULTS_INFIX}_error.txt
	done
elif [ "${PROCESS}" == "parlocal" ]; then 
	parallel --verbose --results "${OUTPUTDIR}"/{}_${RESULTS_INFIX}_output -j${MAXJOBS} bash spm_job.sh ${REPLACESID} ${SCRIPT} :::: subject_list.txt
fi
