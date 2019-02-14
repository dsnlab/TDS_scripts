#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=TGood_allconGood_nopmoGood_3dmvm
#SBATCH --output=output/allcons_nppmoGood_3dmvm.log
#SBATCH --error=output/allcons_3dmvm_nopmoGood_error.log
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=short,fat

module load prl afni/17.3.00
export LD_PRELOAD=/packages/gcc/7.2/lib64/libstdc++.so

cd /projects/dsnlab/shared/tds/fMRI/analysis/rx/ylg/all/tds1/Outcomes/
	3dMVM -prefix OutcomesXContext_nopmod_higherlever_TDS1 \
	-jobs 28 \
	-wsVars  "Outcome*Context" \
	-SS_type 3 \
	-num_glt 20 \
	-gltLabel 1 'Out_AL-SE_EA' -gltCode 1  'Outcome : 1*Good +1*Bad Context : 1*AL -1*SE' \
	-gltLabel 2 'Out_AL-PR_EA' -gltCode 2  'Outcome : 1*Good +1*Bad Context : 1*AL -1*PR' \
	-gltLabel 3 'Out_PR-SE_EA' -gltCode 3  'Outcome : 1*Good +1*Bad Context : 1*PR -1*SE' \
	-gltLabel 4 'G_B_AL-SE_EA' -gltCode 4  'Outcome : 1*Good -1*Bad Context : 1*AL -1*SE' \
	-gltLabel 5 'G_B_AL-PR_EA' -gltCode 5  'Outcome : 1*Good -1*Bad Context : 1*AL -1*PR' \
	-gltLabel 6 'G_B_PR-SE_EA' -gltCode 6  'Outcome : 1*Good -1*Bad Context : 1*PR -1*SE' \
	-gltLabel 7 'Good_AL_EA' -gltCode 7 'Outcome : 1*Good Context : 1*AL' \
	-gltLabel 8 'Bad_AL_EA' -gltCode 8 'Outcome : 1*Bad Context : 1*AL' \
	-gltLabel 9 'Good_PR_EA' -gltCode 9 'Outcome : 1*Good Context : 1*PR' \
	-gltLabel 10 'Bad_PR_EA' -gltCode 10 'Outcome : 1*Bad Context : 1*PR ' \
	-gltLabel 11 'Good_SE_EA' -gltCode 11 'Outcome : 1*Good Context : 1*SE' \
	-gltLabel 12 'Bad_SE_EA' -gltCode 12 'Outcome : 1*Bad Context : 1*SE' \
	-gltLabel 13 'Good_AL-SE_EA' -gltCode 13  'Outcome : 1*Good Context : 1*AL -1*SE' \
	-gltLabel 14 'Good_AL-PR_EA' -gltCode 14  'Outcome : 1*Good Context : 1*AL -1*PR' \
	-gltLabel 15 'Good_PR-SE_EA' -gltCode 15  'Outcome : 1*Good Context : 1*PR -1*SE' \
	-gltLabel 16 'Bad_AL-SE_EA' -gltCode 16  'Outcome : 1*Bad Context : 1*AL -1*SE' \
	-gltLabel 17 'Bad_AL-PR_EA' -gltCode 17  'Outcome : 1*Bad Context : 1*AL -1*PR' \
	-gltLabel 18 'Bad_PR-SE_EA' -gltCode 18  'Outcome : 1*Bad Context : 1*PR -1*SE' \
	-gltLabel 19 'Bad_social_vs_alone_EA' -gltCode 19  'Outcome : 1*Bad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 20 'Good_social_vs_alone_EA' -gltCode 20  'Outcome : 1*Good Context : 1*PR +1*SE -2*AL' \
	-mask /projects/dsnlab/shared/tds/fMRI/analysis/masks/tds1_tds2/tds1_tds2_gw_smoothed_group_average_optthr_2mm.nii \
	-dataTable 				\
	Subj Outcome Context Group InputFile \
	302	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0005.nii \
	302	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0015.nii \
	302	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0025.nii \
	302	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0008.nii \
	302	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0018.nii \
	302	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0028.nii \
	303	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0005.nii \
	303	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0015.nii \
	303	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0025.nii \
	303	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0008.nii \
	303	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0018.nii \
	303	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0028.nii \
	306	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0005.nii \
	306	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0015.nii \
	306	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0025.nii \
	306	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0008.nii \
	306	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0018.nii \
	306	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0028.nii \
	307	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0005.nii \
	307	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0015.nii \
	307	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0025.nii \
	307	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0008.nii \
	307	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0018.nii \
	307	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0028.nii \
	308	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0005.nii \
	308	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0015.nii \
	308	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0025.nii \
	308	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0008.nii \
	308	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0018.nii \
	308	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0028.nii \
	309	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0005.nii \
	309	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0015.nii \
	309	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0025.nii \
	309	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0008.nii \
	309	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0018.nii \
	309	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0028.nii \
	310	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0005.nii \
	310	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0015.nii \
	310	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0025.nii \
	310	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0008.nii \
	310	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0018.nii \
	310	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0028.nii \
	312	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0005.nii \
	312	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0015.nii \
	312	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0025.nii \
	312	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0008.nii \
	312	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0018.nii \
	312	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0028.nii \
	313	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0005.nii \
	313	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0015.nii \
	313	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0025.nii \
	313	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0008.nii \
	313	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0018.nii \
	313	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0028.nii \
	314	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0005.nii \
	314	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0015.nii \
	314	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0025.nii \
	314	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0008.nii \
	314	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0018.nii \
	314	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0028.nii \
	316	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0005.nii \
	316	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0015.nii \
	316	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0025.nii \
	316	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0008.nii \
	316	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0018.nii \
	316	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0028.nii \
	317	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0005.nii \
	317	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0015.nii \
	317	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0025.nii \
	317	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0008.nii \
	317	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0018.nii \
	317	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0028.nii \
	320	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0005.nii \
	320	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0015.nii \
	320	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0025.nii \
	320	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0008.nii \
	320	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0018.nii \
	320	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0028.nii \
	321	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0005.nii \
	321	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0015.nii \
	321	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0025.nii \
	321	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0008.nii \
	321	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0018.nii \
	321	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0028.nii \
	322	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0005.nii \
	322	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0015.nii \
	322	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0025.nii \
	322	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0008.nii \
	322	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0018.nii \
	322	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0028.nii \
	323	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0005.nii \
	323	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0015.nii \
	323	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0025.nii \
	323	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0008.nii \
	323	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0018.nii \
	323	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0028.nii \
	324	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0005.nii \
	324	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0015.nii \
	324	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0025.nii \
	324	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0008.nii \
	324	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0018.nii \
	324	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0028.nii \
	325	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0005.nii \
	325	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0015.nii \
	325	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0025.nii \
	325	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0008.nii \
	325	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0018.nii \
	325	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0028.nii \
	326	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0005.nii \
	326	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0015.nii \
	326	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0025.nii \
	326	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0008.nii \
	326	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0018.nii \
	326	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0028.nii \
	327	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0005.nii \
	327	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0015.nii \
	327	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0025.nii \
	327	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0008.nii \
	327	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0018.nii \
	327	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0028.nii \
	328	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0005.nii \
	328	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0015.nii \
	328	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0025.nii \
	328	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0008.nii \
	328	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0018.nii \
	328	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0028.nii \
	329	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0005.nii \
	329	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0015.nii \
	329	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0025.nii \
	329	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0008.nii \
	329	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0018.nii \
	329	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0028.nii \
	330	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0005.nii \
	330	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0015.nii \
	330	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0025.nii \
	330	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0008.nii \
	330	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0018.nii \
	330	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0028.nii \
	331	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0005.nii \
	331	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0015.nii \
	331	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0025.nii \
	331	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0008.nii \
	331	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0018.nii \
	331	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0028.nii \
	332	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0005.nii \
	332	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0015.nii \
	332	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0025.nii \
	332	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0008.nii \
	332	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0018.nii \
	332	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0028.nii \
	333	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0005.nii \
	333	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0015.nii \
	333	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0025.nii \
	333	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0008.nii \
	333	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0018.nii \
	333	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0028.nii \
	335	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0005.nii \
	335	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0015.nii \
	335	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0025.nii \
	335	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0008.nii \
	335	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0018.nii \
	335	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0028.nii \
	336	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0005.nii \
	336	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0015.nii \
	336	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0025.nii \
	336	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0008.nii \
	336	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0018.nii \
	336	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0028.nii \
	337	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0005.nii \
	337	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0015.nii \
	337	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0025.nii \
	337	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0008.nii \
	337	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0018.nii \
	337	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0028.nii \
	340	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0005.nii \
	340	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0015.nii \
	340	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0025.nii \
	340	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0008.nii \
	340	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0018.nii \
	340	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0028.nii \
	341	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0005.nii \
	341	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0015.nii \
	341	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0025.nii \
	341	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0008.nii \
	341	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0018.nii \
	341	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0028.nii \
	342	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0005.nii \
	342	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0015.nii \
	342	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0025.nii \
	342	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0008.nii \
	342	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0018.nii \
	342	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0028.nii \
	343	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0005.nii \
	343	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0015.nii \
	343	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0025.nii \
	343	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0008.nii \
	343	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0018.nii \
	343	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0028.nii \
	344	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0005.nii \
	344	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0015.nii \
	344	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0025.nii \
	344	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0008.nii \
	344	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0018.nii \
	344	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0028.nii \
	346	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0005.nii \
	346	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0015.nii \
	346	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0025.nii \
	346	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0008.nii \
	346	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0018.nii \
	346	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0028.nii \
	347	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0005.nii \
	347	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0015.nii \
	347	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0025.nii \
	347	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0008.nii \
	347	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0018.nii \
	347	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0028.nii \
	348	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0005.nii \
	348	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0015.nii \
	348	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0025.nii \
	348	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0008.nii \
	348	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0018.nii \
	348	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0028.nii \
	349	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0005.nii \
	349	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0015.nii \
	349	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0025.nii \
	349	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0008.nii \
	349	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0018.nii \
	349	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0028.nii \
	351	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0005.nii \
	351	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0015.nii \
	351	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0025.nii \
	351	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0008.nii \
	351	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0018.nii \
	351	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0028.nii \
	352	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0005.nii \
	352	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0015.nii \
	352	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0025.nii \
	352	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0008.nii \
	352	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0018.nii \
	352	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0028.nii \
	353	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0005.nii \
	353	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0015.nii \
	353	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0025.nii \
	353	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0008.nii \
	353	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0018.nii \
	353	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0028.nii \
	354	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0005.nii \
	354	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0015.nii \
	354	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0025.nii \
	354	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0008.nii \
	354	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0018.nii \
	354	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0028.nii \
	355	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0005.nii \
	355	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0015.nii \
	355	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0025.nii \
	355	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0008.nii \
	355	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0018.nii \
	355	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0028.nii \
	357	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0005.nii \
	357	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0015.nii \
	357	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0025.nii \
	357	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0008.nii \
	357	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0018.nii \
	357	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0028.nii \
	359	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0005.nii \
	359	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0015.nii \
	359	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0025.nii \
	359	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0008.nii \
	359	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0018.nii \
	359	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0028.nii \
	360	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0005.nii \
	360	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0015.nii \
	360	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0025.nii \
	360	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0008.nii \
	360	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0018.nii \
	360	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0028.nii \
	361	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0005.nii \
	361	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0015.nii \
	361	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0025.nii \
	361	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0008.nii \
	361	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0018.nii \
	361	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0028.nii \
	363	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0005.nii \
	363	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0015.nii \
	363	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0025.nii \
	363	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0008.nii \
	363	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0018.nii \
	363	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0028.nii \
	365	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0005.nii \
	365	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0015.nii \
	365	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0025.nii \
	365	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0008.nii \
	365	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0018.nii \
	365	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0028.nii \
	367	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0005.nii \
	367	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0015.nii \
	367	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0025.nii \
	367	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0008.nii \
	367	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0018.nii \
	367	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0028.nii \
	368	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0005.nii \
	368	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0015.nii \
	368	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0025.nii \
	368	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0008.nii \
	368	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0018.nii \
	368	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0028.nii \
	369	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0005.nii \
	369	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0015.nii \
	369	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0025.nii \
	369	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0008.nii \
	369	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0018.nii \
	369	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0028.nii \
	371	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0005.nii \
	371	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0015.nii \
	371	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0025.nii \
	371	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0008.nii \
	371	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0018.nii \
	371	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0028.nii \
	372	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0005.nii \
	372	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0015.nii \
	372	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0025.nii \
	372	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0008.nii \
	372	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0018.nii \
	372	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0028.nii \
	373	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0005.nii \
	373	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0015.nii \
	373	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0025.nii \
	373	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0008.nii \
	373	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0018.nii \
	373	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0028.nii \
	374	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0005.nii \
	374	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0015.nii \
	374	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0025.nii \
	374	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0008.nii \
	374	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0018.nii \
	374	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0028.nii \
	375	Good	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0005.nii \
	375	Good	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0015.nii \
	375	Good	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0025.nii \
	375	Bad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0008.nii \
	375	Bad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0018.nii \
	375	Bad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0028.nii \
