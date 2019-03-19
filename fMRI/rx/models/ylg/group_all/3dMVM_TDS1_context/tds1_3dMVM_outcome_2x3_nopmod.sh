#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=TDS1_outcome_3dmvm
#SBATCH --output=output/tds1_outcome_3dmvm.log
#SBATCH --error=output/tds1_outcome_3dmvm_error.log
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=short,fat

module load prl afni/17.3.00
export LD_PRELOAD=/packages/gcc/7.2/lib64/libstdc++.so

cd /projects/dsnlab/shared/tds/fMRI/analysis/rx/ylg/all/tds1/Outcomes/
	3dMVM -prefix OutcomesXContextTDS1_nopmod \
	-jobs 28 \
	-wsVars  "Outcome*Context" \
	-SS_type 3 \
	-num_glt 76 \
	-gltLabel 1 'Out_AL-SE_E' -gltCode 1  'Context : 1*AL -1*SE' \
	-gltLabel 2 'Out_AL-PR_E' -gltCode 2  'Context : 1*AL -1*PR' \
	-gltLabel 3 'Out_PR-SE_E' -gltCode 3  'Context : 1*PR -1*SE' \
	-gltLabel 4 'Out_soc_vs_al_E' -gltCode 4  'Context : 1*PR +1*SE -2*AL' \
	-gltLabel 5 'Out_all_vs_ex_E' -gltCode 5  'Context : 1*PR +1*AL -2*SE' \
	-gltLabel 6 'Out_all_vs_pr_E' -gltCode 6  'Context : 1*SE +1*AL -2*PR' \
	-gltLabel 7 'GoOutcome_AL-SE_E' -gltCode 7  'Outcome : 1*GoGood +1*GoBad Context : 1*AL -1*SE' \
	-gltLabel 8 'GoOutcome_AL-PR_E' -gltCode 8  'Outcome : 1*GoGood +1*GoBad Context : 1*AL -1*PR' \
	-gltLabel 9 'GoOutcome_PR-SE_E' -gltCode 9  'Outcome : 1*GoGood +1*GoBad Context : 1*PR -1*SE' \
	-gltLabel 10 'GoOutcome_E' -gltCode 10  'Outcome : 1*GoGood +1*GoBad' \
	-gltLabel 11 'GoOutcome_social_vs_alone_E' -gltCode 11  'Outcome : 1*GoGood +1*GoBad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 12 'GoOutcome_all_vs_exclux_E' -gltCode 12  'Outcome : 1*GoGood +1*GoBad Context : 1*PR +1*AL -2*SE' \
	-gltLabel 13 'GoOutcome_all_vs_peer_E' -gltCode 13  'Outcome : 1*GoGood +1*GoBad Context : 1*SE +1*AL -2*PR' \
	-gltLabel 14 'StopO_AL-SE_E' -gltCode 14  'Outcome : 1*StopGood +1*StopBad Context : 1*AL -1*SE' \
	-gltLabel 15 'StopO_AL-PR_E' -gltCode 15 'Outcome : 1*StopGood +1*StopBad Context : 1*AL -1*PR' \
	-gltLabel 16 'StopO_PR-SE_E' -gltCode 16 'Outcome : 1*StopGood +1*StopBad Context : 1*PR -1*SE' \
	-gltLabel 17 'StopOutcome_E' -gltCode 17 'Outcome : 1*StopGood +1*StopBad' \
	-gltLabel 18 'StopOutcome_social_vs_alone_E' -gltCode 18  'Outcome : 1*StopGood +1*StopBad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 19 'StopOutcome_all_vs_exclux_E' -gltCode 19  'Outcome : 1*StopGood +1*StopBad Context : 1*PR +1*AL -2*SE' \
	-gltLabel 20 'StopOutcome_all_vs_peer_E' -gltCode 20  'Outcome : 1*StopGood +1*StopBad Context : 1*SE +1*AL -2*PR' \
	-gltLabel 21 'GoOutcome_StopOutcome_AL-SE_E' -gltCode 21  'Outcome :  1*GoGood & 1*GoBad -1*StopGood & 1*StopBad  Context : 1*AL -1*SE' \
	-gltLabel 22 'GoOutcome_StopOutcome_AL-PR_E' -gltCode 22  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*AL -1*PR' \
	-gltLabel 23 'GoOutcome_StopOutcome_PR-SE_E' -gltCode 23  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*PR -1*SE' \
	-gltLabel 24 'GoOutcome_StopOutcome_E' -gltCode 24  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad' \
	-gltLabel 25 'GoOutcome_StopOutcome_social_vs_alone_E' -gltCode 25  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 26 'GoOutcome_StopOutcome_all_vs_exclux_E' -gltCode 26  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*PR +1*AL -2*SE' \
	-gltLabel 27 'GoOutcome_StopOutcome_all_vs_peer_E' -gltCode 27  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*SE +1*AL -2*PR' \
	-gltLabel 28 'Good_AL-SE_E' -gltCode 28  'Outcome : 1*GoGood +1*StopGood Context : 1*AL -1*SE' \
	-gltLabel 29 'Good_AL-PR_E' -gltCode 29  'Outcome : 1*GoGood +1*StopGood Context : 1*AL -1*PR' \
	-gltLabel 30 'Good_PR-SE_E' -gltCode 30  'Outcome : 1*GoGood +1*StopGood Context : 1*PR -1*SE' \
	-gltLabel 31 'GoodOutcome_E' -gltCode 31  'Outcome : 1*GoGood +1*StopGood' \
	-gltLabel 32 'GoodOutcome_social_vs_alone_E' -gltCode 32  'Outcome : 1*GoGood +1*StopGood Context : 1*PR +1*SE -2*AL' \
	-gltLabel 33 'GoodOutcome_all_vs_exclux_E' -gltCode 33  'Outcome : 1*GoGood +1*StopGood Context : 1*PR +1*AL -2*SE' \
	-gltLabel 34 'GoodOutcome_all_vs_peer_E' -gltCode 34  'Outcome : 1*GoGood +1*StopGood Context : 1*SE +1*AL -2*PR' \
	-gltLabel 35 'Bad_AL-SE_E' -gltCode 35  'Outcome : 1*GoBad +1*StopBad Context : 1*AL -1*SE' \
	-gltLabel 36 'Bad_AL-PR_E' -gltCode 36  'Outcome : 1*GoBad +1*StopBad Context : 1*AL -1*PR' \
	-gltLabel 37 'Bad_PR-SE_E' -gltCode 37  'Outcome : 1*GoBad +1*StopBad Context : 1*PR -1*SE' \
	-gltLabel 38 'BadOutcome_E' -gltCode 38  'Outcome : 1*GoBad +1*StopBad' \
	-gltLabel 39 'BadOutcome_social_vs_alone_E' -gltCode 39  'Outcome : 1*GoBad +1*StopBad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 40 'BadOutcome_all_vs_exclux_E' -gltCode 40  'Outcome : 1*GoBad +1*StopBad Context : 1*PR +1*AL -2*SE' \
	-gltLabel 41 'BadOutcome_all_vs_peer_E' -gltCode 41  'Outcome : 1*GoBad +1*StopBad Context : 1*SE +1*AL -2*PR' \
	-gltLabel 42 'Good_Bad_AL-SE_E' -gltCode 42  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*AL -1*SE' \
	-gltLabel 43 'Good_Bad_AL-PR_E' -gltCode 43  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*AL -1*PR' \
	-gltLabel 44 'Good_Bad_PR-SE_E' -gltCode 44  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*PR -1*SE' \
	-gltLabel 45 'Good_Bad_E' -gltCode 45  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad' \
	-gltLabel 46 'Good_Bad_social_vs_alone_E' -gltCode 46  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 47 'Good_Bad_all_vs_exclux_E' -gltCode 47  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*PR +1*AL -2*SE' \
	-gltLabel 48 'Good_Bad_all_vs_peer_E' -gltCode 48  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*SE +1*AL -2*PR' \
	-gltLabel 49 'GoodGoOutcome_E' -gltCode 49  'Outcome : 1*GoGood' \
	-gltLabel 50 'GoodGoOutcome_AL-SE_E' -gltCode 50  'Outcome : 1*GoGood  Context : 1*AL -1*SE' \
	-gltLabel 51 'GoodGoOutcome_AL-PR_E' -gltCode 51  'Outcome : 1*GoGood Context : 1*AL -1*PR' \
	-gltLabel 52 'GoodGoOutcome_PR-SE_E' -gltCode 52  'Outcome : 1*GoGood Context : 1*PR -1*SE' \
	-gltLabel 53 'GoodGoOutcome_social_vs_alone_E' -gltCode 53  'Outcome : 1*GoGood Context : 1*PR +1*SE -2*AL' \
	-gltLabel 54 'GoodGoOutcome_all_vs_exclux_E' -gltCode 54  'Outcome : 1*GoGood Context : 1*PR +1*AL -2*SE' \
	-gltLabel 55 'GoodGoOutcome_all_vs_peer_E' -gltCode 55  'Outcome : 1*GoGood Context : 1*SE +1*AL -2*PR' \
	-gltLabel 56 'BadGoOutcome_E' -gltCode 56  'Outcome : 1*GoBad' \
	-gltLabel 57 'BadGoOutcome_AL-SE_E' -gltCode 57  'Outcome : 1*GoBad  Context : 1*AL -1*SE' \
	-gltLabel 58 'BadGoOutcome_AL-PR_E' -gltCode 58 'Outcome : 1*GoBad Context : 1*AL -1*PR' \
	-gltLabel 59 'BadGoOutcome_PR-SE_E' -gltCode 59  'Outcome : 1*GoBad Context : 1*PR -1*SE' \
	-gltLabel 60 'BadGoOutcome_social_vs_alone_E' -gltCode 60  'Outcome : 1*GoBad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 61 'BadGoOutcome_all_vs_exclux_E' -gltCode 61  'Outcome : 1*GoBad Context : 1*PR +1*AL -2*SE' \
	-gltLabel 62 'BadGoOutcome_all_vs_peer_E' -gltCode 62  'Outcome : 1*GoBad Context : 1*SE +1*AL -2*PR' \
	-gltLabel 63 'GoodStopOutcome_E' -gltCode 63  'Outcome : 1*StopGood Context : 1*AL +1*PR +1*SE' \
	-gltLabel 64 'GoodStopOutcome_AL-SE_E' -gltCode 64  'Outcome : 1*StopGood Context : 1*AL -1*SE' \
	-gltLabel 65 'GoodStopOutcome_AL-PR_E' -gltCode 65 'Outcome : 1*StopGood Context : 1*AL -1*PR' \
	-gltLabel 66 'GoodStopOutcome_PR-SE_E' -gltCode 66 'Outcome : 1*StopGood Context : 1*PR -1*SE' \
	-gltLabel 67 'GoodStopOutcome_social_vs_alone_E' -gltCode 67  'Outcome : 1*StopGood Context : 1*PR +1*SE -2*AL' \
	-gltLabel 68 'GoodStopOutcome_all_vs_exclux_E' -gltCode 68  'Outcome : 1*StopGood Context : 1*PR +1*AL -2*SE' \
	-gltLabel 69 'GoodStopOutcome_all_vs_peer_E' -gltCode 69  'Outcome : 1*StopGood Context : 1*SE +1*AL -2*PR' \
	-gltLabel 70 'BadStopOutcome_E' -gltCode 70  'Outcome : 1*StopBad Context : 1*AL +1*PR +1*SE' \
	-gltLabel 71 'BadStopOutcome_AL-SE_E' -gltCode 71  'Outcome : 1*StopBad Context : 1*AL -1*SE' \
	-gltLabel 72 'BadStopOutcome_AL-PR_E' -gltCode 72  'Outcome : 1*StopBad Context : 1*AL -1*PR' \
	-gltLabel 73 'BadStopOutcome_PR-SE_E' -gltCode 73  'Outcome : 1*StopBad Context : 1*PR -1*SE' \
	-gltLabel 74 'BadStopOutcome_social_vs_alone_E' -gltCode 74  'Outcome : 1*StopBad Context : 1*PR +1*SE -2*AL' \
	-gltLabel 75 'BadStopOutcome_all_vs_exclux_E' -gltCode 75  'Outcome : 1*StopBad Context : 1*PR +1*AL -2*SE' \
	-gltLabel 76 'BadStopOutcome_all_vs_peer_E' -gltCode 76  'Outcome : 1*StopBad Context : 1*SE +1*AL -2*PR' \
	-mask /projects/dsnlab/shared/tds/fMRI/analysis/masks/tds1_tds2/tds1_tds2_gw_smoothed_group_average_optthr_2mm.nii \
	-dataTable 				\
Subj Outcome Context Group InputFile \
	302	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0006.nii \
	302	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0016.nii \
	302	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0026.nii \
	302	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0009.nii \
	302	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0019.nii \
	302	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0029.nii \
	302	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0007.nii \
	302	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0017.nii \
	302	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0027.nii \
	302	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0010.nii \
	302	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0020.nii \
	302	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/302/con_0030.nii \
	303	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0006.nii \
	303	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0016.nii \
	303	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0026.nii \
	303	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0009.nii \
	303	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0019.nii \
	303	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0029.nii \
	303	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0007.nii \
	303	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0017.nii \
	303	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0027.nii \
	303	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0010.nii \
	303	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0020.nii \
	303	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/303/con_0030.nii \
	306	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0006.nii \
	306	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0016.nii \
	306	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0026.nii \
	306	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0009.nii \
	306	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0019.nii \
	306	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0029.nii \
	306	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0007.nii \
	306	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0017.nii \
	306	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0027.nii \
	306	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0010.nii \
	306	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0020.nii \
	306	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/306/con_0030.nii \
	307	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0006.nii \
	307	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0016.nii \
	307	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0026.nii \
	307	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0009.nii \
	307	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0019.nii \
	307	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0029.nii \
	307	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0007.nii \
	307	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0017.nii \
	307	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0027.nii \
	307	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0010.nii \
	307	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0020.nii \
	307	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/307/con_0030.nii \
	308	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0006.nii \
	308	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0016.nii \
	308	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0026.nii \
	308	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0009.nii \
	308	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0019.nii \
	308	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0029.nii \
	308	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0007.nii \
	308	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0017.nii \
	308	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0027.nii \
	308	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0010.nii \
	308	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0020.nii \
	308	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/308/con_0030.nii \
	309	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0006.nii \
	309	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0016.nii \
	309	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0026.nii \
	309	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0009.nii \
	309	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0019.nii \
	309	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0029.nii \
	309	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0007.nii \
	309	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0017.nii \
	309	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0027.nii \
	309	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0010.nii \
	309	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0020.nii \
	309	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/309/con_0030.nii \
	310	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0006.nii \
	310	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0016.nii \
	310	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0026.nii \
	310	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0009.nii \
	310	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0019.nii \
	310	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0029.nii \
	310	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0007.nii \
	310	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0017.nii \
	310	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0027.nii \
	310	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0010.nii \
	310	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0020.nii \
	310	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/310/con_0030.nii \
	312	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0006.nii \
	312	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0016.nii \
	312	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0026.nii \
	312	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0009.nii \
	312	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0019.nii \
	312	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0029.nii \
	312	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0007.nii \
	312	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0017.nii \
	312	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0027.nii \
	312	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0010.nii \
	312	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0020.nii \
	312	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/312/con_0030.nii \
	313	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0006.nii \
	313	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0016.nii \
	313	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0026.nii \
	313	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0009.nii \
	313	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0019.nii \
	313	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0029.nii \
	313	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0007.nii \
	313	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0017.nii \
	313	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0027.nii \
	313	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0010.nii \
	313	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0020.nii \
	313	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/313/con_0030.nii \
	314	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0006.nii \
	314	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0016.nii \
	314	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0026.nii \
	314	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0009.nii \
	314	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0019.nii \
	314	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0029.nii \
	314	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0007.nii \
	314	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0017.nii \
	314	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0027.nii \
	314	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0010.nii \
	314	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0020.nii \
	314	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/314/con_0030.nii \
	316	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0006.nii \
	316	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0016.nii \
	316	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0026.nii \
	316	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0009.nii \
	316	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0019.nii \
	316	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0029.nii \
	316	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0007.nii \
	316	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0017.nii \
	316	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0027.nii \
	316	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0010.nii \
	316	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0020.nii \
	316	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/316/con_0030.nii \
	317	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0006.nii \
	317	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0016.nii \
	317	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0026.nii \
	317	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0009.nii \
	317	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0019.nii \
	317	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0029.nii \
	317	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0007.nii \
	317	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0017.nii \
	317	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0027.nii \
	317	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0010.nii \
	317	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0020.nii \
	317	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/317/con_0030.nii \
	320	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0006.nii \
	320	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0016.nii \
	320	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0026.nii \
	320	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0009.nii \
	320	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0019.nii \
	320	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0029.nii \
	320	StopGood	AL 	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0007.nii \
	320	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0017.nii \
	320	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0027.nii \
	320	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0010.nii \
	320	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0020.nii \
	320	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/320/con_0030.nii \
	321	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0006.nii \
	321	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0016.nii \
	321	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0026.nii \
	321	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0009.nii \
	321	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0019.nii \
	321	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0029.nii \
	321	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0007.nii \
	321	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0017.nii \
	321	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0027.nii \
	321	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0010.nii \
	321	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0020.nii \
	321	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/321/con_0030.nii \
	322	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0006.nii \
	322	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0016.nii \
	322	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0026.nii \
	322	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0009.nii \
	322	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0019.nii \
	322	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0029.nii \
	322	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0007.nii \
	322	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0017.nii \
	322	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0027.nii \
	322	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0010.nii \
	322	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0020.nii \
	322	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/322/con_0030.nii \
	323	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0006.nii \
	323	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0016.nii \
	323	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0026.nii \
	323	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0009.nii \
	323	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0019.nii \
	323	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0029.nii \
	323	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0007.nii \
	323	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0017.nii \
	323	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0027.nii \
	323	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0010.nii \
	323	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0020.nii \
	323	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/323/con_0030.nii \
	324	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0006.nii \
	324	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0016.nii \
	324	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0026.nii \
	324	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0009.nii \
	324	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0019.nii \
	324	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0029.nii \
	324	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0007.nii \
	324	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0017.nii \
	324	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0027.nii \
	324	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0010.nii \
	324	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0020.nii \
	324	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/324/con_0030.nii \
	325	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0006.nii \
	325	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0016.nii \
	325	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0026.nii \
	325	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0009.nii \
	325	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0019.nii \
	325	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0029.nii \
	325	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0007.nii \
	325	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0017.nii \
	325	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0027.nii \
	325	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0010.nii \
	325	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0020.nii \
	325	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/325/con_0030.nii \
	326	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0006.nii \
	326	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0016.nii \
	326	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0026.nii \
	326	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0009.nii \
	326	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0019.nii \
	326	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0029.nii \
	326	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0007.nii \
	326	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0017.nii \
	326	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0027.nii \
	326	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0010.nii \
	326	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0020.nii \
	326	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/326/con_0030.nii \
	327	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0006.nii \
	327	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0016.nii \
	327	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0026.nii \
	327	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0009.nii \
	327	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0019.nii \
	327	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0029.nii \
	327	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0007.nii \
	327	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0017.nii \
	327	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0027.nii \
	327	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0010.nii \
	327	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0020.nii \
	327	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/327/con_0030.nii \
	328	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0006.nii \
	328	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0016.nii \
	328	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0026.nii \
	328	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0009.nii \
	328	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0019.nii \
	328	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0029.nii \
	328	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0007.nii \
	328	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0017.nii \
	328	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0027.nii \
	328	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0010.nii \
	328	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0020.nii \
	328	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/328/con_0030.nii \
	329	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0006.nii \
	329	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0016.nii \
	329	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0026.nii \
	329	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0009.nii \
	329	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0019.nii \
	329	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0029.nii \
	329	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0007.nii \
	329	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0017.nii \
	329	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0027.nii \
	329	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0010.nii \
	329	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0020.nii \
	329	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/329/con_0030.nii \
	330	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0006.nii \
	330	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0016.nii \
	330	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0026.nii \
	330	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0009.nii \
	330	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0019.nii \
	330	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0029.nii \
	330	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0007.nii \
	330	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0017.nii \
	330	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0027.nii \
	330	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0010.nii \
	330	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0020.nii \
	330	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/330/con_0030.nii \
	331	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0006.nii \
	331	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0016.nii \
	331	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0026.nii \
	331	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0009.nii \
	331	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0019.nii \
	331	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0029.nii \
	331	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0007.nii \
	331	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0017.nii \
	331	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0027.nii \
	331	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0010.nii \
	331	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0020.nii \
	331	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/331/con_0030.nii \
	332	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0006.nii \
	332	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0016.nii \
	332	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0026.nii \
	332	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0009.nii \
	332	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0019.nii \
	332	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0029.nii \
	332	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0007.nii \
	332	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0017.nii \
	332	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0027.nii \
	332	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0010.nii \
	332	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0020.nii \
	332	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/332/con_0030.nii \
	333	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0006.nii \
	333	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0016.nii \
	333	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0026.nii \
	333	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0009.nii \
	333	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0019.nii \
	333	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0029.nii \
	333	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0007.nii \
	333	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0017.nii \
	333	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0027.nii \
	333	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0010.nii \
	333	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0020.nii \
	333	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/333/con_0030.nii \
	335	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0006.nii \
	335	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0016.nii \
	335	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0026.nii \
	335	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0009.nii \
	335	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0019.nii \
	335	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0029.nii \
	335	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0007.nii \
	335	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0017.nii \
	335	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0027.nii \
	335	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0010.nii \
	335	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0020.nii \
	335	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/335/con_0030.nii \
	336	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0006.nii \
	336	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0016.nii \
	336	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0026.nii \
	336	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0009.nii \
	336	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0019.nii \
	336	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0029.nii \
	336	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0007.nii \
	336	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0017.nii \
	336	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0027.nii \
	336	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0010.nii \
	336	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0020.nii \
	336	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/336/con_0030.nii \
	337	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0006.nii \
	337	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0016.nii \
	337	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0026.nii \
	337	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0009.nii \
	337	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0019.nii \
	337	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0029.nii \
	337	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0007.nii \
	337	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0017.nii \
	337	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0027.nii \
	337	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0010.nii \
	337	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0020.nii \
	337	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/337/con_0030.nii \
	340	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0006.nii \
	340	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0016.nii \
	340	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0026.nii \
	340	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0009.nii \
	340	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0019.nii \
	340	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0029.nii \
	340	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0007.nii \
	340	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0017.nii \
	340	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0027.nii \
	340	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0010.nii \
	340	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0020.nii \
	340	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/340/con_0030.nii \
	341	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0006.nii \
	341	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0016.nii \
	341	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0026.nii \
	341	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0009.nii \
	341	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0019.nii \
	341	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0029.nii \
	341	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0007.nii \
	341	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0017.nii \
	341	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0027.nii \
	341	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0010.nii \
	341	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0020.nii \
	341	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/341/con_0030.nii \
	342	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0006.nii \
	342	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0016.nii \
	342	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0026.nii \
	342	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0009.nii \
	342	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0019.nii \
	342	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0029.nii \
	342	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0007.nii \
	342	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0017.nii \
	342	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0027.nii \
	342	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0010.nii \
	342	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0020.nii \
	342	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/342/con_0030.nii \
	343	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0006.nii \
	343	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0016.nii \
	343	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0026.nii \
	343	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0009.nii \
	343	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0019.nii \
	343	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0029.nii \
	343	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0007.nii \
	343	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0017.nii \
	343	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0027.nii \
	343	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0010.nii \
	343	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0020.nii \
	343	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/343/con_0030.nii \
	344	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0006.nii \
	344	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0016.nii \
	344	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0026.nii \
	344	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0009.nii \
	344	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0019.nii \
	344	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0029.nii \
	344	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0007.nii \
	344	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0017.nii \
	344	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0027.nii \
	344	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0010.nii \
	344	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0020.nii \
	344	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/344/con_0030.nii \
	346	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0006.nii \
	346	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0016.nii \
	346	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0026.nii \
	346	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0009.nii \
	346	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0019.nii \
	346	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0029.nii \
	346	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0007.nii \
	346	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0017.nii \
	346	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0027.nii \
	346	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0010.nii \
	346	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0020.nii \
	346	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/346/con_0030.nii \
	347	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0006.nii \
	347	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0016.nii \
	347	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0026.nii \
	347	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0009.nii \
	347	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0019.nii \
	347	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0029.nii \
	347	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0007.nii \
	347	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0017.nii \
	347	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0027.nii \
	347	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0010.nii \
	347	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0020.nii \
	347	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/347/con_0030.nii \
	348	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0006.nii \
	348	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0016.nii \
	348	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0026.nii \
	348	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0009.nii \
	348	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0019.nii \
	348	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0029.nii \
	348	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0007.nii \
	348	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0017.nii \
	348	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0027.nii \
	348	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0010.nii \
	348	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0020.nii \
	348	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/348/con_0030.nii \
	349	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0006.nii \
	349	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0016.nii \
	349	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0026.nii \
	349	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0009.nii \
	349	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0019.nii \
	349	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0029.nii \
	349	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0007.nii \
	349	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0017.nii \
	349	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0027.nii \
	349	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0010.nii \
	349	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0020.nii \
	349	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/349/con_0030.nii \
	351	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0006.nii \
	351	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0016.nii \
	351	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0026.nii \
	351	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0009.nii \
	351	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0019.nii \
	351	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0029.nii \
	351	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0007.nii \
	351	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0017.nii \
	351	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0027.nii \
	351	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0010.nii \
	351	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0020.nii \
	351	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/351/con_0030.nii \
	352	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0006.nii \
	352	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0016.nii \
	352	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0026.nii \
	352	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0009.nii \
	352	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0019.nii \
	352	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0029.nii \
	352	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0007.nii \
	352	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0017.nii \
	352	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0027.nii \
	352	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0010.nii \
	352	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0020.nii \
	352	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/352/con_0030.nii \
	353	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0006.nii \
	353	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0016.nii \
	353	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0026.nii \
	353	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0009.nii \
	353	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0019.nii \
	353	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0029.nii \
	353	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0007.nii \
	353	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0017.nii \
	353	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0027.nii \
	353	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0010.nii \
	353	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0020.nii \
	353	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/353/con_0030.nii \
	354	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0006.nii \
	354	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0016.nii \
	354	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0026.nii \
	354	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0009.nii \
	354	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0019.nii \
	354	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0029.nii \
	354	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0007.nii \
	354	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0017.nii \
	354	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0027.nii \
	354	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0010.nii \
	354	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0020.nii \
	354	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/354/con_0030.nii \
	355	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0006.nii \
	355	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0016.nii \
	355	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0026.nii \
	355	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0009.nii \
	355	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0019.nii \
	355	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0029.nii \
	355	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0007.nii \
	355	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0017.nii \
	355	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0027.nii \
	355	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0010.nii \
	355	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0020.nii \
	355	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/355/con_0030.nii \
	357	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0006.nii \
	357	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0016.nii \
	357	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0026.nii \
	357	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0009.nii \
	357	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0019.nii \
	357	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0029.nii \
	357	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0007.nii \
	357	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0017.nii \
	357	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0027.nii \
	357	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0010.nii \
	357	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0020.nii \
	357	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/357/con_0030.nii \
	359	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0006.nii \
	359	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0016.nii \
	359	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0026.nii \
	359	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0009.nii \
	359	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0019.nii \
	359	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0029.nii \
	359	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0007.nii \
	359	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0017.nii \
	359	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0027.nii \
	359	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0010.nii \
	359	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0020.nii \
	359	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/359/con_0030.nii \
	360	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0006.nii \
	360	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0016.nii \
	360	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0026.nii \
	360	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0009.nii \
	360	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0019.nii \
	360	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0029.nii \
	360	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0007.nii \
	360	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0017.nii \
	360	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0027.nii \
	360	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0010.nii \
	360	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0020.nii \
	360	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/360/con_0030.nii \
	361	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0006.nii \
	361	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0016.nii \
	361	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0026.nii \
	361	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0009.nii \
	361	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0019.nii \
	361	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0029.nii \
	361	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0007.nii \
	361	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0017.nii \
	361	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0027.nii \
	361	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0010.nii \
	361	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0020.nii \
	361	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/361/con_0030.nii \
	363	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0006.nii \
	363	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0016.nii \
	363	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0026.nii \
	363	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0009.nii \
	363	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0019.nii \
	363	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0029.nii \
	363	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0007.nii \
	363	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0017.nii \
	363	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0027.nii \
	363	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0010.nii \
	363	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0020.nii \
	363	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/363/con_0030.nii \
	365	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0006.nii \
	365	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0016.nii \
	365	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0026.nii \
	365	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0009.nii \
	365	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0019.nii \
	365	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0029.nii \
	365	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0007.nii \
	365	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0017.nii \
	365	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0027.nii \
	365	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0010.nii \
	365	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0020.nii \
	365	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/365/con_0030.nii \
	367	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0006.nii \
	367	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0016.nii \
	367	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0026.nii \
	367	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0009.nii \
	367	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0019.nii \
	367	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0029.nii \
	367	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0007.nii \
	367	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0017.nii \
	367	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0027.nii \
	367	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0010.nii \
	367	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0020.nii \
	367	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/367/con_0030.nii \
	368	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0006.nii \
	368	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0016.nii \
	368	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0026.nii \
	368	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0009.nii \
	368	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0019.nii \
	368	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0029.nii \
	368	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0007.nii \
	368	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0017.nii \
	368	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0027.nii \
	368	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0010.nii \
	368	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0020.nii \
	368	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/368/con_0030.nii \
	369	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0006.nii \
	369	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0016.nii \
	369	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0026.nii \
	369	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0009.nii \
	369	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0019.nii \
	369	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0029.nii \
	369	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0007.nii \
	369	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0017.nii \
	369	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0027.nii \
	369	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0010.nii \
	369	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0020.nii \
	369	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/369/con_0030.nii \
	371	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0006.nii \
	371	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0016.nii \
	371	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0026.nii \
	371	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0009.nii \
	371	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0019.nii \
	371	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0029.nii \
	371	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0007.nii \
	371	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0017.nii \
	371	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0027.nii \
	371	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0010.nii \
	371	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0020.nii \
	371	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/371/con_0030.nii \
	372	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0006.nii \
	372	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0016.nii \
	372	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0026.nii \
	372	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0009.nii \
	372	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0019.nii \
	372	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0029.nii \
	372	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0007.nii \
	372	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0017.nii \
	372	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0027.nii \
	372	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0010.nii \
	372	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0020.nii \
	372	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/372/con_0030.nii \
	373	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0006.nii \
	373	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0016.nii \
	373	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0026.nii \
	373	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0009.nii \
	373	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0019.nii \
	373	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0029.nii \
	373	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0007.nii \
	373	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0017.nii \
	373	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0027.nii \
	373	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0010.nii \
	373	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0020.nii \
	373	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/373/con_0030.nii \
	374	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0006.nii \
	374	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0016.nii \
	374	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0026.nii \
	374	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0009.nii \
	374	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0019.nii \
	374	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0029.nii \
	374	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0007.nii \
	374	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0017.nii \
	374	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0027.nii \
	374	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0010.nii \
	374	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0020.nii \
	374	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/374/con_0030.nii \
	375	GoGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0006.nii \
	375	GoGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0016.nii \
	375	GoGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0026.nii \
	375	GoBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0009.nii \
	375	GoBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0019.nii \
	375	GoBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0029.nii \
	375	StopGood	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0007.nii \
	375	StopGood	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0017.nii \
	375	StopGood	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0027.nii \
	375	StopBad	AL	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0010.nii \
	375	StopBad	PR	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0020.nii \
	375	StopBad	SE	EA	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod_tds1/375/con_0030.nii \
