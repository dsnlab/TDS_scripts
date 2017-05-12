#!/bin/bash
#--------------------------------------------------------------
#	* Executes spm_job.sh for subjects specials list (ppc1) 
#
# D.Cos 2017.3.7
#--------------------------------------------------------------

STUDY=/projects/dsnlab/tds/TDS_scripts
SCRIPT=fMRI/ppc/spm/tds2
SPM_PATH=/projects/dsnlab/SPM12
OUTPUTDIR=${STUDY}/fMRI/ppc/shell/schedule_spm_jobs/tds2/output/
RESULTS_INFIX=ppc1
PROCESS=slurm
cpuspertask=1
mempercpu=5G

sbatch --export=REPLACESID=108,SCRIPT=${STUDY}/${SCRIPT}/TDS108_ppc1_job.m,SUB=108,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/108_ppc1.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh

sbatch --export=REPLACESID=178,SCRIPT=${STUDY}/${SCRIPT}/TDS178_ppc1_avgfmap_job.m,SUB=178,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/178_ppc1.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh

sbatch --export=REPLACESID=179,SCRIPT=${STUDY}/${SCRIPT}/TDS179_ppc1_job.m,SUB=179,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/179_ppc1.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh

sbatch --export=REPLACESID=189,SCRIPT=${STUDY}/${SCRIPT}/TDS189_ppc1_job.m,SUB=189,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/189_ppc1.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh
