#!/bin/bash
#--------------------------------------------------------------
# Inputs:
#	* SUB = defined in subject_list.txt
#	* SCRIPT = MATLAB script to create and execute batch job
#	* Edit SPM path
#
# Outputs:
#	* Creates a batch job for $SUB
#	* Batch jobs are saved to the path defined in MATLAB script
#	* Executes batch job
#
# D.Cos 2017.3.7
#--------------------------------------------------------------

# define matlab script to run from input 1
SCRIPT=$1

# define subject ID from input 2
SUB=$2

# MATLAB version
MATLABVER=R2015b
SINGLECOREMATLAB=true
ADDITIONALOPTIONS=""

if "$SINGLECOREMATLAB"; then
	ADDITIONALOPTIONS="-singleCompThread"
fi

# create and execute job
echo -------------------------------------------------------------------------------
echo "${SUB}"
echo "Running ${SCRIPT}"
echo -------------------------------------------------------------------------------

/Applications/MATLAB_"${MATLABVER}".app/bin/matlab -nosplash -nodisplay -nodesktop ${ADDITIONALOPTIONS} -r "clear; addpath('/Users/ralph/Documents/MATLAB/spm12'); spm_jobman('initcfg'); sub='$SUB'; run('$SCRIPT'); spm_jobman('run',matlabbatch); exit"