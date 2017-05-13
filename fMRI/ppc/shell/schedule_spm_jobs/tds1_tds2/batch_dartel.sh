#!/bin/bash
#--------------------------------------------------------------
#	* Executes spm_job.sh for subjects specials list (ppc1) 
#
# D.Cos 2017.3.7
#--------------------------------------------------------------

STUDY=/projects/dsnlab/tds/TDS_scripts
SCRIPT=fMRI/ppc/spm/tds1_tds2
SPM_PATH=/projects/dsnlab/SPM12
OUTPUTDIR=${STUDY}/fMRI/ppc/shell/schedule_spm_jobs/tds1_tds2/output/
RESULTS_INFIX=dartel
PROCESS=slurm
cpuspertask=1
mempercpu=5G

sbatch --export=REPLACESID=178,SCRIPT=${STUDY}/${SCRIPT}/dartel_tds1_2_job.m,SUB=178,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/178_ppc1.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh