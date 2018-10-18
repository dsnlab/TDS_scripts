#!/bin/bash
. ~/.bashrc

# It also calculates the acf parameters for the AFNI 3dLME models and saves the 
# parameters to text files in the code directory.

# Specify variables
# ------------------------------------------------------------------------------------------
# thresholding code directory
#codeDir=/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/ylg/all/

# RX directories (where the residual files are)
OutcomesTDSall=/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/rx/ylg/all_conds/3dMVM/nopmod/OutcomeXContext/OutcomeXContext
DecisionsTDSall=/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/rx/ylg/all_conds/3dMVM/nopmod/DecisionXContext/DecisionXContext
mask=/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii

# AFNI 3dLME model names
#models=(DecXOutcomesXContextTDS2, DecXContextTDS2)

# Estimate acf parameters for AFNI 3dLME models and save this output
# ------------------------------------------------------------------------------------------
cd $OutcomesTDSall
3dFWHMx -acf NULL -mask $mask OutcomesXContextTDS2_nopmod_2+tlrc.BRIK all2_residuals+tlrc.BRIK > /Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/rx/ylg/all_conds/3dMVM/nopmod/OutcomeXContext/OutcomeXContext/output/OutcomesXContext_acf.txt

cd $DecisionsTDSall
3dFWHMx -acf NULL -mask $mask DecisionsXContextTDS2_nopmod+tlrc.BRIK all2_residuals+tlrc.BRIK > /Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/rx/ylg/all_conds/3dMVM/nopmod/DecisionXContext/DecisionXContext/output/DecisionXContext_acf.txt