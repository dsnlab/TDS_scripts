#!/bin/bash
#
#SBATCH --job-name=auto_trash
#SBATCH --output=output/auto_trash.log
#
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1000
#SBATCH --partition=short,fat,long,longfat

module load R gcc

srun Rscript --verbose auto_trash.R
