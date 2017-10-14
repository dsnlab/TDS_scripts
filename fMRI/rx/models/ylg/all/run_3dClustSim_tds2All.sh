#!/bin/bash
. ~/.bashrc

# This script runs 3dClustSim for each model using acf parameters generated by calculateACF.sh

# Specify variables
# ------------------------------------------------------------------------------------------
# thresholding code directory
#outputDir=/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/ylg/all/output

# RX directories (where model masks can be found)
OutcomesTDSall=/projects/dsnlab/tds/fMRI/analysis/rx/ylg/all/tds2/3dLME/Outcomes
DecisionsTDSall=/projects/dsnlab/tds/fMRI/analysis/rx/ylg/all/tds2/3dLME/Decisions
mask=/projects/dsnlab/tds/fMRI/analysis/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii

# Run 3dClustSim
# ------------------------------------------------------------------------------------------
cd $OutcomesTDSall
3dClustSim -mask $mask -acf  0.525663  5.05339  13.3831 > /projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/ylg/all/output/3dClustStim_results_AFNI_OutcomesTDS2all.txt

cd $DecisionsTDSall
3dClustSim -mask $mask -acf  0.220568  4.04762  8.00892 > /projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/ylg/all/output/3dClustStim_results_AFNI_DecisionsTDS2all.txt

