#!/bin/bash
. ~/.bashrc

# It also calculates the acf parameters for the AFNI 3dLME models and saves the 
# parameters to text files in the code directory.

# Specify variables
# ------------------------------------------------------------------------------------------
# thresholding code directory
codeDir=/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/ylg/all/

# RX directories (where the residual files are)
OutcomesTDSall=/projects/dsnlab/tds/fMRI/analysis/rx/ylg/all/tds2/3dLME/Outcomes/
DecisionsTDSall=/projects/dsnlab/tds/fMRI/analysis/rx/ylg/all/tds2/3dLME/Decisions/
mask=/projects/dsnlab/tds/fMRI/analysis/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii

# AFNI 3dLME model names
#models=(DecXOutcomesXContextTDS2, DecXContextTDS2)

# Estimate acf parameters for AFNI 3dLME models and save this output
# ------------------------------------------------------------------------------------------
cd OutcomesTDSall
3dFWHMx -acf NULL -mask $mask DecXOutcomesXContextTDS2+tlrc.BRIK all2_residuals+tlrc.BRIK > /projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/ylg/all/output/DecXOutcomesXContextTDS2_acf.txt

cd DecisionsTDSall
3dFWHMx -acf NULL -mask $mask DecXOutcomesXContextTDS2+tlrc.BRIK all2_residuals+tlrc.BRIK > /projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/ylg/all/output/DecXContextTDS2_acf.txt