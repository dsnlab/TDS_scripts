#!/bin/bash
#--------------------------------------------------------------
#	* Executes spm_job.sh for subjects specials list (ppc1) 
#
# D.Cos 2017.3.7
#--------------------------------------------------------------

STUDY=/projects/dsnlab/shared/tds/TDS_scripts
SCRIPT=fMRI/ppc/spm/tdsall
SPM_PATH=/projects/dsnlab/shared/SPM12
OUTPUTDIR=${STUDY}/fMRI/ppc/shell/schedule_spm_jobs/tdsall/output/
RESULTS_INFIX=ppc1
PROCESS=slurm
cpuspertask=1
mempercpu=5G

sbatch --export=REPLACESID=409,SCRIPT=${STUDY}/${SCRIPT}/TDS409_coreg_realign_unwarp_coreg_segment.m,SUB=409,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/409_ppc1.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh
