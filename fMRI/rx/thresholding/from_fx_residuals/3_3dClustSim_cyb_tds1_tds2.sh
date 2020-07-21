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
#SBATCH --account=dsnlab

module load prl
module load afni

# Set path to the RX directory to save output
rx_path=/projects/dsnlab/shared/tds/fMRI/analysis/rx/cyb/group_comp/thresholding

# Set path to the mask used in analyses 
mask=/projects/dsnlab/shared/tds/fMRI/analysis/masks/tds1_tds2/tds1_tds2_gw_smoothed_group_average_optthr_2mm.nii

# Run 3dClustSim using the average acf outputs from the script "2_average_incACF.Rmd"
3dClustSim -mask $mask -acf 0.70516 4.6613 8.9944 > ${rx_path}/threshold_02152020.txt
