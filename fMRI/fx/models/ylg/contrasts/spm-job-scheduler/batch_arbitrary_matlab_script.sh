#!/bin/bash
#
#Takes a single matlab script as argument
#and executes it within matlab.
#Usage:
#    sbatch batch_arbitrary_matlab_script.m <matlab_script.m> 
#
#SBATCH --job-name=custom_contrasts
#SBATCH --output=output/custom_contrasts.log
#
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=2G

ADDITIONALOPTIONS="-singleCompThread"

if [ -z "$1" ]
  then
    echo "No argument supplied. Must give matlab script to be scheduled as first argument"
    exit 1
fi

SCRIPT=`realpath $1`

echo Running $SCRIPT
module load matlab
srun matlab -nosplash -nodisplay -nodesktop ${ADDITIONALOPTIONS} -r "run('$SCRIPT'); exit" 
