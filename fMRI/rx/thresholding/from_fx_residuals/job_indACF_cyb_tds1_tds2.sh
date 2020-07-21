#!/bin/bash

# load afni
module load prl
module load afni

#fxDir=/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/fMRI/fMRI/analysis/fx/models/cyb/tds2_quad
fxDir=/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/cyb/tds1_tds2

#mask=/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/fMRI/fMRI/analysis/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii
mask=/projects/dsnlab/shared/tds/fMRI/analysis/masks/tds1_tds2/tds1_tds2_gw_smoothed_group_average_optthr_2mm.nii

# Estimate acf parameters for each subject and save as text file
# ------------------------------------------------------------------------------------------
cd ${fxDir}/${SUBID}
echo $PWD

touch ${SUBID}_acf.txt

for res in Res_*; do

echo $res `3dFWHMx -acf -mask $mask $res` >> ${SUBID}_acf.txt

done
