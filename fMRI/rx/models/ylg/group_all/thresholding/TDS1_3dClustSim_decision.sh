#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=3dClustSim
#SBATCH --output=output/3dClustSim.log
#SBATCH --error=output/3dClustSim_err.log
#SBATCH --cpus-per-task=25
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=fat,short

module load prl
module load afni

# Set path to the RX directory to save output
rx_path=/projects/dsnlab/shared/tds/fMRI/analysis/rx/ylg/all/tds1/Decisions/

# Set path to the mask used in analyses 
mask=/projects/dsnlab/shared/tds/fMRI/analysis/masks/tds1_tds2/tds1_tds2_gw_smoothed_group_average_optthr_2mm.nii

# Run 3dClustSim using the average acf outputs from the script "calcualte_average_ACF.Rmd"
3dClustSim -mask $mask -acf 0.670713842105263 4.57508543859649 9.21131210526316 > ${rx_path}/threshold.txt
