#!/bin/bash

# This script extracts mean parameter estimates and SDs within an ROI or parcel
# from subject images (e.g. FX condition contrasts). Output is 
# saved as a text file in the output directory.

module load afni

echo -------------------------------------------------------------------------------
echo "${SUB}"
echo "Running ${SCRIPT}"
date
echo -------------------------------------------------------------------------------


# Set paths and variables
# ------------------------------------------------------------------------------------------
# paths
image_dir=/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/"${SUB}" #fx contrast directory
output_dir='/projects/dsnlab/shared/tds/fMRI/analysis/roi/ylg/tds1/func' #roi output directory
roi_dir='/projects/dsnlab/shared/tds/TDS_scripts/fMRI/rx/models/ylg/group_all/extract_ROIs' #roi/parcellation atlas directory

# variables
rois=(dALvSocial_CerbeVII_EAvCOMM_mask+tlrc.BRIK DAvSocial_EAvCOMM_cerbellum_mask+tlrc.BRIK ddACC_contextxGroupxPergo_mask+tlrc.BRIK dmPFC_contextxGroupxPergo_mask+tlrc.BRIK l_cerbellum_contextxGroupxPergo_mask+tlrc.BRIK l_pSTrSTG_DSE_EAvCOMM_mask+tlrc.BRIK l_pSTS_DSE_EAvCOMM_mask+tlrc.BRIK l_VS_contextxGroupxPergo_mask+tlrc.BRIK mOFC_contextxGroupxPergo_mask+tlrc.BRIK r_pars_orbitalis_contextxGroupxPergo_mask+tlrc.BRIK r_parsr_opercular_contextxGroupxPergo_mask+tlrc.BRIK) #roi masks (without file format, specified below as .nii)
images=`echo $(printf "con_%004d.nii\n" {1..30})` #images to extract parameter estimates from (alt. example: images=`echo $(printf "beta_%04d.nii\n" {1..36}) $(printf "beta_%04d.nii\n" {43..78})`)

if [ ! -d ${output_dir} ]; then
	mkdir -p ${output_dir}
fi

# Align images and extract mean parameter estimates and SDs for each contrast and roi/parcel
# ------------------------------------------------------------------------------------------
for roi in ${rois[@]}; do 
	3dAllineate -source "${roi_dir}"/"${roi}".nii -master "${image_dir}"/mask.nii -final NN -1Dparam_apply '1D: 12@0'\' -prefix "${roi_dir}"/aligned_"${roi}"
	for image in ${images[@]}; do 
	echo "${SUB}" "${image}" "${roi}" `3dmaskave -sigma -quiet -mask "${roi_dir}"/aligned_"${roi}"+tlrc "${image_dir}"/"${image}"` >> "${output_dir}"/"${SUB}"_parameterEstimates.txt
	done
done

