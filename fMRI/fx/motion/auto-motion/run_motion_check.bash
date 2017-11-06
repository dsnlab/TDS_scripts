#!/bin/bash
#
#SBATCH --job-name=motion_check
#SBATCH --output=output/motion_check.log
#
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000
#SBATCH --partition=short,fat,long,longfat

module load R gcc

srun Rscript --verbose motion_check.r
