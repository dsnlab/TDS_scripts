#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=TDS2_covbehav_3dmvm
#SBATCH --output=output/allcons_covbehav_3dmvm.log
#SBATCH --error=output/allcons_3dmvm_covbehav_error.log
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=short,fat

module load prl afni/17.3.00
export LD_PRELOAD=/packages/gcc/7.2/lib64/libstdc++.so

cd /projects/dsnlab/shared/tds/fMRI/analysis/rx/ylg/all/tds2/3dMVM_nopmod/DecisionsXContext
	3dMVM -prefix DecisionsXContextTDS2_covbehav \
	-jobs 28 \
	-bsVars "Per_Go" \
	-wsVars  "Decision*Context" \
	-qVars "Per_Go" \
	-SS_type 3 \
	-num_glt 30 \
	-gltLabel 1 'D_AL-SE_COM' -gltCode 1  'Decision : 1*DS +1*DG Context : 1*AL -1*SE Per_Go: ' \
	-gltLabel 2 'D_AL-PR_COM' -gltCode 2  'Decision : 1*DS +1*DG Context : 1*AL -1*PR Per_Go: ' \
	-gltLabel 3 'D_PR-SE_COM' -gltCode 3  'Decision : 1*DS +1*DG Context : 1*PR -1*SE Per_Go: ' \
	-gltLabel 4 'DS_DG_AL-SE_COM' -gltCode 4  'Decision : 1*DS -1*DG Context : 1*AL -1*SE Per_Go: ' \
	-gltLabel 5 'DS_DG_AL-PR_COM' -gltCode 5  'Decision : 1*DS -1*DG Context : 1*AL -1*PR Per_Go: ' \
	-gltLabel 6 'DS_DG_PR-SE_COM' -gltCode 6  'Decision : 1*DS -1*DG Context : 1*PR -1*SE Per_Go: ' \
	-gltLabel 7 'DS_AL_COM' -gltCode 7 'Decision : 1*DS Context : 1*AL Per_Go: ' \
	-gltLabel 8 'DG_AL_COM' -gltCode 8 'Decision : 1*DG Context : 1*AL Per_Go: ' \
	-gltLabel 9 'DS_PR_COM' -gltCode 9 'Decision : 1*DS Context : 1*PR Per_Go: ' \
	-gltLabel 10 'DG_PR_COM' -gltCode 10 'Decision : 1*DG Context : 1*PR Per_Go: ' \
	-gltLabel 11 'DS_SE_COM' -gltCode 11 'Decision : 1*DS Context : 1*SE Per_Go: ' \
	-gltLabel 12 'DG_SE_COM' -gltCode 12 'Decision : 1*DG Context : 1*SE Per_Go: ' \
	-gltLabel 13 'DS_AL-SE_COM' -gltCode 13  'Decision : 1*DS Context : 1*AL -1*SE Per_Go: ' \
	-gltLabel 14 'DS_AL-PR_COM' -gltCode 14  'Decision : 1*DS Context : 1*AL -1*PR Per_Go: ' \
	-gltLabel 15 'DS_PR-SE_COM' -gltCode 15  'Decision : 1*DS Context : 1*PR -1*SE Per_Go: ' \
	-gltLabel 16 'DG_AL-SE_COM' -gltCode 16  'Decision : 1*DG Context : 1*AL -1*SE Per_Go: ' \
	-gltLabel 17 'DG_AL-PR_COM' -gltCode 17  'Decision : 1*DG Context : 1*AL -1*PR Per_Go: ' \
	-gltLabel 18 'DG_PR-SE_COM' -gltCode 18  'Decision : 1*DG Context : 1*PR -1*SE Per_Go: ' \
	-gltLabel 19 'DGo_AL-Social_COM' -gltCode 19  'Decision : 1*DG Context : 2*AL -1*PR +1*SE Per_Go: ' \
	-gltLabel 20 'DStop_AL-Social_COM' -gltCode 20  'Decision : 1*DS Context : 2*AL -1*PR +1*SE Per_Go: ' \
	-gltLabel 21 'D_AL-Social_COM' -gltCode 21  'Decision : 1*DS +1*DG Context : 2*AL -1*PR +1*SEL Per_Go: ' \
	-gltLabel 22 'DStop_DGo_AL-Social_COM' -gltCode 22  'Decision : 1*DS -1*DG Context : 2*AL -1*PR +1*SE Per_Go: ' \
	-gltLabel 23 'D_PRspecific_COM' -gltCode 23  'Decision : 1*DS +1*DG Context : 2*PR -1*AL +1*SE Per_Go: ' \
	-gltLabel 24 'DGo_PRspecific_COM' -gltCode 24  'Decision : 1*DG Context : 2*PR -1*AL +1*SE Per_Go: ' \
	-gltLabel 25 'DStop_PRspecific_COM' -gltCode 25  'Decision : 1*DS Context : 2*PR -1*AL +1*SE Per_Go: ' \
	-gltLabel 26 'DStop_DGo_PRspecific_COM' -gltCode 26  'Decision : 1*DS -1*DG Context : 2*PR -1*AL +1*SE Per_Go: ' \
	-gltLabel 27 'D_SEspecific_COM' -gltCode 27 'Decision : 1*DS +1*DG Context : 2*SE -1*AL +1*PR Per_Go: ' \
	-gltLabel 28 'DGo_SEspecific_COM' -gltCode 28  'Decision : 1*DG Context : 2*SE -1*AL +1*PR Per_Go: ' \
	-gltLabel 29 'DStop_SEspecific_COM' -gltCode 29  'Decision : 1*DS Context : 2*SE -1*AL +1*PR Per_Go: ' \
	-gltLabel 30 'DStop_DGo_SEspecific_COM' -gltCode 30  'Decision : 1*DS -1*DG Context : 2*SE -1*AL +1*PR Per_Go: ' \
	-mask /projects/dsnlab/shared/tds/fMRI/analysis/masks/tds2/tds2_gw_smoothed_group_average_optthr_2mm.nii \
	-dataTable 				\
	Subj Decision Context Group Per_Go InputFile \
	109	DS	AL	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0003.nii \
	109	DS	PR	COM	24.32 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0013.nii \
	109	DS	SE	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0023.nii \
	109	DG	AL	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0002.nii \
	109	DG	PR	COM	24.32 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0012.nii \
	109	DG	SE	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0022.nii \
	113	DS	AL	COM	41.03 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0003.nii \
	113	DS	PR	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0013.nii \
	113	DS	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0023.nii \
	113	DG	AL	COM	41.03 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0002.nii \
	113	DG	PR	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0012.nii \
	113	DG	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0022.nii \
	114	DS	AL	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0003.nii \
	114	DS	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0013.nii \
	114	DS	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0023.nii \
	114	DG	AL	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0002.nii \
	114	DG	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0012.nii \
	114	DG	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0022.nii \
	115	DS	AL	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0003.nii \
	115	DS	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0013.nii \
	115	DS	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0023.nii \
	115	DG	AL	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0002.nii \
	115	DG	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0012.nii \
	115	DG	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0022.nii \
	116	DS	AL	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0003.nii \
	116	DS	PR	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0013.nii \
	116	DS	SE	COM	52.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0023.nii \
	116	DG	AL	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0002.nii \
	116	DG	PR	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0012.nii \
	116	DG	SE	COM	52.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0022.nii \
	117	DS	AL	COM	54.29 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0003.nii \
	117	DS	PR	COM	55.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0013.nii \
	117	DS	SE	COM	57.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0023.nii \
	117	DG	AL	COM	54.29 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0002.nii \
	117	DG	PR	COM	55.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0012.nii \
	117	DG	SE	COM	57.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0022.nii \
	119	DS	AL	COM	64.10 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0003.nii \
	119	DS	PR	COM	76.92 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0013.nii \
	119	DS	SE	COM	64.10 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0023.nii \
	119	DG	AL	COM	64.10 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0002.nii \
	119	DG	PR	COM	76.92 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0012.nii \
	119	DG	SE	COM	64.10 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0022.nii \
	120	DS	AL	COM	63.89 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0003.nii \
	120	DS	PR	COM	44.74 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0013.nii \
	120	DS	SE	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0023.nii \
	120	DG	AL	COM	63.89 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0002.nii \
	120	DG	PR	COM	44.74 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0012.nii \
	120	DG	SE	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0022.nii \
	121	DS	AL	COM	10.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0003.nii \
	121	DS	PR	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0013.nii \
	121	DS	SE	COM	28.95 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0023.nii \
	121	DG	AL	COM	10.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0002.nii \
	121	DG	PR	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0012.nii \
	121	DG	SE	COM	28.95 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0022.nii \
	122	DS	AL	COM	13.51 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0003.nii \
	122	DS	PR	COM	15.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0013.nii \
	122	DS	SE	COM	20.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0023.nii \
	122	DG	AL	COM	13.51 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0002.nii \
	122	DG	PR	COM	15.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0012.nii \
	122	DG	SE	COM	20.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0022.nii \
	124	DS	AL	COM	34.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0003.nii \
	124	DS	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0013.nii \
	124	DS	SE	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0023.nii \
	124	DG	AL	COM	34.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0002.nii \
	124	DG	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0012.nii \
	124	DG	SE	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0022.nii \
	125	DS	AL	COM	13.16 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0003.nii \
	125	DS	PR	COM	28.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0013.nii \
	125	DS	SE	COM	23.68 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0023.nii \
	125	DG	AL	COM	13.16 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0002.nii \
	125	DG	PR	COM	28.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0012.nii \
	125	DG	SE	COM	23.68 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0022.nii \
	126	DS	AL	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0003.nii \
	126	DS	PR	COM	36.84 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0013.nii \
	126	DS	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0023.nii \
	126	DG	AL	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0002.nii \
	126	DG	PR	COM	36.84 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0012.nii \
	126	DG	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0022.nii \
	128	DS	AL	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0003.nii \
	128	DS	PR	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0013.nii \
	128	DS	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0023.nii \
	128	DG	AL	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0002.nii \
	128	DG	PR	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0012.nii \
	128	DG	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0022.nii \
	129	DS	AL	COM	61.11 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0003.nii \
	129	DS	PR	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0013.nii \
	129	DS	SE	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0023.nii \
	129	DG	AL	COM	61.11 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0002.nii \
	129	DG	PR	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0012.nii \
	129	DG	SE	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0022.nii \
	130	DS	AL	COM	21.05 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0003.nii \
	130	DS	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0013.nii \
	130	DS	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0023.nii \
	130	DG	AL	COM	21.05 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0002.nii \
	130	DG	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0012.nii \
	130	DG	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0022.nii \
	131	DS	AL	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0003.nii \
	131	DS	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0013.nii \
	131	DS	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0023.nii \
	131	DG	AL	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0002.nii \
	131	DG	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0012.nii \
	131	DG	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0022.nii \
	132	DS	AL	COM	28.95 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0003.nii \
	132	DS	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0013.nii \
	132	DS	SE	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0023.nii \
	132	DG	AL	COM	28.95 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0002.nii \
	132	DG	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0012.nii \
	132	DG	SE	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0022.nii \
	133	DS	AL	COM	55.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0003.nii \
	133	DS	PR	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0013.nii \
	133	DS	SE	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0023.nii \
	133	DG	AL	COM	55.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0002.nii \
	133	DG	PR	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0012.nii \
	133	DG	SE	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0022.nii \
	134	DS	AL	COM	23.68 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0003.nii \
	134	DS	PR	COM	54.29 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0013.nii \
	134	DS	SE	COM	56.76 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0023.nii \
	134	DG	AL	COM	23.68 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0002.nii \
	134	DG	PR	COM	54.29 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0012.nii \
	134	DG	SE	COM	56.76 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0022.nii \
	136	DS	AL	COM	42.11 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0003.nii \
	136	DS	PR	COM	51.28 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0013.nii \
	136	DS	SE	COM	43.59 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0023.nii \
	136	DG	AL	COM	42.11 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0002.nii \
	136	DG	PR	COM	51.28 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0012.nii \
	136	DG	SE	COM	43.59 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0022.nii \
	140	DS	AL	COM	10.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0003.nii \
	140	DS	PR	COM	12.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0013.nii \
	140	DS	SE	COM	65.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0023.nii \
	140	DG	AL	COM	10.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0002.nii \
	140	DG	PR	COM	12.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0012.nii \
	140	DG	SE	COM	65.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0022.nii \
	141	DS	AL	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0003.nii \
	141	DS	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0013.nii \
	141	DS	SE	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0023.nii \
	141	DG	AL	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0002.nii \
	141	DG	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0012.nii \
	141	DG	SE	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0022.nii \
	142	DS	AL	COM	69.23 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0003.nii \
	142	DS	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0013.nii \
	142	DS	SE	COM	70.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0023.nii \
	142	DG	AL	COM	69.23 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0002.nii \
	142	DG	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0012.nii \
	142	DG	SE	COM	70.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0022.nii \
	144	DS	AL	COM	48.72 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0003.nii \
	144	DS	PR	COM	36.84 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0013.nii \
	144	DS	SE	COM	47.37 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0023.nii \
	144	DG	AL	COM	48.72 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0002.nii \
	144	DG	PR	COM	36.84 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0012.nii \
	144	DG	SE	COM	47.37 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0022.nii \
	145	DS	AL	COM	52.78 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0003.nii \
	145	DS	PR	COM	78.38 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0013.nii \
	145	DS	SE	COM	77.78 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0023.nii \
	145	DG	AL	COM	52.78 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0002.nii \
	145	DG	PR	COM	78.38 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0012.nii \
	145	DG	SE	COM	77.78 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0022.nii \
	146	DS	AL	COM	27.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0003.nii \
	146	DS	PR	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0013.nii \
	146	DS	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0023.nii \
	146	DG	AL	COM	27.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0002.nii \
	146	DG	PR	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0012.nii \
	146	DG	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0022.nii \
	150	DS	AL	COM	26.32 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0003.nii \
	150	DS	PR	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0013.nii \
	150	DS	SE	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0023.nii \
	150	DG	AL	COM	26.32 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0002.nii \
	150	DG	PR	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0012.nii \
	150	DG	SE	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0022.nii \
	151	DS	AL	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0003.nii \
	151	DS	PR	COM	30.77 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0013.nii \
	151	DS	SE	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0023.nii \
	151	DG	AL	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0002.nii \
	151	DG	PR	COM	30.77 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0012.nii \
	151	DG	SE	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0022.nii \
	152	DS	AL	COM	60.53 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0003.nii \
	152	DS	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0013.nii \
	152	DS	SE	COM	56.41 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0023.nii \
	152	DG	AL	COM	60.53 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0002.nii \
	152	DG	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0012.nii \
	152	DG	SE	COM	56.41 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0022.nii \
	155	DS	AL	COM	15.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0003.nii \
	155	DS	PR	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0013.nii \
	155	DS	SE	COM	20.51 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0023.nii \
	155	DG	AL	COM	15.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0002.nii \
	155	DG	PR	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0012.nii \
	155	DG	SE	COM	20.51 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0022.nii \
	156	DS	AL	COM	45.71 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0003.nii \
	156	DS	PR	COM	27.03 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0013.nii \
	156	DS	SE	COM	15.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0023.nii \
	156	DG	AL	COM	45.71 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0002.nii \
	156	DG	PR	COM	27.03 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0012.nii \
	156	DG	SE	COM	15.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0022.nii \
	157	DS	AL	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0003.nii \
	157	DS	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0013.nii \
	157	DS	SE	COM	75.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0023.nii \
	157	DG	AL	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0002.nii \
	157	DG	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0012.nii \
	157	DG	SE	COM	75.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0022.nii \
	159	DS	AL	COM	69.44 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0003.nii \
	159	DS	PR	COM	77.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0013.nii \
	159	DS	SE	COM	81.58 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0023.nii \
	159	DG	AL	COM	69.44 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0002.nii \
	159	DG	PR	COM	77.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0012.nii \
	159	DG	SE	COM	81.58 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0022.nii \
	160	DS	AL	COM	65.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0003.nii \
	160	DS	PR	COM	56.76 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0013.nii \
	160	DS	SE	COM	75.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0023.nii \
	160	DG	AL	COM	65.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0002.nii \
	160	DG	PR	COM	56.76 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0012.nii \
	160	DG	SE	COM	75.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0022.nii \
	161	DS	AL	COM	55.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0003.nii \
	161	DS	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0013.nii \
	161	DS	SE	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0023.nii \
	161	DG	AL	COM	55.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0002.nii \
	161	DG	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0012.nii \
	161	DG	SE	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0022.nii \
	162	DS	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0003.nii \
	162	DS	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0013.nii \
	162	DS	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0023.nii \
	162	DG	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0002.nii \
	162	DG	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0012.nii \
	162	DG	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0022.nii \
	163	DS	AL	COM	22.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0003.nii \
	163	DS	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0013.nii \
	163	DS	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0023.nii \
	163	DG	AL	COM	22.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0002.nii \
	163	DG	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0012.nii \
	163	DG	SE	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0022.nii \
	164	DS	AL	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0003.nii \
	164	DS	PR	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0013.nii \
	164	DS	SE	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0023.nii \
	164	DG	AL	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0002.nii \
	164	DG	PR	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0012.nii \
	164	DG	SE	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0022.nii \
	165	DS	AL	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0003.nii \
	165	DS	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0013.nii \
	165	DS	SE	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0023.nii \
	165	DG	AL	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0002.nii \
	165	DG	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0012.nii \
	165	DG	SE	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0022.nii \
	167	DS	AL	COM	22.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0003.nii \
	167	DS	PR	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0013.nii \
	167	DS	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0023.nii \
	167	DG	AL	COM	22.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0002.nii \
	167	DG	PR	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0012.nii \
	167	DG	SE	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0022.nii \
	168	DS	AL	COM	10.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0003.nii \
	168	DS	PR	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0013.nii \
	168	DS	SE	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0023.nii \
	168	DG	AL	COM	10.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0002.nii \
	168	DG	PR	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0012.nii \
	168	DG	SE	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0022.nii \
	169	DS	AL	COM	80.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0003.nii \
	169	DS	PR	COM	68.42 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0013.nii \
	169	DS	SE	COM	53.13 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0023.nii \
	169	DG	AL	COM	80.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0002.nii \
	169	DG	PR	COM	68.42 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0012.nii \
	169	DG	SE	COM	53.13 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0022.nii \
	170	DS	AL	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0003.nii \
	170	DS	PR	COM	37.84 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0013.nii \
	170	DS	SE	COM	27.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0023.nii \
	170	DG	AL	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0002.nii \
	170	DG	PR	COM	37.84 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0012.nii \
	170	DG	SE	COM	27.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0022.nii \
	171	DS	AL	COM	55.56 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0003.nii \
	171	DS	PR	COM	66.67 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0013.nii \
	171	DS	SE	COM	65.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0023.nii \
	171	DG	AL	COM	55.56 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0002.nii \
	171	DG	PR	COM	66.67 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0012.nii \
	171	DG	SE	COM	65.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0022.nii \
	172	DS	AL	COM	30.77 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0003.nii \
	172	DS	PR	COM	34.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0013.nii \
	172	DS	SE	COM	52.63 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0023.nii \
	172	DG	AL	COM	30.77 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0002.nii \
	172	DG	PR	COM	34.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0012.nii \
	172	DG	SE	COM	52.63 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0022.nii \
	173	DS	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0003.nii \
	173	DS	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0013.nii \
	173	DS	SE	COM	65.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0023.nii \
	173	DG	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0002.nii \
	173	DG	PR	COM	40.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0012.nii \
	173	DG	SE	COM	65.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0022.nii \
	174	DS	AL	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0003.nii \
	174	DS	PR	COM	62.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0013.nii \
	174	DS	SE	COM	57.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0023.nii \
	174	DG	AL	COM	50.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0002.nii \
	174	DG	PR	COM	62.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0012.nii \
	174	DG	SE	COM	57.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0022.nii \
	175	DS	AL	COM	30.56 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0003.nii \
	175	DS	PR	COM	52.94 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0013.nii \
	175	DS	SE	COM	52.78 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0023.nii \
	175	DG	AL	COM	30.56 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0002.nii \
	175	DG	PR	COM	52.94 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0012.nii \
	175	DG	SE	COM	52.78 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0022.nii \
	177	DS	AL	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0003.nii \
	177	DS	PR	COM	34.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0013.nii \
	177	DS	SE	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0023.nii \
	177	DG	AL	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0002.nii \
	177	DG	PR	COM	34.21 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0012.nii \
	177	DG	SE	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0022.nii \
	178	DS	AL	COM	54.05 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0003.nii \
	178	DS	PR	COM	75.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0013.nii \
	178	DS	SE	COM	51.43 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0023.nii \
	178	DG	AL	COM	54.05 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0002.nii \
	178	DG	PR	COM	75.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0012.nii \
	178	DG	SE	COM	51.43 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0022.nii \
	179	DS	AL	COM	47.22 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0003.nii \
	179	DS	PR	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0013.nii \
	179	DS	SE	COM	52.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0023.nii \
	179	DG	AL	COM	47.22 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0002.nii \
	179	DG	PR	COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0012.nii \
	179	DG	SE	COM	52.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0022.nii \
	181	DS	AL	COM	45.95 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0003.nii \
	181	DS	PR	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0013.nii \
	181	DS	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0023.nii \
	181	DG	AL	COM	45.95 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0002.nii \
	181	DG	PR	COM	45.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0012.nii \
	181	DG	SE	COM	42.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0022.nii \
	182	DS	AL	COM	13.16 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0003.nii \
	182	DS	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0013.nii \
	182	DS	SE	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0023.nii \
	182	DG	AL	COM	13.16 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0002.nii \
	182	DG	PR	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0012.nii \
	182	DG	SE	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0022.nii \
	183	DS	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0003.nii \
	183	DS	PR	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0013.nii \
	183	DS	SE	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0023.nii \
	183	DG	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0002.nii \
	183	DG	PR	COM	46.15 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0012.nii \
	183	DG	SE	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0022.nii \
	184	DS	AL	COM	43.59 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0003.nii \
	184	DS	PR	COM	51.28 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0013.nii \
	184	DS	SE	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0023.nii \
	184	DG	AL	COM	43.59 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0002.nii \
	184	DG	PR	COM	51.28 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0012.nii \
	184	DG	SE	COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0022.nii \
	185	DS	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0003.nii \
	185	DS	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0013.nii \
	185	DS	SE	COM	56.41 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0023.nii \
	185	DG	AL	COM	37.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0002.nii \
	185	DG	PR	COM	47.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0012.nii \
	185	DG	SE	COM	56.41 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0022.nii \
	186	DS	AL	COM	56.41 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0003.nii \
	186	DS	PR	COM	51.28 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0013.nii \
	186	DS	SE	COM	55.26 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0023.nii \
	186	DG	AL	COM	56.41 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0002.nii \
	186	DG	PR	COM	51.28 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0012.nii \
	186	DG	SE	COM	55.26 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0022.nii \
	187	DS	AL	COM	48.72 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0003.nii \
	187	DS	PR	COM	51.35 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0013.nii \
	187	DS	SE	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0023.nii \
	187	DG	AL	COM	48.72 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0002.nii \
	187	DG	PR	COM	51.35 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0012.nii \
	187	DG	SE	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0022.nii \
	188	DS	AL	COM	10.53 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0003.nii \
	188	DS	PR	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0013.nii \
	188	DS	SE	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0023.nii \
	188	DG	AL	COM	10.53 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0002.nii \
	188	DG	PR	COM	32.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0012.nii \
	188	DG	SE	COM	30.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0022.nii \
	190	DS	AL	COM	21.62 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0003.nii \
	190	DS	PR	COM	33.33 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0013.nii \
	190	DS	SE	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0023.nii \
	190	DG	AL	COM	21.62 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0002.nii \
	190	DG	PR	COM	33.33 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0012.nii \
	190	DG	SE	COM	60.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0022.nii \
	192	DS	AL	COM	20.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0003.nii \
	192	DS	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0013.nii \
	192	DS	SE	COM	82.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0023.nii \
	192	DG	AL	COM	20.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0002.nii \
	192	DG	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0012.nii \
	192	DG	SE	COM	82.50 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0022.nii \
	193	DS	AL COM	33.33 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0003.nii \
	193	DS	PR COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0013.nii \
	193	DS	SE COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0023.nii \
	193	DG	AL COM	33.33 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0002.nii \
	193	DG	PR COM	39.47 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0012.nii \
	193	DG	SE COM	38.46 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0022.nii \
	194	DS	AL	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0003.nii \
	194	DS	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0013.nii \
	194	DS	SE	COM	41.03 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0023.nii \
	194	DG	AL	COM	35.90 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0002.nii \
	194	DG	PR	COM	35.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0012.nii \
	194	DG	SE	COM	41.03 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0022.nii \
	195	DS	AL	COM	30.77 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0003.nii \
	195	DS	PR	COM	18.42 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0013.nii \
	195	DS	SE	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0023.nii \
	195	DG	AL	COM	30.77 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0002.nii \
	195	DG	PR	COM	18.42 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0012.nii \
	195	DG	SE	COM	25.00 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0022.nii \
	196	DS	AL	COM	61.54 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0003.nii \
	196	DS	PR	COM	64.10 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0013.nii \
	196	DS	SE	COM	79.49 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0023.nii \
	196	DG	AL	COM	61.54 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0002.nii \
	196	DG	PR	COM	64.10 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0012.nii \
	196	DG	SE	COM	79.49 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0022.nii \
	197	DS	AL	COM	36.36 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0003.nii \
	197	DS	PR	COM	61.11 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0013.nii \
	197	DS	SE	COM	65.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0023.nii \
	197	DG	AL	COM	36.36 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0002.nii \
	197	DG	PR	COM	61.11 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0012.nii \
	197	DG	SE	COM	65.79 /projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0022.nii \
