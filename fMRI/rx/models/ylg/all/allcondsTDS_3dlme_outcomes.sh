#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=TDS_allconds_3dMVM
#SBATCH --output=output/allcons_3dMVM.log
#SBATCH --error=output/aallcons_3dMVM_error.log
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=short,fat

module load prl afni

cd /projects/dsnlab/tds/fMRI/analysis/rx/ylg/all/tds2/3dLME/Outcomes 
	3dLME -prefix DecXOutcomesXContextTDS2 \
	-jobs 28 \
	-model  "Dec*Outcome*Context" \
	-ranEff "~1" \
	-SS_type 3 \
	-resid	all2_residuals	\
	-num_glf 18 \
	-glfLabel 1 'OG-OB_G_AL-SE' -glfCode 1  'Dec : 1*Go Outcome : 1*Good -1*Bad Context : 1*AL -1*SE' \
	-glfLabel 2 'OG-OB_G_AL-PR' -glfCode 2  'Dec : 1*Go Outcome : 1*Good -1*Bad Context : 1*AL -1*PR' \
	-glfLabel 3 'OG-OB_G_PR-SE' -glfCode 3  'Dec : 1*Go Outcome : 1*Good -1*Bad Context : 1*PR -1*SE' \
	-glfLabel 4 'OG-OB_S_AL-SE' -glfCode 4  'Dec : 1*Stop Outcome : 1*Good -1*Bad Context : 1*AL -1*SE' \
	-glfLabel 5 'OG-OB_S_AL-PR' -glfCode 5  'Dec : 1*Stop Outcome : 1*Good -1*Bad Context : 1*AL -1*PR' \
	-glfLabel 6 'OG-OB_S_PR-SE' -glfCode 6  'Dec : 1*Stop Outcome : 1*Good -1*Bad Context : 1*PR -1*SE' \
	-glfLabel 7 'G_S_OG_AL-SE'  -glfCode 7  'Dec : 1*Go -1*Stop Outcome : 1*Good Context : 1*AL -1*SE' \
	-glfLabel 8 'G_S_OG_AL-PR'  -glfCode 8  'Dec : 1*Go -1*Stop Outcome : 1*Good Context : 1*AL -1*PR' \
	-glfLabel 9 'G_S_OG_PR-SE'  -glfCode 9  'Dec : 1*Go -1*Stop Outcome : 1*Good Context : 1*PR -1*SE' \
	-glfLabel 10 'S_G_OG_AL-SE' -glfCode 10 'Dec : 1*Stop -1*Go Outcome : 1*Good Context : 1*AL -1*SE' \
	-glfLabel 11 'S_G_OG_AL-PR' -glfCode 11 'Dec : 1*Stop -1*Go Outcome : 1*Good Context : 1*AL -1*PR' \
	-glfLabel 12 'S_G_OG_PR-SE' -glfCode 12 'Dec : 1*Stop -1*Go Outcome : 1*Good Context : 1*PR -1*SE' \
	-glfLabel 13 'G_S_OB_AL-SE' -glfCode 13 'Dec : 1*Go -1*Stop Outcome : 1*Bad Context : 1*AL -1*SE' \
	-glfLabel 14 'G_S_OB_AL-PR' -glfCode 14 'Dec : 1*Go -1*Stop Outcome : 1*Bad Context : 1*AL -1*PR' \
	-glfLabel 15 'G_S_OB_PR-SE' -glfCode 15 'Dec : 1*Go -1*Stop Outcome : 1*Bad Context : 1*PR -1*SE' \
	-glfLabel 16 'S_G_OB_AL-SE' -glfCode 16 'Dec : 1*Stop -1*Go Outcome : 1*Bad Context : 1*AL -1*SE' \
	-glfLabel 17 'S_G_OB_AL-PR' -glfCode 17 'Dec : 1*Stop -1*Go Outcome : 1*Bad Context : 1*AL -1*PR' \
	-glfLabel 18 'S_G_OB_PR-SE' -glfCode 18 'Dec : 1*Stop -1*Go Outcome : 1*Bad Context : 1*PR -1*SE' \
	-mask /projects/dsnlab/tds/fMRI/analysis/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii \
	-dataTable 				\
	Subj Dec Outcome Context Group InputFile \
	109	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0006.nii \
	109	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0016.nii \
	109	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0026.nii \
	109	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0009.nii \
	109	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0019.nii \
	109	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0029.nii \
	109	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0007.nii \
	109	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0017.nii \
	109	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0027.nii \
	109	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0010.nii \
	109	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0020.nii \
	109	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0030.nii \
	113	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0006.nii \
	113	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0016.nii \
	113	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0026.nii \
	113	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0009.nii \
	113	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0019.nii \
	113	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0029.nii \
	113	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0007.nii \
	113	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0017.nii \
	113	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0027.nii \
	113	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0010.nii \
	113	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0020.nii \
	113	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0030.nii \
	114	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0006.nii \
	114	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0016.nii \
	114	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0026.nii \
	114	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0009.nii \
	114	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0019.nii \
	114	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0029.nii \
	114	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0007.nii \
	114	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0017.nii \
	114	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0027.nii \
	114	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0010.nii \
	114	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0020.nii \
	114	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0030.nii \
	115	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0006.nii \
	115	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0016.nii \
	115	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0026.nii \
	115	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0009.nii \
	115	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0019.nii \
	115	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0029.nii \
	115	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0007.nii \
	115	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0017.nii \
	115	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0027.nii \
	115	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0010.nii \
	115	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0020.nii \
	115	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0030.nii \
	116	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0006.nii \
	116	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0016.nii \
	116	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0026.nii \
	116	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0009.nii \
	116	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0019.nii \
	116	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0029.nii \
	116	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0007.nii \
	116	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0017.nii \
	116	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0027.nii \
	116	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0010.nii \
	116	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0020.nii \
	116	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0030.nii \
	117	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0006.nii \
	117	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0016.nii \
	117	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0026.nii \
	117	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0009.nii \
	117	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0019.nii \
	117	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0029.nii \
	117	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0007.nii \
	117	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0017.nii \
	117	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0027.nii \
	117	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0010.nii \
	117	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0020.nii \
	117	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0029.nii \
	119	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0006.nii \
	119	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0016.nii \
	119	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0026.nii \
	119	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0009.nii \
	119	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0019.nii \
	119	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0029.nii \
	119	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0007.nii \
	119	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0017.nii \
	119	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0027.nii \
	119	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0010.nii \
	119	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0020.nii \
	119	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0030.nii \
	120	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0006.nii \
	120	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0016.nii \
	120	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0026.nii \
	120	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0009.nii \
	120	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0019.nii \
	120	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0029.nii \
	120	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0007.nii \
	120	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0017.nii \
	120	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0027.nii \
	120	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0010.nii \
	120	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0020.nii \
	120	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0030.nii \
	121	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0006.nii \
	121	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0016.nii \
	121	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0026.nii \
	121	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0009.nii \
	121	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0019.nii \
	121	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0029.nii \
	121	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0007.nii \
	121	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0017.nii \
	121	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0027.nii \
	121	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0010.nii \
	121	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0020.nii \
	121	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0030.nii \
	122	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0006.nii \
	122	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0016.nii \
	122	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0026.nii \
	122	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0009.nii \
	122	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0019.nii \
	122	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0029.nii \
	122	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0007.nii \
	122	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0017.nii \
	122	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0027.nii \
	122	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0010.nii \
	122	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0020.nii \
	122	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0030.nii \
	124	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0006.nii \
	124	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0016.nii \
	124	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0026.nii \
	124	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0009.nii \
	124	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0019.nii \
	124	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0029.nii \
	124	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0007.nii \
	124	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0017.nii \
	124	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0027.nii \
	124	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0010.nii \
	124	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0020.nii \
	124	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0030.nii \
	125	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0006.nii \
	125	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0016.nii \
	125	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0026.nii \
	125	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0009.nii \
	125	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0019.nii \
	125	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0029.nii \
	125	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0007.nii \
	125	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0017.nii \
	125	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0027.nii \
	125	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0010.nii \
	125	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0020.nii \
	125	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0030.nii \
	126	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0006.nii \
	126	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0016.nii \
	126	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0026.nii \
	126	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0009.nii \
	126	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0019.nii \
	126	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0029.nii \
	126	Stop Good	AL 	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0007.nii \
	126	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0017.nii \
	126	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0027.nii \
	126	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0010.nii \
	126	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0020.nii \
	126	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0030.nii \
	127	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0006.nii \
	127	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0017.nii \
	127	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0020.nii \
	127	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0007.nii \
	127	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0018.nii \
	127	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0021.nii \
	128	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0006.nii \
	128	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0016.nii \
	128	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0026.nii \
	128	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0009.nii \
	128	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0019.nii \
	128	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0029.nii \
	128	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0007.nii \
	128	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0017.nii \
	128	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0027.nii \
	128	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0010.nii \
	128	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0020.nii \
	128	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0030.nii \
	129	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0006.nii \
	129	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0016.nii \
	129	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0026.nii \
	129	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0009.nii \
	129	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0019.nii \
	129	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0029.nii \
	129	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0007.nii \
	129	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0017.nii \
	129	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0027.nii \
	129	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0010.nii \
	129	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0020.nii \
	129	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0030.nii \
	130	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0006.nii \
	130	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0016.nii \
	130	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0026.nii \
	130	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0009.nii \
	130	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0019.nii \
	130	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0029.nii \
	130	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0007.nii \
	130	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0017.nii \
	130	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0027.nii \
	130	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0010.nii \
	130	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0020.nii \
	130	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0030.nii \
	131	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0006.nii \
	131	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0016.nii \
	131	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0026.nii \
	131	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0009.nii \
	131	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0019.nii \
	131	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0029.nii \
	131	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0007.nii \
	131	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0017.nii \
	131	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0027.nii \
	131	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0010.nii \
	131	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0020.nii \
	131	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0030.nii \
	132	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0006.nii \
	132	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0016.nii \
	132	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0026.nii \
	132	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0009.nii \
	132	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0019.nii \
	132	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0029.nii \
	132	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0007.nii \
	132	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0017.nii \
	132	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0027.nii \
	132	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0010.nii \
	132	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0020.nii \
	132	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0030.nii \
	133	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0006.nii \
	133	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0016.nii \
	133	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0026.nii \
	133	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0009.nii \
	133	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0019.nii \
	133	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0029.nii \
	133	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0007.nii \
	133	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0017.nii \
	133	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0027.nii \
	133	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0010.nii \
	133	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0020.nii \
	133	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0030.nii \
	134	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0006.nii \
	134	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0016.nii \
	134	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0026.nii \
	134	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0009.nii \
	134	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0019.nii \
	134	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0029.nii \
	134	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0007.nii \
	134	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0017.nii \
	134	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0027.nii \
	134	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0010.nii \
	134	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0020.nii \
	134	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0030.nii \
	135	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0013.nii \
	135	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0023.nii \
	135	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0006.nii \
	135	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0016.nii \
	135	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0026.nii \
	135	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0014.nii \
	135	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0024.nii \
	135	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0007.nii \
	135	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0017.nii \
	135	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0027.nii \
	136	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0006.nii \
	136	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0016.nii \
	136	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0026.nii \
	136	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0009.nii \
	136	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0019.nii \
	136	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0029.nii \
	136	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0007.nii \
	136	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0017.nii \
	136	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0027.nii \
	136	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0010.nii \
	136	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0020.nii \
	136	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0030.nii \
	137	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0013.nii \
	137	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0023.nii \
	137	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0006.nii \
	137	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0016.nii \
	137	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0026.nii \
	137	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0014.nii \
	137	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0024.nii \
	137	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0007.nii \
	137	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0017.nii \
	137	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0027.nii \
	139	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0006.nii \
	139	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0016.nii \
	139	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0009.nii \
	139	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0019.nii \
	139	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0007.nii \
	139	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0017.nii \
	139	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0010.nii \
	139	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0020.nii \
	140	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0006.nii \
	140	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0016.nii \
	140	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0026.nii \
	140	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0009.nii \
	140	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0019.nii \
	140	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0029.nii \
	140	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0007.nii \
	140	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0017.nii \
	140	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0027.nii \
	140	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0010.nii \
	140	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0020.nii \
	140	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0030.nii \
	141	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0006.nii \
	141	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0016.nii \
	141	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0026.nii \
	141	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0009.nii \
	141	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0019.nii \
	141	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0029.nii \
	141	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0007.nii \
	141	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0017.nii \
	141	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0027.nii \
	141	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0010.nii \
	141	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0020.nii \
	141	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0030.nii \
	142	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0006.nii \
	142	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0016.nii \
	142	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0026.nii \
	142	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0009.nii \
	142	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0019.nii \
	142	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0029.nii \
	142	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0007.nii \
	142	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0017.nii \
	142	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0027.nii \
	142	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0010.nii \
	142	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0020.nii \
	142	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0030.nii \
	144	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0006.nii \
	144	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0016.nii \
	144	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0026.nii \
	144	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0009.nii \
	144	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0019.nii \
	144	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0029.nii \
	144	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0007.nii \
	144	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0017.nii \
	144	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0027.nii \
	144	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0010.nii \
	144	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0020.nii \
	144	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0030.nii \
	145	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0006.nii \
	145	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0016.nii \
	145	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0026.nii \
	145	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0009.nii \
	145	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0019.nii \
	145	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0029.nii \
	145	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0007.nii \
	145	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0017.nii \
	145	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0027.nii \
	145	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0010.nii \
	145	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0020.nii \
	145	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0030.nii \
	146	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0006.nii \
	146	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0016.nii \
	146	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0026.nii \
	146	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0009.nii \
	146	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0019.nii \
	146	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0029.nii \
	146	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0007.nii \
	146	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0017.nii \
	146	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0027.nii \
	146	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0010.nii \
	146	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0020.nii \
	146	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0030.nii \
	150	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0006.nii \
	150	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0016.nii \
	150	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0026.nii \
	150	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0009.nii \
	150	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0019.nii \
	150	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0029.nii \
	150	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0007.nii \
	150	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0017.nii \
	150	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0027.nii \
	150	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0010.nii \
	150	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0020.nii \
	150	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0030.nii \
	151	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0006.nii \
	151	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0016.nii \
	151	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0026.nii \
	151	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0009.nii \
	151	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0019.nii \
	151	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0029.nii \
	151	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0007.nii \
	151	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0017.nii \
	151	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0027.nii \
	151	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0010.nii \
	151	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0020.nii \
	151	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0030.nii \
	152	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0006.nii \
	152	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0016.nii \
	152	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0026.nii \
	152	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0009.nii \
	152	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0019.nii \
	152	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0029.nii \
	152	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0007.nii \
	152	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0017.nii \
	152	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0027.nii \
	152	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0010.nii \
	152	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0020.nii \
	152	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0030.nii \
	155	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0006.nii \
	155	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0016.nii \
	155	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0026.nii \
	155	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0009.nii \
	155	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0019.nii \
	155	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0029.nii \
	155	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0007.nii \
	155	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0017.nii \
	155	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0027.nii \
	155	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0010.nii \
	155	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0020.nii \
	155	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0030.nii \
	156	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0006.nii \
	156	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0016.nii \
	156	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0026.nii \
	156	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0009.nii \
	156	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0019.nii \
	156	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0029.nii \
	156	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0007.nii \
	156	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0017.nii \
	156	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0027.nii \
	156	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0010.nii \
	156	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0020.nii \
	156	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0030.nii \
	157	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0006.nii \
	157	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0016.nii \
	157	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0026.nii \
	157	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0009.nii \
	157	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0019.nii \
	157	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0029.nii \
	157	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0007.nii \
	157	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0017.nii \
	157	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0027.nii \
	157	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0010.nii \
	157	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0020.nii \
	157	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0030.nii \
	159	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0006.nii \
	159	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0016.nii \
	159	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0026.nii \
	159	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0009.nii \
	159	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0019.nii \
	159	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0029.nii \
	159	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0007.nii \
	159	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0017.nii \
	159	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0027.nii \
	159	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0010.nii \
	159	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0020.nii \
	159	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0030.nii \
	160	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0006.nii \
	160	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0016.nii \
	160	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0026.nii \
	160	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0009.nii \
	160	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0019.nii \
	160	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0029.nii \
	160	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0007.nii \
	160	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0017.nii \
	160	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0027.nii \
	160	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0010.nii \
	160	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0020.nii \
	160	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0030.nii \
	161	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0006.nii \
	161	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0016.nii \
	161	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0026.nii \
	161	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0009.nii \
	161	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0019.nii \
	161	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0029.nii \
	161	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0007.nii \
	161	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0017.nii \
	161	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0027.nii \
	161	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0010.nii \
	161	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0020.nii \
	161	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0030.nii \
	162	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0006.nii \
	162	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0016.nii \
	162	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0026.nii \
	162	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0009.nii \
	162	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0019.nii \
	162	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0029.nii \
	162	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0007.nii \
	162	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0017.nii \
	162	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0027.nii \
	162	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0010.nii \
	162	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0020.nii \
	162	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0030.nii \
	163	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0006.nii \
	163	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0016.nii \
	163	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0026.nii \
	163	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0009.nii \
	163	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0019.nii \
	163	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0029.nii \
	163	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0007.nii \
	163	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0017.nii \
	163	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0027.nii \
	163	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0010.nii \
	163	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0020.nii \
	163	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0030.nii \
	164	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0006.nii \
	164	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0016.nii \
	164	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0026.nii \
	164	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0009.nii \
	164	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0019.nii \
	164	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0029.nii \
	164	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0007.nii \
	164	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0017.nii \
	164	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0027.nii \
	164	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0010.nii \
	164	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0020.nii \
	164	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0030.nii \
	165	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0006.nii \
	165	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0016.nii \
	165	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0026.nii \
	165	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0009.nii \
	165	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0019.nii \
	165	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0029.nii \
	165	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0007.nii \
	165	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0017.nii \
	165	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0027.nii \
	165	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0010.nii \
	165	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0020.nii \
	165	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0030.nii \
	167	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0006.nii \
	167	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0016.nii \
	167	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0026.nii \
	167	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0009.nii \
	167	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0019.nii \
	167	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0029.nii \
	167	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0007.nii \
	167	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0017.nii \
	167	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0027.nii \
	167	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0010.nii \
	167	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0020.nii \
	167	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0030.nii \
	168	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0006.nii \
	168	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0016.nii \
	168	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0026.nii \
	168	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0009.nii \
	168	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0019.nii \
	168	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0029.nii \
	168	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0007.nii \
	168	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0017.nii \
	168	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0027.nii \
	168	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0010.nii \
	168	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0020.nii \
	168	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0030.nii \
	169	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0006.nii \
	169	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0016.nii \
	169	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0026.nii \
	169	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0009.nii \
	169	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0019.nii \
	169	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0029.nii \
	169	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0007.nii \
	169	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0017.nii \
	169	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0027.nii \
	169	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0010.nii \
	169	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0020.nii \
	169	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0030.nii \
	170	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0006.nii \
	170	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0016.nii \
	170	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0026.nii \
	170	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0009.nii \
	170	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0019.nii \
	170	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0029.nii \
	170	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0007.nii \
	170	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0017.nii \
	170	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0027.nii \
	170	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0010.nii \
	170	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0020.nii \
	170	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0030.nii \
	171	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0006.nii \
	171	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0016.nii \
	171	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0026.nii \
	171	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0009.nii \
	171	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0019.nii \
	171	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0029.nii \
	171	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0007.nii \
	171	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0017.nii \
	171	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0027.nii \
	171	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0010.nii \
	171	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0020.nii \
	171	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0030.nii \
	172	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0006.nii \
	172	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0016.nii \
	172	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0026.nii \
	172	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0009.nii \
	172	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0019.nii \
	172	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0029.nii \
	172	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0007.nii \
	172	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0017.nii \
	172	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0027.nii \
	172	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0010.nii \
	172	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0020.nii \
	172	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0030.nii \
	173	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0006.nii \
	173	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0016.nii \
	173	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0026.nii \
	173	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0009.nii \
	173	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0019.nii \
	173	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0029.nii \
	173	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0007.nii \
	173	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0017.nii \
	173	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0027.nii \
	173	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0010.nii \
	173	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0020.nii \
	173	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0030.nii \
	174	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0006.nii \
	174	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0016.nii \
	174	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0026.nii \
	174	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0009.nii \
	174	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0019.nii \
	174	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0029.nii \
	174	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0007.nii \
	174	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0017.nii \
	174	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0027.nii \
	174	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0010.nii \
	174	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0020.nii \
	174	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0030.nii \
	175	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0006.nii \
	175	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0016.nii \
	175	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0026.nii \
	175	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0009.nii \
	175	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0019.nii \
	175	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0029.nii \
	175	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0007.nii \
	175	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0017.nii \
	175	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0027.nii \
	175	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0010.nii \
	175	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0020.nii \
	175	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0030.nii \
	177	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0006.nii \
	177	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0016.nii \
	177	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0026.nii \
	177	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0009.nii \
	177	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0019.nii \
	177	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0029.nii \
	177	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0007.nii \
	177	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0017.nii \
	177	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0027.nii \
	177	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0010.nii \
	177	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0020.nii \
	177	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0030.nii \
	178	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0006.nii \
	178	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0016.nii \
	178	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0026.nii \
	178	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0009.nii \
	178	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0019.nii \
	178	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0029.nii \
	178	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0007.nii \
	178	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0017.nii \
	178	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0027.nii \
	178	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0010.nii \
	178	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0020.nii \
	178	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0030.nii \
	179	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0006.nii \
	179	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0016.nii \
	179	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0026.nii \
	179	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0009.nii \
	179	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0019.nii \
	179	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0029.nii \
	179	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0007.nii \
	179	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0017.nii \
	179	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0027.nii \
	179	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0010.nii \
	179	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0020.nii \
	179	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0030.nii \
	181	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0006.nii \
	181	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0016.nii \
	181	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0026.nii \
	181	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0009.nii \
	181	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0019.nii \
	181	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0029.nii \
	181	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0007.nii \
	181	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0017.nii \
	181	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0027.nii \
	181	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0010.nii \
	181	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0020.nii \
	181	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0030.nii \
	182	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0006.nii \
	182	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0016.nii \
	182	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0026.nii \
	182	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0009.nii \
	182	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0019.nii \
	182	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0029.nii \
	182	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0007.nii \
	182	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0017.nii \
	182	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0027.nii \
	182	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0010.nii \
	182	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0020.nii \
	182	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0030.nii \
	183	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0006.nii \
	183	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0016.nii \
	183	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0026.nii \
	183	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0009.nii \
	183	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0019.nii \
	183	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0029.nii \
	183	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0007.nii \
	183	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0017.nii \
	183	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0027.nii \
	183	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0010.nii \
	183	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0020.nii \
	183	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0030.nii \
	184	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0006.nii \
	184	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0016.nii \
	184	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0026.nii \
	184	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0009.nii \
	184	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0019.nii \
	184	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0029.nii \
	184	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0007.nii \
	184	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0017.nii \
	184	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0027.nii \
	184	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0010.nii \
	184	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0020.nii \
	184	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0030.nii \
	185	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0006.nii \
	185	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0016.nii \
	185	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0026.nii \
	185	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0009.nii \
	185	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0019.nii \
	185	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0029.nii \
	185	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0007.nii \
	185	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0017.nii \
	185	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0027.nii \
	185	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0010.nii \
	185	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0020.nii \
	185	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0030.nii \
	186	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0006.nii \
	186	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0016.nii \
	186	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0026.nii \
	186	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0009.nii \
	186	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0019.nii \
	186	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0029.nii \
	186	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0007.nii \
	186	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0017.nii \
	186	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0027.nii \
	186	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0010.nii \
	186	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0020.nii \
	186	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0030.nii \
	187	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0006.nii \
	187	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0016.nii \
	187	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0026.nii \
	187	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0009.nii \
	187	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0019.nii \
	187	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0029.nii \
	187	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0007.nii \
	187	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0017.nii \
	187	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0027.nii \
	187	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0010.nii \
	187	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0020.nii \
	187	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0030.nii \
	188	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0006.nii \
	188	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0016.nii \
	188	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0026.nii \
	188	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0009.nii \
	188	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0019.nii \
	188	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0029.nii \
	188	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0007.nii \
	188	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0017.nii \
	188	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0027.nii \
	188	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0010.nii \
	188	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0020.nii \
	188	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0030.nii \
	190	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0006.nii \
	190	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0016.nii \
	190	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0026.nii \
	190	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0009.nii \
	190	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0019.nii \
	190	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0029.nii \
	190	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0007.nii \
	190	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0017.nii \
	190	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0027.nii \
	190	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0010.nii \
	190	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0020.nii \
	190	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0030.nii \
	192	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0006.nii \
	192	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0016.nii \
	192	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0026.nii \
	192	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0009.nii \
	192	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0019.nii \
	192	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0029.nii \
	192	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0007.nii \
	192	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0017.nii \
	192	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0027.nii \
	192	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0010.nii \
	192	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0020.nii \
	192	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0030.nii \
	193	Go Good	AL control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0006.nii \
	193	Go Good	PR control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0016.nii \
	193	Go Good	SE control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0026.nii \
	193	Go Bad	AL control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0009.nii \
	193	Go Bad	PR control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0019.nii \
	193	Go Bad	SE control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0029.nii \
	193	Stop Good	AL control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0007.nii \
	193	Stop Good	PR control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0017.nii \
	193	Stop Good	SE control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0027.nii \
	193	Stop Bad	AL control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0010.nii \
	193	Stop Bad	PR control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0020.nii \
	193	Stop Bad	SE control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0030.nii \
	194	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0006.nii \
	194	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0016.nii \
	194	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0026.nii \
	194	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0009.nii \
	194	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0019.nii \
	194	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0029.nii \
	194	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0007.nii \
	194	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0017.nii \
	194	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0027.nii \
	194	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0010.nii \
	194	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0020.nii \
	194	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0030.nii \
	195	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0006.nii \
	195	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0016.nii \
	195	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0026.nii \
	195	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0009.nii \
	195	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0019.nii \
	195	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0029.nii \
	195	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0007.nii \
	195	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0017.nii \
	195	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0027.nii \
	195	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0010.nii \
	195	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0020.nii \
	195	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0030.nii \
	196	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0006.nii \
	196	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0016.nii \
	196	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0026.nii \
	196	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0009.nii \
	196	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0019.nii \
	196	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0029.nii \
	196	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0007.nii \
	196	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0017.nii \
	196	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0027.nii \
	196	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0010.nii \
	196	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0020.nii \
	196	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0030.nii \
	197	Go Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0006.nii \
	197	Go Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0016.nii \
	197	Go Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0026.nii \
	197	Go Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0009.nii \
	197	Go Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0019.nii \
	197	Go Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0029.nii \
	197	Stop Good	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0007.nii \
	197	Stop Good	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0017.nii \
	197	Stop Good	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0027.nii \
	197	Stop Bad	AL	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0010.nii \
	197	Stop Bad	PR	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0020.nii \
	197	Stop Bad	SE	control	/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0030.nii \
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
  
