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

# Set MATLAB script path
SCRIPT=${STUDY}/fMRI/ppc/spm/tds1_tds2/dartel_tds1_tds2_job.m

#SPM Path
SPM_PATH=/projects/dsnlab/shared/SPM12

# Set output dir
OUTPUTDIR=${STUDY}/fMRI/ppc/shell/schedule_spm_jobs/tds1_tds2/output/

# Tag the results files
RESULTS_INFIX=dartel

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
sbatch --export=REPLACESID=tds1_tds2,SCRIPT=$SCRIPT,SUB=tds1_tds2,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/"${SUB}"_"${RESULTS_INFIX}".log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh
