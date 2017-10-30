#!/bin/bash
#                                          
#SBATCH --job-name=3dClustSim                
#SBATCH --output=output/3dClustSim-%A_%a.out 
#SBATCH --cpus-per-task=1
#SBATCH --mem=2000
#SBATCH --time=01:00:00

module load prl afni

dirlist=( $@ )
dir=${dirlist[$SLURM_ARRAY_TASK_ID]}

echo $dir
acfparams=`Rscript --vanilla \
    /projects/dsnlab/tds/TDS_scripts/fMRI/rx/thresholding/AvgIndACFest.R $dir`
echo "$acfparams"
srun 3dClustSim -pthr .005 .001 .0001 \
    -athr .05 .025 .01667 .0125 .01 .00833 .00625 \
    -nodec -acf $acfparams -mask "${dir}/mask.nii"
