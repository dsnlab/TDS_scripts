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
RESULTS_INFIX=ppc1
PROCESS=slurm
cpuspertask=1
mempercpu=5G

# sbatch --export=REPLACESID=108,SCRIPT=${STUDY}/${SCRIPT}/TDS108_coreg_realign_unwarp_coreg_segment.m,SUB=108,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS \
#		 --job-name=${RESULTS_INFIX} \
#		 -o "${OUTPUTDIR}"/108_ppc1.log \
#		 --cpus-per-task=${cpuspertask} \
#		 --mem-per-cpu=${mempercpu} \
#		 spm_job.sh

#sbatch --export=REPLACESID=178,SCRIPT=${STUDY}/${SCRIPT}/TDS178_coreg_segment.m,SUB=178,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
#		 --job-name=${RESULTS_INFIX} \
#		 -o "${OUTPUTDIR}"/178_ppc1_1.log \
#		 --cpus-per-task=${cpuspertask} \
#		 --mem-per-cpu=${mempercpu} \
#		 spm_job.sh

sbatch --export=REPLACESID=178,SCRIPT=${STUDY}/${SCRIPT}/TDS178_ppc1_avgfmap_job.m,SUB=178,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/178_ppc1_2.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh

#sbatch --export=REPLACESID=179,SCRIPT=${STUDY}/${SCRIPT}/TDS179_coreg_realign_unwarp_coreg_segment.m,SUB=179,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
#		 --job-name=${RESULTS_INFIX} \
#		 -o "${OUTPUTDIR}"/179_ppc1.log \
#		 --cpus-per-task=${cpuspertask} \
#		 --mem-per-cpu=${mempercpu} \
#		 spm_job.sh

#sbatch --export=REPLACESID=189,SCRIPT=${STUDY}/${SCRIPT}/TDS189_coreg_realign_unwarp_coreg_segment.m,SUB=189,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
#		 --job-name=${RESULTS_INFIX} \
#		 -o "${OUTPUTDIR}"/189_ppc1.log \
#		 --cpus-per-task=${cpuspertask} \
#		 --mem-per-cpu=${mempercpu} \
#		 spm_job.sh

#sbatch --export=REPLACESID=350,SCRIPT=${STUDY}/${SCRIPT}/TDS350_coreg_realign_unwarp_coreg_segment.m,SUB=350,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
#		 --job-name=${RESULTS_INFIX} \
#		 -o "${OUTPUTDIR}"/350_ppc1.log \
#		 --cpus-per-task=${cpuspertask} \
#		 --mem-per-cpu=${mempercpu} \
#		 spm_job.sh

sbatch --export=REPLACESID=356,SCRIPT=${STUDY}/${SCRIPT}/TDS356_coreg_realign_unwarp_coreg_segment.m,SUB=356,SPM_PATH=$SPM_PATH,PROCESS=$PROCESS  \
		 --job-name=${RESULTS_INFIX} \
		 -o "${OUTPUTDIR}"/356_ppc1.log \
		 --cpus-per-task=${cpuspertask} \
		 --mem-per-cpu=${mempercpu} \
		 spm_job.sh
