#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=TDS_allconds_3dmvm
#SBATCH --output=output/allcons_3dmvm.log
#SBATCH --error=output/allcons_3dmvm_error.log
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=short,fat

module load prl afni

cd /projects/dsnlab/shared/tds/fMRI/analysis/rx/ylg/all/tds2/3dMVM/Outcomes 
	3dMVM -prefix OutcomesXContextTDS2 \
	-jobs 28 \
	-model  "Outcome*Context" \
	-ranEff "~1" \
	-SS_type 3 \
	-num_glt 12 \
	-gltLabel 1 'OG-OB_AL-SE' -gltCode 1   'Outcome : 1*Good -1*Bad Context : 1*AL -1*SE' \
	-gltLabel 2 'OG-OB_AL-PR' -gltCode 2   'Outcome : 1*Good -1*Bad Context : 1*AL -1*PR' \
	-gltLabel 3 'OG-OB_PR-SE' -gltCode 3   'Outcome : 1*Good -1*Bad Context : 1*PR -1*SE' \
	-gltLabel 4 'OG-OB_AL-SE' -gltCode 4   'Outcome : 1*Good -1*Bad Context : 1*AL -1*SE' \
	-gltLabel 5 'OG-OB_AL-PR' -gltCode 5   'Outcome : 1*Good -1*Bad Context : 1*AL -1*PR' \
	-gltLabel 6 'OG-OB_PR-SE' -gltCode 6   'Outcome : 1*Good -1*Bad Context : 1*PR -1*SE' \
	-gltLabel 7 'OG_AL-SE'  -gltCode 7   'Outcome : 1*Good Context : 1*AL -1*SE' \
	-gltLabel 8 'OG_AL-PR'  -gltCode 8   'Outcome : 1*Good Context : 1*AL -1*PR' \
	-gltLabel 9 'OG_PR-SE'  -gltCode 9   'Outcome : 1*Good Context : 1*PR -1*SE' \
	-gltLabel 10 'OB_AL-SE' -gltCode 10  'Outcome : 1*Bad Context : 1*AL -1*SE' \
	-gltLabel 11 'OB_AL-PR' -gltCode 11  'Outcome : 1*Bad Context : 1*AL -1*PR' \
	-gltLabel 12 'OB_PR-SE' -gltCode 12  'Outcome : 1*Bad Context : 1*PR -1*SE' \
	-mask /projects/dsnlab/shared/tds/fMRI/analysis/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii \
	-dataTable 				\
	Subj Outcome Context Group InputFile \
	109	Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0005.nii \
	109	Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0015.nii \
	109	Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0025.nii \
	109	Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0008.nii \
	109	Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0018.nii \
	109	Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/109/con_0028.nii \
	113	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0005.nii \
	113	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0015.nii \
	113	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0025.nii \
	113	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0008.nii \
	113	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0018.nii \
	113	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/113/con_0028.nii \
	114	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0005.nii \
	114	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0015.nii \
	114	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0025.nii \
	114	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0008.nii \
	114	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0018.nii \
	114	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/114/con_0028.nii \
	115	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0005.nii \
	115	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0015.nii \
	115	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0025.nii \
	115	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0008.nii \
	115	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0018.nii \
	115	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/115/con_0028.nii \
	116	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0005.nii \
	116	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0015.nii \
	116	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0025.nii \
	116	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0008.nii \
	116	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0018.nii \
	116	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/116/con_0028.nii \
	117	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0005.nii \
	117	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0015.nii \
	117	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0025.nii \
	117	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0008.nii \
	117	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0018.nii \
	117	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/117/con_0028.nii \
	119	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0005.nii \
	119	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0015.nii \
	119	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0025.nii \
	119	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0008.nii \
	119	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0018.nii \
	119	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/119/con_0028.nii \
	120	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0005.nii \
	120	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0015.nii \
	120	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0025.nii \
	120	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0008.nii \
	120	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0018.nii \
	120	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/120/con_0028.nii \
	121	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0005.nii \
	121	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0015.nii \
	121	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0025.nii \
	121	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0008.nii \
	121	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0018.nii \
	121	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/121/con_0028.nii \
	122	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0005.nii \
	122	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0015.nii \
	122	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0025.nii \
	122	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0008.nii \
	122	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0018.nii \
	122	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/122/con_0028.nii \
	124	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0005.nii \
	124	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0015.nii \
	124	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0025.nii \
	124	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0008.nii \
	124	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0018.nii \
	124	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/124/con_0028.nii \
	125	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0005.nii \
	125	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0015.nii \
	125	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0025.nii \
	125	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0008.nii \
	125	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0018.nii \
	125	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/125/con_0028.nii \
	126	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0005.nii \
	126	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0015.nii \
	126	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0025.nii \
	126	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0008.nii \
	126	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0018.nii \
	126	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/126/con_0028.nii \
	128	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0005.nii \
	128	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0015.nii \
	128	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0025.nii \
	128	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0008.nii \
	128	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0018.nii \
	128	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/128/con_0028.nii \
	129	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0005.nii \
	129	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0015.nii \
	129	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0025.nii \
	129	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0008.nii \
	129	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0018.nii \
	129	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/129/con_0028.nii \
	130	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0005.nii \
	130	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0015.nii \
	130	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0025.nii \
	130	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0008.nii \
	130	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0018.nii \
	130	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/130/con_0028.nii \
	131	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0005.nii \
	131	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0015.nii \
	131	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0025.nii \
	131	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0008.nii \
	131	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0018.nii \
	131	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/131/con_0028.nii \
	132	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0005.nii \
	132	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0015.nii \
	132	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0025.nii \
	132	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0008.nii \
	132	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0018.nii \
	132	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/132/con_0028.nii \
	133	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0005.nii \
	133	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0015.nii \
	133	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0025.nii \
	133	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0008.nii \
	133	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0018.nii \
	133	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/133/con_0028.nii \
	134	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0005.nii \
	134	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0015.nii \
	134	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0025.nii \
	134	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0008.nii \
	134	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0018.nii \
	134	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/134/con_0028.nii \
	136	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0005.nii \
	136	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0015.nii \
	136	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0025.nii \
	136	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0008.nii \
	136	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0018.nii \
	136	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/136/con_0028.nii \
	140	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0005.nii \
	140	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0015.nii \
	140	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0025.nii \
	140	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0008.nii \
	140	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0018.nii \
	140	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/140/con_0028.nii \
	141	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0005.nii \
	141	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0015.nii \
	141	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0025.nii \
	141	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0008.nii \
	141	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0018.nii \
	141	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/141/con_0028.nii \
	142	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0005.nii \
	142	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0015.nii \
	142	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0025.nii \
	142	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0008.nii \
	142	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0018.nii \
	142	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/142/con_0028.nii \
	144	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0005.nii \
	144	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0015.nii \
	144	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0025.nii \
	144	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0008.nii \
	144	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0018.nii \
	144	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/144/con_0028.nii \
	145	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0005.nii \
	145	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0015.nii \
	145	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0025.nii \
	145	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0008.nii \
	145	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0018.nii \
	145	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/145/con_0028.nii \
	146	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0005.nii \
	146	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0015.nii \
	146	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0025.nii \
	146	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0008.nii \
	146	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0018.nii \
	146	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/146/con_0028.nii \
	150	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0005.nii \
	150	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0015.nii \
	150	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0025.nii \
	150	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0008.nii \
	150	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0018.nii \
	150	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/150/con_0028.nii \
	151	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0005.nii \
	151	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0015.nii \
	151	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0025.nii \
	151	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0008.nii \
	151	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0018.nii \
	151	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/151/con_0028.nii \
	152	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0005.nii \
	152	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0015.nii \
	152	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0025.nii \
	152	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0008.nii \
	152	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0018.nii \
	152	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/152/con_0028.nii \
	155	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0005.nii \
	155	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0015.nii \
	155	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0025.nii \
	155	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0008.nii \
	155	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0018.nii \
	155	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/155/con_0028.nii \
	156	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0005.nii \
	156	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0015.nii \
	156	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0025.nii \
	156	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0008.nii \
	156	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0018.nii \
	156	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/156/con_0028.nii \
	157	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0005.nii \
	157	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0015.nii \
	157	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0025.nii \
	157	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0008.nii \
	157	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0018.nii \
	157	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/157/con_0028.nii \
	159	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0005.nii \
	159	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0015.nii \
	159	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0025.nii \
	159	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0008.nii \
	159	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0018.nii \
	159	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/159/con_0028.nii \
	160	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0005.nii \
	160	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0015.nii \
	160	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0025.nii \
	160	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0008.nii \
	160	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0018.nii \
	160	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/160/con_0028.nii \
	161	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0005.nii \
	161	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0015.nii \
	161	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0025.nii \
	161	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0008.nii \
	161	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0018.nii \
	161	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/161/con_0028.nii \
	162	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0005.nii \
	162	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0015.nii \
	162	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0025.nii \
	162	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0008.nii \
	162	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0018.nii \
	162	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/162/con_0028.nii \
	163	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0005.nii \
	163	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0015.nii \
	163	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0025.nii \
	163	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0008.nii \
	163	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0018.nii \
	163	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/163/con_0028.nii \
	164	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0005.nii \
	164	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0015.nii \
	164	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0025.nii \
	164	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0008.nii \
	164	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0018.nii \
	164	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/164/con_0028.nii \
	165	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0005.nii \
	165	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0015.nii \
	165	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0025.nii \
	165	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0008.nii \
	165	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0018.nii \
	165	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/165/con_0028.nii \
	167	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0005.nii \
	167	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0015.nii \
	167	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0025.nii \
	167	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0008.nii \
	167	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0018.nii \
	167	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/167/con_0028.nii \
	168	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0005.nii \
	168	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0015.nii \
	168	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0025.nii \
	168	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0008.nii \
	168	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0018.nii \
	168	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/168/con_0028.nii \
	169	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0005.nii \
	169	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0015.nii \
	169	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0025.nii \
	169	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0008.nii \
	169	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0018.nii \
	169	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/169/con_0028.nii \
	170	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0005.nii \
	170	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0015.nii \
	170	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0025.nii \
	170	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0008.nii \
	170	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0018.nii \
	170	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/170/con_0028.nii \
	171	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0005.nii \
	171	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0015.nii \
	171	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0025.nii \
	171	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0008.nii \
	171	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0018.nii \
	171	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/171/con_0028.nii \
	172	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0005.nii \
	172	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0015.nii \
	172	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0025.nii \
	172	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0008.nii \
	172	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0018.nii \
	172	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/172/con_0028.nii \
	173	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0005.nii \
	173	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0015.nii \
	173	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0025.nii \
	173	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0008.nii \
	173	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0018.nii \
	173	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/173/con_0028.nii \
	174	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0005.nii \
	174	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0015.nii \
	174	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0025.nii \
	174	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0008.nii \
	174	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0018.nii \
	174	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/174/con_0028.nii \
	175	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0005.nii \
	175	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0015.nii \
	175	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0025.nii \
	175	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0008.nii \
	175	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0018.nii \
	175	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/175/con_0028.nii \
	177	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0005.nii \
	177	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0015.nii \
	177	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0025.nii \
	177	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0008.nii \
	177	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0018.nii \
	177	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/177/con_0028.nii \
	178	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0005.nii \
	178	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0015.nii \
	178	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0025.nii \
	178	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0008.nii \
	178	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0018.nii \
	178	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/178/con_0028.nii \
	179	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0005.nii \
	179	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0015.nii \
	179	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0025.nii \
	179	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0008.nii \
	179	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0018.nii \
	179	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/179/con_0028.nii \
	181	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0005.nii \
	181	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0015.nii \
	181	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0025.nii \
	181	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0008.nii \
	181	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0018.nii \
	181	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/181/con_0028.nii \
	182	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0005.nii \
	182	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0015.nii \
	182	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0025.nii \
	182	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0008.nii \
	182	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0018.nii \
	182	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/182/con_0028.nii \
	183	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0005.nii \
	183	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0015.nii \
	183	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0025.nii \
	183	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0008.nii \
	183	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0018.nii \
	183	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/183/con_0028.nii \
	184	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0005.nii \
	184	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0015.nii \
	184	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0025.nii \
	184	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0008.nii \
	184	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0018.nii \
	184	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/184/con_0028.nii \
	185	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0005.nii \
	185	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0015.nii \
	185	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0025.nii \
	185	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0008.nii \
	185	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0018.nii \
	185	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/185/con_0028.nii \
	186	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0005.nii \
	186	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0015.nii \
	186	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0025.nii \
	186	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0008.nii \
	186	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0018.nii \
	186	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/186/con_0028.nii \
	187	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0005.nii \
	187	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0015.nii \
	187	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0025.nii \
	187	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0008.nii \
	187	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0018.nii \
	187	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/187/con_0028.nii \
	188	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0005.nii \
	188	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0015.nii \
	188	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0025.nii \
	188	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0008.nii \
	188	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0018.nii \
	188	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/188/con_0028.nii \
	190	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0005.nii \
	190	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0015.nii \
	190	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0025.nii \
	190	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0008.nii \
	190	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0018.nii \
	190	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/190/con_0028.nii \
	192	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0005.nii \
	192	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0015.nii \
	192	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0025.nii \
	192	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0008.nii \
	192	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0018.nii \
	192	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/192/con_0028.nii \
	193	Go Good	AL control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0005.nii \
	193	Go Good	PR control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0015.nii \
	193	Go Good	SE control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0025.nii \
	193	Go Bad	AL control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0008.nii \
	193	Go Bad	PR control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0018.nii \
	193	Go Bad	SE control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/193/con_0028.nii \
	194	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0005.nii \
	194	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0015.nii \
	194	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0025.nii \
	194	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0008.nii \
	194	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0018.nii \
	194	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/194/con_0028.nii \
	195	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0005.nii \
	195	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0015.nii \
	195	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0025.nii \
	195	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0008.nii \
	195	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0018.nii \
	195	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/195/con_0028.nii \
	196	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0005.nii \
	196	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0015.nii \
	196	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0025.nii \
	196	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0008.nii \
	196	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0018.nii \
	196	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/196/con_0028.nii \
	197	Go Good	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0005.nii \
	197	Go Good	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0015.nii \
	197	Go Good	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0025.nii \
	197	Go Bad	AL	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0008.nii \
	197	Go Bad	PR	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0018.nii \
	197	Go Bad	SE	control	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth/197/con_0028.nii \

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
  
