#!/bin/bash

# This script extracts mean parameter estimates and SDs within an ROI or parcel
# from subject FX condition contrasts (condition > rest) for each wave. Output is 
# saved as a text file in the output directory.

# Set paths and variables
# ------------------------------------------------------------------------------------------
# paths
#rx_dir='/projects/dsnlab/tds/fMRI/analysis/rx/ylg/all/tds2/3dLME/Outcomes' #RX output directory
con_dir='/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth' #fx contrast directory
output_dir='/projects/dsnlab/shared/tds/fMRI/analysis/roi/ylg/tds2' #roi output directory
ROI_dir='/projects/dsnlab/shared/tds/fMRI/analysis/roi/ylg/tds2/anat_NAcc_HO' #roi/parcellation atlas directory 

# variables
subjects=`cat /projects/dsnlab/shared/tds/TDS_scripts/fMRI/fx/shell/schedule_spm_jobs/ylg/tds2_allconds/subject_list_fx_allconds.txt`
fx_cons=(con_0006 con_0016 con_0026 con_0009 con_0019 con_0029) #fx con files to extract from
#rx_model=(DecXOutcomesXContextTDS2+tlrc)
roi='R_Accumbens.nii.gz'

# Extract mean parameter estimates and SDs for each subject, wave, contrast, and roi/parcel
# ------------------------------------------------------------------------------------------

cd $con_dir
for sub in ${subjects[@]}; do 
	#for wave in ${waves[@]}; do 
		for con in ${fx_cons[@]}; do 
			#for num in {1..20}; do 
				if [ -a ${sub}_${con}.nii ]; then
					echo ${sub} ${con} `3dmaskave -sigma -quiet -mask $ROI_dir/$roi $con_dir/${sub}_${con}.nii` >> $output_dir/paramEstimates_${rx_model}.txt
				fi
			#done
		done
	#done
done
