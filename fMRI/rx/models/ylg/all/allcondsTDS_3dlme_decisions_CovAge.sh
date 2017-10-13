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

cd /projects/dsnlab/tds/fMRI/analysis/rx/ylg/all/tds2/3dLME/Decisions/DecisionsCovAge
	3dLME -prefix DecisionXContextXAgeTDS2 \
	-jobs 28 \
	-model  "Decision*Context*age_c+Decision*Context*age_c2" \
	-ranEff "~1+age_c" \
	-SS_type 3 \
	-qVars "age_c,age_c2" \
	-qVarCenters "0,0" \
	-resid	all2_residuals	\
	-num_glt 9 \
	-gltLabel 1 'DG-DS_AL-SE' -gltCode  1 'Decision : 1*Go -1*Stop Context : 1*AL -1*SE' \
	-gltLabel 2 'DG-DS_AL-PR' -gltCode  2 'Decision : 1*Go -1*Stop Context : 1*AL -1*PR' \
	-gltLabel 3 'DG-DS_PR-SE' -gltCode  3 'Decision : 1*Go -1*Stop Context : 1*PR -1*SE' \
	-gltLabel 4 'age.DG-DS_AL-SE' -gltCode  4 'Decision : 1*Go -1*Stop Context : 1*AL -1*SE age_c' \
	-gltLabel 5 'age.DG-DS_AL-PR' -gltCode  5 'Decision : 1*Go -1*Stop Context : 1*AL -1*PR age_c' \
	-gltLabel 6 'age.DG-DS_PR-SE' -gltCode  6 'Decision : 1*Go -1*Stop Context : 1*PR -1*SE age_c' \
	-gltLabel 7 'age2.DG-DS_AL-SE' -gltCode  7 'Decision : 1*Go -1*Stop Context : 1*AL -1*SE age_c2' \
	-gltLabel 8 'age2.DG-DS_AL-PR' -gltCode  8 'Decision : 1*Go -1*Stop Context : 1*AL -1*PR age_c2' \
	-gltLabel 9 'age2.DG-DS_PR-SE' -gltCode  9 'Decision : 1*Go -1*Stop Context : 1*PR -1*SE age_c2' \
	-mask /projects/dsnlab/tds/fMRI/analysis/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii \
	-dataTable 				\
	Subj	Decision	Context Group age_c	age_c2 InputFile \
	109	Go	AL	control		  -1.19   1.4161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0002.nii \
	109	Go	PR	control		  -1.19   1.4161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0012.nii \
	109	Go	SE	control		  -1.19   1.4161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0022.nii \
	109	Stop	AL	control	  -1.19   1.4161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0003.nii \
	109	Stop	PR	control	  -1.19   1.4161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0013.nii \
	109	Stop	SE	control	  -1.19   1.4161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0023.nii \
	113	Go	AL	control		  0.58   0.3364  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0002.nii \
	113	Go	PR	control		  0.58   0.3364  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0012.nii \
	113	Go	SE	control		  0.58   0.3364  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0022.nii \
	113	Stop	AL	control	  0.58   0.3364  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0003.nii \
	113	Stop	PR	control	  0.58   0.3364  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0013.nii \
	113	Stop	SE	control	  0.58   0.3364  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0023.nii \
	114	Go	AL	control		  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0002.nii \
	114	Go	PR	control		  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0012.nii \
	114	Go	SE	control		  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0022.nii \
	114	Stop	AL	control	  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0003.nii \
	114	Stop	PR	control	  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0013.nii \
	114	Stop	SE	control	  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0023.nii \
	115	Go	AL	control		  2.06   4.2436  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0002.nii \
	115	Go	PR	control		  2.06   4.2436  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0012.nii \
	115	Go	SE	control		  2.06   4.2436  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0022.nii \
	115	Stop	AL	control	  2.06   4.2436  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0003.nii \
	115	Stop	PR	control	  2.06   4.2436  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0013.nii \
	115	Stop	SE	control	  2.06   4.2436  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0023.nii \
	116	Go	AL	control		  -0.62   0.3844  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0002.nii \
	116	Go	PR	control		  -0.62   0.3844  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0012.nii \
	116	Go	SE	control		  -0.62   0.3844  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0022.nii \
	116	Stop	AL	control	  -0.62   0.3844  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0003.nii \
	116	Stop	PR	control	  -0.62   0.3844  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0013.nii \
	116	Stop	SE	control	  -0.62   0.3844  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0023.nii \
	117	Go	AL	control		  1.31   1.7161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0002.nii \
	117	Go	PR	control		  1.31   1.7161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0012.nii \
	117	Go	SE	control		  1.31   1.7161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0022.nii \
	117	Stop	AL	control	  1.31   1.7161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0003.nii \
	117	Stop	PR	control	  1.31   1.7161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0013.nii \
	117	Stop	SE	control	  1.31   1.7161  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0023.nii \
	119	Go	AL	control		  0.39   0.1521  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0002.nii \
	119	Go	PR	control		  0.39   0.1521  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0012.nii \
	119	Go	SE	control		  0.39   0.1521  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0022.nii \
	119	Stop	AL	control	  0.39   0.1521  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0003.nii \
	119	Stop	PR	control	  0.39   0.1521  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0013.nii \
	119	Stop	SE	control	  0.39   0.1521  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0023.nii \
	120	Go	AL	control		  -1.16   1.3456  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0002.nii \
	120	Go	PR	control		  -1.16   1.3456  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0012.nii \
	120	Go	SE	control		  -1.16   1.3456  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0022.nii \
	120	Stop	AL	control	  -1.16   1.3456  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0003.nii \
	120	Stop	PR	control	  -1.16   1.3456  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0013.nii \
	120	Stop	SE	control	  -1.16   1.3456  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0023.nii \
	121	Go	AL	control		  -1.74   3.0276  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0002.nii \
	121	Go	PR	control		  -1.74   3.0276  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0012.nii \
	121	Go	SE	control		  -1.74   3.0276  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0022.nii \
	121	Stop	AL	control	  -1.74   3.0276  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0003.nii \
	121	Stop	PR	control	  -1.74   3.0276  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0013.nii \
	121	Stop	SE	control	  -1.74   3.0276  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0023.nii \
	122	Go	AL	control		  0.5   0.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0002.nii \
	122	Go	PR	control		  0.5   0.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0012.nii \
	122	Go	SE	control		  0.5   0.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0022.nii \
	122	Stop	AL	control	  0.5   0.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0003.nii \
	122	Stop	PR	control	  0.5   0.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0013.nii \
	122	Stop	SE	control	  0.5   0.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0023.nii \
	124	Go	AL	control		  -2.23   4.9729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0002.nii \
	124	Go	PR	control		  -2.23   4.9729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0012.nii \
	124	Go	SE	control		  -2.23   4.9729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0022.nii \
	124	Stop	AL	control	  -2.23   4.9729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0003.nii \
	124	Stop	PR	control	  -2.23   4.9729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0013.nii \
	124	Stop	SE	control	  -2.23   4.9729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0023.nii \
	125	Go	AL	control		  1.51   2.2801  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0002.nii \
	125	Go	PR	control		  1.51   2.2801  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0012.nii \
	125	Go	SE	control		  1.51   2.2801  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0022.nii \
	125	Stop	AL	control	  1.51   2.2801  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0003.nii \
	125	Stop	PR	control	  1.51   2.2801  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0013.nii \
	125	Stop	SE	control	  1.51   2.2801  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0023.nii \
	126	Go	AL	control		  -0.19   0.0361  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0002.nii \
	126	Go	PR	control		  -0.19   0.0361  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0012.nii \
	126	Go	SE	control		  -0.19   0.0361  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0022.nii \
	126	Stop	AL	control	  -0.19   0.0361  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0003.nii \
	126	Stop	PR	control	  -0.19   0.0361  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0013.nii \
	126	Stop	SE	control	  -0.19   0.0361  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0023.nii \
	127	Go	AL	control		  -0.27   0.0729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0002.nii \
	127	Go	PR	control		  -0.27   0.0729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0009.nii \
	127	Go	SE	control		  -0.27   0.0729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0013.nii \
	127	Stop	AL	control	  -0.27   0.0729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0003.nii \
	127	Stop	PR	control	  -0.27   0.0729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0010.nii \
	127	Stop	SE	control	  -0.27   0.0729  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/127/con_0014.nii \
	128	Go	AL	control		  -0.25   0.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0002.nii \
	128	Go	PR	control		  -0.25   0.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0012.nii \
	128	Go	SE	control		  -0.25   0.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0022.nii \
	128	Stop	AL	control	  -0.25   0.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0003.nii \
	128	Stop	PR	control	  -0.25   0.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0013.nii \
	128	Stop	SE	control	  -0.25   0.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0023.nii \
	129	Go	AL	control		  0.34   0.1156  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0002.nii \
	129	Go	PR	control		  0.34   0.1156  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0012.nii \
	129	Go	SE	control		  0.34   0.1156  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0022.nii \
	129	Stop	AL	control	  0.34   0.1156  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0003.nii \
	129	Stop	PR	control	  0.34   0.1156  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0013.nii \
	129	Stop	SE	control	  0.34   0.1156  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0023.nii \
	130	Go	AL	control		  0.05   0.0025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0002.nii \
	130	Go	PR	control		  0.05   0.0025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0012.nii \
	130	Go	SE	control		  0.05   0.0025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0022.nii \
	130	Stop	AL	control	  0.05   0.0025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0003.nii \
	130	Stop	PR	control	  0.05   0.0025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0013.nii \
	130	Stop	SE	control	  0.05   0.0025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0023.nii \
	131	Go	AL	control		  -1.34   1.7956  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0002.nii \
	131	Go	PR	control		  -1.34   1.7956  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0012.nii \
	131	Go	SE	control		  -1.34   1.7956  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0022.nii \
	131	Stop	AL	control	  -1.34   1.7956  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0003.nii \
	131	Stop	PR	control	  -1.34   1.7956  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0013.nii \
	131	Stop	SE	control	  -1.34   1.7956  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0023.nii \
	132	Go	AL	control		  -2.29   5.2441  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0002.nii \
	132	Go	PR	control		  -2.29   5.2441  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0012.nii \
	132	Go	SE	control		  -2.29   5.2441  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0022.nii \
	132	Stop	AL	control	  -2.29   5.2441  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0003.nii \
	132	Stop	PR	control	  -2.29   5.2441  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0013.nii \
	132	Stop	SE	control	  -2.29   5.2441  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0023.nii \
	133	Go	AL	control		  0.88   0.7744  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0002.nii \
	133	Go	PR	control		  0.88   0.7744  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0012.nii \
	133	Go	SE	control		  0.88   0.7744  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0022.nii \
	133	Stop	AL	control	  0.88   0.7744  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0003.nii \
	133	Stop	PR	control	  0.88   0.7744  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0013.nii \
	133	Stop	SE	control	  0.88   0.7744  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0023.nii \
	134	Go	AL	control		  -3.03   9.1809  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0002.nii \
	134	Go	PR	control		  -3.03   9.1809  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0012.nii \
	134	Go	SE	control		  -3.03   9.1809  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0022.nii \
	134	Stop	AL	control	  -3.03   9.1809  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0003.nii \
	134	Stop	PR	control	  -3.03   9.1809  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0013.nii \
	134	Stop	SE	control	  -3.03   9.1809  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0023.nii \	
	135	Go	AL	control		  -0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0002.nii \
	135	Go	PR	control		  -0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0009.nii \
	135	Go	SE	control		  -0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0019.nii \
	135	Stop	AL	control	  -0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0003.nii \
	135	Stop	PR	control	  -0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0010.nii \
	135	Stop	SE	control	  -0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0020.nii \
	136	Go	AL	control		  3.24    0.4976  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0002.nii \
	136	Go	PR	control		  3.24    0.4976  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0012.nii \
	136	Go	SE	control		  3.24    0.4976  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0022.nii \
	136	Stop	AL	control	  3.24    0.4976  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0003.nii \
	136	Stop	PR	control	  3.24    0.4976  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0013.nii \
	136	Stop	SE	control	  3.24    0.4976  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0023.nii \
	137	Go	AL	control		  1.08   1.1664  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/135/con_0002.nii \
	137	Go	PR	control		  1.08   1.1664  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/137/con_0009.nii \
	137	Go	SE	control		  1.08   1.1664  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/137/con_0019.nii \
	137	Stop	AL	control	  1.08   1.1664  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/137/con_0003.nii \
	137	Stop	PR	control	  1.08   1.1664  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/137/con_0010.nii \
	137	Stop	SE	control	  1.08   1.1664  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/137/con_0020.nii \
	139	Go	AL	control		  2.28   5.1984  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0002.nii \
	139	Go	PR	control		  2.28   5.1984  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0012.nii \
	139	Stop	AL	control	  2.28   5.1984  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0003.nii \
	139	Stop	PR	control	  2.28   5.1984  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/139/con_0013.nii \
	140	Go	AL	control		  2.66   7.0756  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0002.nii \
	140	Go	PR	control		  2.66   7.0756  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0012.nii \
	140	Go	SE	control		  2.66   7.0756  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0022.nii \
	140	Stop	AL	control	  2.66   7.0756  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0003.nii \
	140	Stop	PR	control	  2.66   7.0756  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0013.nii \
	140	Stop	SE	control	  2.66   7.0756  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0023.nii \
	141	Go	AL	control		  0.01     00E-04  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0002.nii \
	141	Go	PR	control		  0.01     00E-04  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0012.nii \
	141	Go	SE	control		  0.01     00E-04  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0022.nii \
	141	Stop	AL	control	  0.01     00E-04  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0003.nii \
	141	Stop	PR	control	  0.01     00E-04  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0013.nii \
	141	Stop	SE	control	  0.01     00E-04  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0023.nii \
	142	Go	AL	control		      1  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0002.nii \
	142	Go	PR	control		      1  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0012.nii \
	142	Go	SE	control		      1  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0022.nii \
	142	Stop	AL	control	      1  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0003.nii \
	142	Stop	PR	control	      1  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0013.nii \
	142	Stop	SE	control	      1  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0023.nii \
	144	Go	AL	control		  3.52    2.3904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0002.nii \
	144	Go	PR	control		  3.52    2.3904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0012.nii \
	144	Go	SE	control		  3.52    2.3904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0022.nii \
	144	Stop	AL	control	  3.52    2.3904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0003.nii \
	144	Stop	PR	control	  3.52    2.3904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0013.nii \
	144	Stop	SE	control	  3.52    2.3904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0023.nii \
	145	Go	AL	control		  -2.44   5.9536  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0002.nii \
	145	Go	PR	control		  -2.44   5.9536  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0012.nii \
	145	Go	SE	control		  -2.44   5.9536  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0022.nii \
	145	Stop	AL	control	  -2.44   5.9536  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0003.nii \
	145	Stop	PR	control	  -2.44   5.9536  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0013.nii \
	145	Stop	SE	control	  -2.44   5.9536  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0023.nii \
	146	Go	AL	control		  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0002.nii \
	146	Go	PR	control		  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0012.nii \
	146	Go	SE	control		  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0022.nii \
	146	Stop	AL	control	  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0003.nii \
	146	Stop	PR	control	  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0013.nii \
	146	Stop	SE	control	  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0023.nii \
	150	Go	AL	control		  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0002.nii \
	150	Go	PR	control		  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0012.nii \
	150	Go	SE	control		  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0022.nii \
	150	Stop	AL	control	  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0003.nii \
	150	Stop	PR	control	  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0013.nii \
	150	Stop	SE	control	  0.7   0.49  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0023.nii \
	151	Go	AL	control		  2.4   5.76  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0002.nii \
	151	Go	PR	control		  2.4   5.76  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0012.nii \
	151	Go	SE	control		  2.4   5.76  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0022.nii \
	151	Stop	AL	control	  2.4   5.76  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0003.nii \
	151	Stop	PR	control	  2.4   5.76  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0013.nii \
	151	Stop	SE	control	  2.4   5.76  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0023.nii \
	152	Go	AL	control		  1.48   2.1904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0002.nii \
	152	Go	PR	control		  1.48   2.1904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0012.nii \
	152	Go	SE	control		  1.48   2.1904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0022.nii \
	152	Stop	AL	control	  1.48   2.1904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0003.nii \
	152	Stop	PR	control	  1.48   2.1904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0013.nii \
	152	Stop	SE	control	  1.48   2.1904  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0023.nii \
	155	Go	AL	control		  -1.37   1.8769  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0002.nii \
	155	Go	PR	control		  -1.37   1.8769  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0012.nii \
	155	Go	SE	control		  -1.37   1.8769  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0022.nii \
	155	Stop	AL	control	  -1.37   1.8769  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0003.nii \
	155	Stop	PR	control	  -1.37   1.8769  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0013.nii \
	155	Stop	SE	control	  -1.37   1.8769  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0023.nii \
	156	Go	AL	control		  0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0002.nii \
	156	Go	PR	control		  0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0012.nii \
	156	Go	SE	control		  0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0022.nii \
	156	Stop	AL	control	  0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0003.nii \
	156	Stop	PR	control	  0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0013.nii \
	156	Stop	SE	control	  0.11   0.0121  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0023.nii \
	157	Go	AL	control		  -0.14   0.0196  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0002.nii \
	157	Go	PR	control		  -0.14   0.0196  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0012.nii \
	157	Go	SE	control		  -0.14   0.0196  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0022.nii \
	157	Stop	AL	control	  -0.14   0.0196  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0003.nii \
	157	Stop	PR	control	  -0.14   0.0196  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0013.nii \
	157	Stop	SE	control	  -0.14   0.0196  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0023.nii \
	159	Go	AL	control		  0.03   0.0009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0002.nii \
	159	Go	PR	control		  0.03   0.0009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0012.nii \
	159	Go	SE	control		  0.03   0.0009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0022.nii \
	159	Stop	AL	control	  0.03   0.0009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0003.nii \
	159	Stop	PR	control	  0.03   0.0009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0013.nii \
	159	Stop	SE	control	  0.03   0.0009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0023.nii \
	160	Go	AL	control		  -0.55   0.3025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0002.nii \
	160	Go	PR	control		  -0.55   0.3025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0012.nii \
	160	Go	SE	control		  -0.55   0.3025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0022.nii \
	160	Stop	AL	control	  -0.55   0.3025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0003.nii \
	160	Stop	PR	control	  -0.55   0.3025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0013.nii \
	160	Stop	SE	control	  -0.55   0.3025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0023.nii \
	161	Go	AL	control		  -2.47   6.1009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0002.nii \
	161	Go	PR	control		  -2.47   6.1009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0012.nii \
	161	Go	SE	control		  -2.47   6.1009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0022.nii \
	161	Stop	AL	control	  -2.47   6.1009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0003.nii \
	161	Stop	PR	control	  -2.47   6.1009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0013.nii \
	161	Stop	SE	control	  -2.47   6.1009  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0023.nii \
	162	Go	AL	control		  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0002.nii \
	162	Go	PR	control		  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0012.nii \
	162	Go	SE	control		  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0022.nii \
	162	Stop	AL	control	  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0003.nii \
	162	Stop	PR	control	  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0013.nii \
	162	Stop	SE	control	  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0023.nii \
	163	Go	AL	control		  1.65   2.7225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0002.nii \
	163	Go	PR	control		  1.65   2.7225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0012.nii \
	163	Go	SE	control		  1.65   2.7225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0022.nii \
	163	Stop	AL	control	  1.65   2.7225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0003.nii \
	163	Stop	PR	control	  1.65   2.7225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0013.nii \
	163	Stop	SE	control	  1.65   2.7225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0023.nii \
	164	Go	AL	control		  1.59   2.5281  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0002.nii \
	164	Go	PR	control		  1.59   2.5281  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0012.nii \
	164	Go	SE	control		  1.59   2.5281  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0022.nii \
	164	Stop	AL	control	  1.59   2.5281  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0003.nii \
	164	Stop	PR	control	  1.59   2.5281  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0013.nii \
	164	Stop	SE	control	  1.59   2.5281  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0023.nii \
	165	Go	AL	control		  -0.73   0.5329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0002.nii \
	165	Go	PR	control		  -0.73   0.5329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0012.nii \
	165	Go	SE	control		  -0.73   0.5329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0022.nii \
	165	Stop	AL	control	  -0.73   0.5329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0003.nii \
	165	Stop	PR	control	  -0.73   0.5329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0013.nii \
	165	Stop	SE	control	  -0.73   0.5329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0023.nii \
	167	Go	AL	control		  3.5   12.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0002.nii \
	167	Go	PR	control		  3.5   12.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0012.nii \
	167	Go	SE	control		  3.5   12.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0022.nii \
	167	Stop	AL	control	  3.5   12.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0003.nii \
	167	Stop	PR	control	  3.5   12.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0013.nii \
	167	Stop	SE	control	  3.5   12.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0023.nii \
	168	Go	AL	control		  -1.75   3.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0002.nii \
	168	Go	PR	control		  -1.75   3.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0012.nii \
	168	Go	SE	control		  -1.75   3.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0022.nii \
	168	Stop	AL	control	  -1.75   3.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0003.nii \
	168	Stop	PR	control	  -1.75   3.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0013.nii \
	168	Stop	SE	control	  -1.75   3.0625  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0023.nii \
	169	Go	AL	control		  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0002.nii \
	169	Go	PR	control		  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0012.nii \
	169	Go	SE	control		  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0022.nii \
	169	Stop	AL	control	  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0003.nii \
	169	Stop	PR	control	  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0013.nii \
	169	Stop	SE	control	  1.77   3.1329  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0023.nii \
	170	Go	AL	control		  -1.29   1.6641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0002.nii \
	170	Go	PR	control		  -1.29   1.6641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0012.nii \
	170	Go	SE	control		  -1.29   1.6641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0022.nii \
	170	Stop	AL	control	  -1.29   1.6641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0003.nii \
	170	Stop	PR	control	  -1.29   1.6641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0013.nii \
	170	Stop	SE	control	  -1.29   1.6641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0023.nii \
	171	Go	AL	control		  -0.78   0.6084  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0002.nii \
	171	Go	PR	control		  -0.78   0.6084  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0012.nii \
	171	Go	SE	control		  -0.78   0.6084  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0022.nii \
	171	Stop	AL	control	  -0.78   0.6084  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0003.nii \
	171	Stop	PR	control	  -0.78   0.6084  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0013.nii \
	171	Stop	SE	control	  -0.78   0.6084  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0023.nii \
	172	Go	AL	control		  -1.05   1.1025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0002.nii \
	172	Go	PR	control		  -1.05   1.1025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0012.nii \
	172	Go	SE	control		  -1.05   1.1025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0022.nii \
	172	Stop	AL	control	  -1.05   1.1025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0003.nii \
	172	Stop	PR	control	  -1.05   1.1025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0013.nii \
	172	Stop	SE	control	  -1.05   1.1025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0023.nii \
	173	Go	AL	control		  3.55    2.6025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0002.nii \
	173	Go	PR	control		  3.55    2.6025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0012.nii \
	173	Go	SE	control		  3.55    2.6025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0022.nii \
	173	Stop	AL	control	  3.55    2.6025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0003.nii \
	173	Stop	PR	control	  3.55    2.6025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0013.nii \
	173	Stop	SE	control	  3.55    2.6025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0023.nii \
	174	Go	AL	control		  1.83   3.3489  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0002.nii \
	174	Go	PR	control		  1.83   3.3489  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0012.nii \
	174	Go	SE	control		  1.83   3.3489  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0022.nii \
	174	Stop	AL	control	  1.83   3.3489  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0003.nii \
	174	Stop	PR	control	  1.83   3.3489  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0013.nii \
	174	Stop	SE	control	  1.83   3.3489  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0023.nii \
	175	Go	AL	control		  -0.77   0.5929  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0002.nii \
	175	Go	PR	control		  -0.77   0.5929  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0012.nii \
	175	Go	SE	control		  -0.77   0.5929  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0022.nii \
	175	Stop	AL	control	  -0.77   0.5929  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0003.nii \
	175	Stop	PR	control	  -0.77   0.5929  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0013.nii \
	175	Stop	SE	control	  -0.77   0.5929  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0023.nii \
	177	Go	AL	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0002.nii \
	177	Go	PR	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0012.nii \
	177	Go	SE	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0022.nii \
	177	Stop	AL	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0003.nii \
	177	Stop	PR	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0013.nii \
	177	Stop	SE	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0023.nii \
	178	Go	AL	control		  -0.35   0.1225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0002.nii \
	178	Go	PR	control		  -0.35   0.1225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0012.nii \
	178	Go	SE	control		  -0.35   0.1225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0022.nii \
	178	Stop	AL	control	  -0.35   0.1225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0003.nii \
	178	Stop	PR	control	  -0.35   0.1225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0013.nii \
	178	Stop	SE	control	  -0.35   0.1225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0023.nii \
	179	Go	AL	control		  -0.84   0.7056  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0002.nii \
	179	Go	PR	control		  -0.84   0.7056  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0012.nii \
	179	Go	SE	control		  -0.84   0.7056  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0022.nii \
	179	Stop	AL	control	  -0.84   0.7056  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0003.nii \
	179	Stop	PR	control	  -0.84   0.7056  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0013.nii \
	179	Stop	SE	control	  -0.84   0.7056  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0023.nii \
	181	Go	AL	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0002.nii \
	181	Go	PR	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0012.nii \
	181	Go	SE	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0022.nii \
	181	Stop	AL	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0003.nii \
	181	Stop	PR	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0013.nii \
	181	Stop	SE	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0023.nii \
	182	Go	AL	control		  -1.21   1.4641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0002.nii \
	182	Go	PR	control		  -1.21   1.4641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0012.nii \
	182	Go	SE	control		  -1.21   1.4641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0022.nii \
	182	Stop	AL	control	  -1.21   1.4641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0003.nii \
	182	Stop	PR	control	  -1.21   1.4641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0013.nii \
	182	Stop	SE	control	  -1.21   1.4641  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0023.nii \
	183	Go	AL	control		  -0.47   0.2209  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0002.nii \
	183	Go	PR	control		  -0.47   0.2209  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0012.nii \
	183	Go	SE	control		  -0.47   0.2209  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0022.nii \
	183	Stop	AL	control	  -0.47   0.2209  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0003.nii \
	183	Stop	PR	control	  -0.47   0.2209  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0013.nii \
	183	Stop	SE	control	  -0.47   0.2209  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0023.nii \
	184	Go	AL	control		  -2.15   4.6225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0002.nii \
	184	Go	PR	control		  -2.15   4.6225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0012.nii \
	184	Go	SE	control		  -2.15   4.6225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0022.nii \
	184	Stop	AL	control	  -2.15   4.6225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0003.nii \
	184	Stop	PR	control	  -2.15   4.6225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0013.nii \
	184	Stop	SE	control	  -2.15   4.6225  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0023.nii \
	185	Go	AL	control		  -2.5   6.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0002.nii \
	185	Go	PR	control		  -2.5   6.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0012.nii \
	185	Go	SE	control		  -2.5   6.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0022.nii \
	185	Stop	AL	control	  -2.5   6.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0003.nii \
	185	Stop	PR	control	  -2.5   6.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0013.nii \
	185	Stop	SE	control	  -2.5   6.25  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0023.nii \
	186	Go	AL	control		  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0002.nii \
	186	Go	PR	control		  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0012.nii \
	186	Go	SE	control		  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0022.nii \
	186	Stop	AL	control	  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0003.nii \
	186	Stop	PR	control	  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0013.nii \
	186	Stop	SE	control	  0.38   0.1444  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0023.nii \
	187	Go	AL	control		  -0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0002.nii \
	187	Go	PR	control		  -0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0012.nii \
	187	Go	SE	control		  -0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0022.nii \
	187	Stop	AL	control	  -0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0003.nii \
	187	Stop	PR	control	  -0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0013.nii \
	187	Stop	SE	control	  -0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0023.nii \
	188	Go	AL	control		  -1.49   2.2201  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0002.nii \
	188	Go	PR	control		  -1.49   2.2201  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0012.nii \
	188	Go	SE	control		  -1.49   2.2201  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0022.nii \
	188	Stop	AL	control	  -1.49   2.2201  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0003.nii \
	188	Stop	PR	control	  -1.49   2.2201  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0013.nii \
	188	Stop	SE	control	  -1.49   2.2201  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0023.nii \
	190	Go	AL	control		  -1.44   2.0736  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0002.nii \
	190	Go	PR	control		  -1.44   2.0736  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0012.nii \
	190	Go	SE	control		  -1.44   2.0736  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0022.nii \
	190	Stop	AL	control	  -1.44   2.0736  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0003.nii \
	190	Stop	PR	control	  -1.44   2.0736  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0013.nii \
	190	Stop	SE	control	  -1.44   2.0736  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0023.nii \
	192	Go	AL	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0002.nii \
	192	Go	PR	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0012.nii \
	192	Go	SE	control		  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0022.nii \
	192	Stop	AL	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0003.nii \
	192	Stop	PR	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0013.nii \
	192	Stop	SE	control	  -0.64   0.4096  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0023.nii \
	193	Go	AL	control		  0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0002.nii \
	193	Go	PR	control		  0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0012.nii \
	193	Go	SE	control		  0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0022.nii \
	193	Stop	AL	control	  0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0003.nii \
	193	Stop	PR	control	  0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0013.nii \
	193	Stop	SE	control	  0.45   0.2025  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0023.nii \
	194	Go	AL	control		  0.29   0.0841  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0002.nii \
	194	Go	PR	control		  0.29   0.0841  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0012.nii \
	194	Go	SE	control		  0.29   0.0841  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0022.nii \
	194	Stop	AL	control	  0.29   0.0841  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0003.nii \
	194	Stop	PR	control	  0.29   0.0841  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0013.nii \
	194	Stop	SE	control	  0.29   0.0841  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0023.nii \
	195	Go	AL	control		  0.18   0.0324  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0002.nii \
	195	Go	PR	control		  0.18   0.0324  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0012.nii \
	195	Go	SE	control		  0.18   0.0324  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0022.nii \
	195	Stop	AL	control	  0.18   0.0324  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0003.nii \
	195	Stop	PR	control	  0.18   0.0324  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0013.nii \
	195	Stop	SE	control	  0.18   0.0324  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0023.nii \
	196	Go	AL	control		  1.17   1.3689  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0002.nii \
	196	Go	PR	control		  1.17   1.3689  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0012.nii \
	196	Go	SE	control		  1.17   1.3689  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0022.nii \
	196	Stop	AL	control	  1.17   1.3689  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0003.nii \
	196	Stop	PR	control	  1.17   1.3689  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0013.nii \
	196	Stop	SE	control	  1.17   1.3689  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0023.nii \
	197	Go	AL	control		  0.09   0.0081  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0002.nii \
	197	Go	PR	control		  0.09   0.0081  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0012.nii \
	197	Go	SE	control		  0.09   0.0081  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0022.nii \
	197	Stop	AL	control	  0.09   0.0081  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0003.nii \
	197	Stop	PR	control	  0.09   0.0081  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0013.nii \
	197	Stop	SE	control	  0.09.   0.0081  /projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0023.nii \
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
  
