#!/bin/bash
#--------------------------------------------------------------
# Inputs:
#	* STUDY = study name
#	* SUBJLIST = subject_list.txt
#	* REPLACESID = initial subject
#	* RESULTS_INFIX = tag for output data
#	* OUTPUTDIR = Edit output and error paths
#
# Outputs:
#	* Defaced mprage data
#
# T Cheng 2018.1.16
#--------------------------------------------------------------

# Set your study
STUDY=/projects/dsnlab/shared/tds/TDS_scripts

# Set subject list
SUBJLIST=`cat subject_list_fx.txt`

#Which SID should be replaced?
REPLACESID='109'

# Tag the defaced data
RESULTS_INFIX=defaced

# Set output dir
OUTPUTDIR=${STUDY}/fMRI/fx/shell/schedule_spm_jobs/cyb/tds1_tds2/output/


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