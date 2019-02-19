#!/bin/bash
#--------------------------------------------------------------
#
#SBATCH --job-name=TDS_allconds_nopmods_3dmvm
#SBATCH --output=output/allcons_nppmods_3dmvm.log
#SBATCH --error=output/allcons_3dmvm_nopmods_error.log
#SBATCH --time=1-00:00:00
#SBATCH --cpus-per-task=28
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --partition=short,fat

module load prl afni/17.3.00
export LD_PRELOAD=/packages/gcc/7.2/lib64/libstdc++.so

cd /projects/dsnlab/shared/tds/fMRI/analysis/rx/ylg/all/tds1/Outcomes/
	3dMVM -prefix OutcomesXContextXGroup \
	-jobs 28 \
	-bsVars "Group" \
	-wsVars  "Outcome*Context" \
	-SS_type 3 \
	-num_glt 76 \
	-gltLabel 1 'Out_AL-SE_EvC' -gltCode 1  'Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 2 'Out_AL-PR_EvC' -gltCode 2  'Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 3 'Out_PR-SE_EvC' -gltCode 3  'Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 4 'Out_soc_vs_al_EvC' -gltCode 4  'Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 5 'Out_all_vs_ex_EvC' -gltCode 5  'Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 6 'Out_all_vs_pr_EvC' -gltCode 6  'Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 7 'GoOutcome_AL-SE_EvC' -gltCode 7  'Outcome : 1*GoGood +1*GoBad Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 8 'GoOutcome_AL-PR_EvC' -gltCode 8  'Outcome : 1*GoGood +1*GoBad Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 9 'GoOutcome_PR-SE_EvC' -gltCode 9  'Outcome : 1*GoGood +1*GoBad Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 10 'GoOutcome_EvC' -gltCode 10  'Outcome : 1*GoGood +1*GoBad Group : 1*EA -1*COM' \
	-gltLabel 11 'GoOutcome_social_vs_alone_EvC' -gltCode 11  'Outcome : 1*GoGood +1*GoBad Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 12 'GoOutcome_all_vs_exclux_EvC' -gltCode 12  'Outcome : 1*GoGood +1*GoBad Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 13 'GoOutcome_all_vs_peer_EvC' -gltCode 13  'Outcome : 1*GoGood +1*GoBad Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 14 'StopO_AL-SE_EvC' -gltCode 14  'Outcome : 1*StopGood +1*StopBad Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 15 'StopO_AL-PR_EvC' -gltCode 15 'Outcome : 1*StopGood +1*StopBad Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 16 'StopO_PR-SE_EvC' -gltCode 16 'Outcome : 1*StopGood +1*StopBad Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 17 'StopOutcome_EvC' -gltCode 17 'Outcome : 1*StopGood +1*StopBad Group : 1*EA -1*COM' \
	-gltLabel 18 'StopOutcome_social_vs_alone_EvC' -gltCode 18  'Outcome : 1*StopGood +1*StopBad Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 19 'StopOutcome_all_vs_exclux_EvC' -gltCode 19  'Outcome : 1*StopGood +1*StopBad Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 20 'StopOutcome_all_vs_peer_EvC' -gltCode 20  'Outcome : 1*StopGood +1*StopBad Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 21 'GoOutcome_StopOutcome_AL-SE_EvC' -gltCode 21  'Outcome :  1*GoGood & 1*GoBad -1*StopGood & 1*StopBad  Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 22 'GoOutcome_StopOutcome_AL-PR_EvC' -gltCode 22  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 23 'GoOutcome_StopOutcome_PR-SE_EvC' -gltCode 23  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 24 'GoOutcome_StopOutcome_EvC' -gltCode 24  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Group : 1*EA -1*COM' \
	-gltLabel 25 'GoOutcome_StopOutcome_social_vs_alone_EvC' -gltCode 25  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 26 'GoOutcome_StopOutcome_all_vs_exclux_EvC' -gltCode 26  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 27 'GoOutcome_StopOutcome_all_vs_peer_EvC' -gltCode 27  'Outcome : 1*GoGood & 1*GoBad -1*StopGood & 1*StopBad Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 28 'Good_AL-SE_EvC' -gltCode 28  'Outcome : 1*GoGood +1*StopGood Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 29 'Good_AL-PR_EvC' -gltCode 29  'Outcome : 1*GoGood +1*StopGood Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 30 'Good_PR-SE_EvC' -gltCode 30  'Outcome : 1*GoGood +1*StopGood Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 31 'GoodOutcome_EvC' -gltCode 31  'Outcome : 1*GoGood +1*StopGood' \
	-gltLabel 32 'GoodOutcome_social_vs_alone_EvC' -gltCode 32  'Outcome : 1*GoGood +1*StopGood Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 33 'GoodOutcome_all_vs_exclux_EvC' -gltCode 33  'Outcome : 1*GoGood +1*StopGood Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 34 'GoodOutcome_all_vs_peer_EvC' -gltCode 34  'Outcome : 1*GoGood +1*StopGood Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 35 'Bad_AL-SE_EvC' -gltCode 35  'Outcome : 1*GoBad +1*StopBad Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 36 'Bad_AL-PR_EvC' -gltCode 36  'Outcome : 1*GoBad +1*StopBad Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 37 'Bad_PR-SE_EvC' -gltCode 37  'Outcome : 1*GoBad +1*StopBad Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 38 'BadOutcome_EvC' -gltCode 38  'Outcome : 1*GoBad +1*StopBad Group : 1*EA -1*COM' \
	-gltLabel 39 'BadOutcome_social_vs_alone_EvC' -gltCode 39  'Outcome : 1*GoBad +1*StopBad Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 40 'BadOutcome_all_vs_exclux_EvC' -gltCode 40  'Outcome : 1*GoBad +1*StopBad Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 41 'BadOutcome_all_vs_peer_EvC' -gltCode 41  'Outcome : 1*GoBad +1*StopBad Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 42 'Good_Bad_AL-SE_EvC' -gltCode 42  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 43 'Good_Bad_AL-PR_EvC' -gltCode 43  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 44 'Good_Bad_PR-SE_EvC' -gltCode 44  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 45 'Good_Bad_EvC' -gltCode 45  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Group : 1*EA -1*COM' \
	-gltLabel 46 'Good_Bad_social_vs_alone_EvC' -gltCode 46  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 47 'Good_Bad_all_vs_exclux_EvC' -gltCode 47  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 48 'Good_Bad_all_vs_peer_EvC' -gltCode 48  'Outcome : 1*StopGood & 1*GoGood -1*StopBad & 1*GoBad Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 49 'GoodGoOutcome_EvC' -gltCode 49  'Outcome : 1*GoGood Group : 1*EA -1*COM' \
	-gltLabel 50 'GoodGoOutcome_AL-SE_EvC' -gltCode 50  'Outcome : 1*GoGood  Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 51 'GoodGoOutcome_AL-PR_EvC' -gltCode 51  'Outcome : 1*GoGood Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 52 'GoodGoOutcome_PR-SE_EvC' -gltCode 52  'Outcome : 1*GoGood Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 53 'GoodGoOutcome_social_vs_alone_EvC' -gltCode 53  'Outcome : 1*GoGood Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 54 'GoodGoOutcome_all_vs_exclux_EvC' -gltCode 54  'Outcome : 1*GoGood Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 55 'GoodGoOutcome_all_vs_peer_EvC' -gltCode 55  'Outcome : 1*GoGood Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 56 'BadGoOutcome_EvC' -gltCode 56  'Outcome : 1*GoBad Group : 1*EA -1*COM' \
	-gltLabel 57 'BadGoOutcome_AL-SE_EvC' -gltCode 57  'Outcome : 1*GoBad  Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 58 'BadGoOutcome_AL-PR_EvC' -gltCode 58 'Outcome : 1*GoBad Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 59 'BadGoOutcome_PR-SE_EvC' -gltCode 59  'Outcome : 1*GoBad Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 60 'BadGoOutcome_social_vs_alone_EvC' -gltCode 60  'Outcome : 1*GoBad Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 61 'BadGoOutcome_all_vs_exclux_EvC' -gltCode 61  'Outcome : 1*GoBad Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 62 'BadGoOutcome_all_vs_peer_EvC' -gltCode 62  'Outcome : 1*GoBad Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 63 'GoodStopOutcome_EvC' -gltCode 63  'Outcome : 1*StopGood Context : 1*AL +1*PR +1*SE Group : 1*EA -1*COM' \
	-gltLabel 64 'GoodStopOutcome_AL-SE_EvC' -gltCode 64  'Outcome : 1*StopGood Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 65 'GoodStopOutcome_AL-PR_EvC' -gltCode 65 'Outcome : 1*StopGood Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 66 'GoodStopOutcome_PR-SE_EvC' -gltCode 66 'Outcome : 1*StopGood Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 67 'GoodStopOutcome_social_vs_alone_EvC' -gltCode 67  'Outcome : 1*StopGood Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 68 'GoodStopOutcome_all_vs_exclux_EvC' -gltCode 68  'Outcome : 1*StopGood Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 69 'GoodStopOutcome_all_vs_peer_EvC' -gltCode 69  'Outcome : 1*StopGood Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-gltLabel 70 'BadStopOutcome_EvC' -gltCode 70  'Outcome : 1*StopBad Context : 1*AL +1*PR +1*SE Group : 1*EA -1*COM' \
	-gltLabel 71 'BadStopOutcome_AL-SE_EvC' -gltCode 71  'Outcome : 1*StopBad Context : 1*AL -1*SE Group : 1*EA -1*COM' \
	-gltLabel 72 'BadStopOutcome_AL-PR_EvC' -gltCode 72  'Outcome : 1*StopBad Context : 1*AL -1*PR Group : 1*EA -1*COM' \
	-gltLabel 73 'BadStopOutcome_PR-SE_EvC' -gltCode 73  'Outcome : 1*StopBad Context : 1*PR -1*SE Group : 1*EA -1*COM' \
	-gltLabel 74 'BadStopOutcome_social_vs_alone_EvC' -gltCode 74  'Outcome : 1*StopBad Context : 1*PR +1*SE -2*AL Group : 1*EA -1*COM' \
	-gltLabel 75 'BadStopOutcome_all_vs_exclux_EvC' -gltCode 75  'Outcome : 1*StopBad Context : 1*PR +1*AL -2*SE Group : 1*EA -1*COM' \
	-gltLabel 76 'BadStopOutcome_all_vs_peer_EvC' -gltCode 76  'Outcome : 1*StopBad Context : 1*SE +1*AL -2*PR Group : 1*EA -1*COM' \
	-mask /projects/dsnlab/shared/tds/fMRI/analysis/masks/tds1_tds2/tds1_tds2_gw_smoothed_group_average_optthr_2mm.nii \
	-dataTable 				\
Subj Outcome Context Group InputFile \
	109	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0005.nii \
	109	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0015.nii \
	109	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0025.nii \
	109	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0008.nii \
	109	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0018.nii \
	109	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/109/con_0028.nii \
	113	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0005.nii \
	113	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0015.nii \
	113	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0025.nii \
	113	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0008.nii \
	113	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0018.nii \
	113	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/113/con_0028.nii \
	114	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0005.nii \
	114	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0015.nii \
	114	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0025.nii \
	114	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0008.nii \
	114	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0018.nii \
	114	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/114/con_0028.nii \
	115	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0005.nii \
	115	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0015.nii \
	115	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0025.nii \
	115	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0008.nii \
	115	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0018.nii \
	115	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/115/con_0028.nii \
	116	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0005.nii \
	116	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0015.nii \
	116	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0025.nii \
	116	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0008.nii \
	116	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0018.nii \
	116	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/116/con_0028.nii \
	117	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0005.nii \
	117	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0015.nii \
	117	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0025.nii \
	117	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0008.nii \
	117	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0018.nii \
	117	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/117/con_0028.nii \
	119	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0005.nii \
	119	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0015.nii \
	119	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0025.nii \
	119	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0008.nii \
	119	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0018.nii \
	119	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/119/con_0028.nii \
	120	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0005.nii \
	120	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0015.nii \
	120	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0025.nii \
	120	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0008.nii \
	120	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0018.nii \
	120	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/120/con_0028.nii \
	121	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0005.nii \
	121	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0015.nii \
	121	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0025.nii \
	121	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0008.nii \
	121	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0018.nii \
	121	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/121/con_0028.nii \
	122	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0005.nii \
	122	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0015.nii \
	122	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0025.nii \
	122	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0008.nii \
	122	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0018.nii \
	122	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/122/con_0028.nii \
	124	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0005.nii \
	124	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0015.nii \
	124	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0025.nii \
	124	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0008.nii \
	124	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0018.nii \
	124	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/124/con_0028.nii \
	125	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0005.nii \
	125	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0015.nii \
	125	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0025.nii \
	125	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0008.nii \
	125	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0018.nii \
	125	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/125/con_0028.nii \
	126	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0005.nii \
	126	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0015.nii \
	126	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0025.nii \
	126	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0008.nii \
	126	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0018.nii \
	126	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/126/con_0028.nii \
	128	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0005.nii \
	128	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0015.nii \
	128	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0025.nii \
	128	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0008.nii \
	128	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0018.nii \
	128	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/128/con_0028.nii \
	129	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0005.nii \
	129	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0015.nii \
	129	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0025.nii \
	129	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0008.nii \
	129	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0018.nii \
	129	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/129/con_0028.nii \
	130	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0005.nii \
	130	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0015.nii \
	130	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0025.nii \
	130	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0008.nii \
	130	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0018.nii \
	130	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/130/con_0028.nii \
	131	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0005.nii \
	131	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0015.nii \
	131	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0025.nii \
	131	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0008.nii \
	131	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0018.nii \
	131	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/131/con_0028.nii \
	132	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0005.nii \
	132	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0015.nii \
	132	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0025.nii \
	132	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0008.nii \
	132	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0018.nii \
	132	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/132/con_0028.nii \
	133	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0005.nii \
	133	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0015.nii \
	133	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0025.nii \
	133	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0008.nii \
	133	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0018.nii \
	133	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/133/con_0028.nii \
	134	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0005.nii \
	134	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0015.nii \
	134	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0025.nii \
	134	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0008.nii \
	134	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0018.nii \
	134	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/134/con_0028.nii \
	136	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0005.nii \
	136	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0015.nii \
	136	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0025.nii \
	136	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0008.nii \
	136	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0018.nii \
	136	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/136/con_0028.nii \
	140	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0005.nii \
	140	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0015.nii \
	140	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0025.nii \
	140	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0008.nii \
	140	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0018.nii \
	140	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/140/con_0028.nii \
	141	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0005.nii \
	141	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0015.nii \
	141	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0025.nii \
	141	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0008.nii \
	141	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0018.nii \
	141	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/141/con_0028.nii \
	142	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0005.nii \
	142	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0015.nii \
	142	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0025.nii \
	142	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0008.nii \
	142	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0018.nii \
	142	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/142/con_0028.nii \
	144	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0005.nii \
	144	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0015.nii \
	144	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0025.nii \
	144	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0008.nii \
	144	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0018.nii \
	144	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/144/con_0028.nii \
	145	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0005.nii \
	145	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0015.nii \
	145	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0025.nii \
	145	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0008.nii \
	145	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0018.nii \
	145	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/145/con_0028.nii \
	146	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0005.nii \
	146	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0015.nii \
	146	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0025.nii \
	146	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0008.nii \
	146	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0018.nii \
	146	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/146/con_0028.nii \
	150	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0005.nii \
	150	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0015.nii \
	150	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0025.nii \
	150	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0008.nii \
	150	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0018.nii \
	150	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/150/con_0028.nii \
	151	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0005.nii \
	151	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0015.nii \
	151	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0025.nii \
	151	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0008.nii \
	151	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0018.nii \
	151	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/151/con_0028.nii \
	152	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0005.nii \
	152	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0015.nii \
	152	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0025.nii \
	152	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0008.nii \
	152	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0018.nii \
	152	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/152/con_0028.nii \
	155	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0005.nii \
	155	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0015.nii \
	155	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0025.nii \
	155	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0008.nii \
	155	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0018.nii \
	155	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/155/con_0028.nii \
	156	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0005.nii \
	156	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0015.nii \
	156	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0025.nii \
	156	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0008.nii \
	156	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0018.nii \
	156	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/156/con_0028.nii \
	157	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0005.nii \
	157	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0015.nii \
	157	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0025.nii \
	157	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0008.nii \
	157	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0018.nii \
	157	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/157/con_0028.nii \
	159	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0005.nii \
	159	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0015.nii \
	159	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0025.nii \
	159	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0008.nii \
	159	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0018.nii \
	159	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/159/con_0028.nii \
	160	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0005.nii \
	160	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0015.nii \
	160	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0025.nii \
	160	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0008.nii \
	160	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0018.nii \
	160	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/160/con_0028.nii \
	161	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0005.nii \
	161	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0015.nii \
	161	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0025.nii \
	161	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0008.nii \
	161	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0018.nii \
	161	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/161/con_0028.nii \
	162	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0005.nii \
	162	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0015.nii \
	162	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0025.nii \
	162	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0008.nii \
	162	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0018.nii \
	162	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/162/con_0028.nii \
	163	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0005.nii \
	163	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0015.nii \
	163	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0025.nii \
	163	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0008.nii \
	163	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0018.nii \
	163	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/163/con_0028.nii \
	164	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0005.nii \
	164	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0015.nii \
	164	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0025.nii \
	164	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0008.nii \
	164	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0018.nii \
	164	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/164/con_0028.nii \
	165	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0005.nii \
	165	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0015.nii \
	165	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0025.nii \
	165	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0008.nii \
	165	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0018.nii \
	165	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/165/con_0028.nii \
	167	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0005.nii \
	167	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0015.nii \
	167	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0025.nii \
	167	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0008.nii \
	167	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0018.nii \
	167	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/167/con_0028.nii \
	168	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0005.nii \
	168	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0015.nii \
	168	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0025.nii \
	168	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0008.nii \
	168	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0018.nii \
	168	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/168/con_0028.nii \
	169	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0005.nii \
	169	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0015.nii \
	169	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0025.nii \
	169	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0008.nii \
	169	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0018.nii \
	169	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/169/con_0028.nii \
	170	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0005.nii \
	170	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0015.nii \
	170	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0025.nii \
	170	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0008.nii \
	170	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0018.nii \
	170	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/170/con_0028.nii \
	171	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0005.nii \
	171	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0015.nii \
	171	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0025.nii \
	171	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0008.nii \
	171	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0018.nii \
	171	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/171/con_0028.nii \
	172	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0005.nii \
	172	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0015.nii \
	172	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0025.nii \
	172	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0008.nii \
	172	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0018.nii \
	172	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/172/con_0028.nii \
	173	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0005.nii \
	173	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0015.nii \
	173	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0025.nii \
	173	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0008.nii \
	173	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0018.nii \
	173	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/173/con_0028.nii \
	174	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0005.nii \
	174	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0015.nii \
	174	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0025.nii \
	174	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0008.nii \
	174	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0018.nii \
	174	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/174/con_0028.nii \
	175	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0005.nii \
	175	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0015.nii \
	175	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0025.nii \
	175	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0008.nii \
	175	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0018.nii \
	175	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/175/con_0028.nii \
	177	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0005.nii \
	177	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0015.nii \
	177	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0025.nii \
	177	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0008.nii \
	177	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0018.nii \
	177	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/177/con_0028.nii \
	178	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0005.nii \
	178	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0015.nii \
	178	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0025.nii \
	178	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0008.nii \
	178	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0018.nii \
	178	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/178/con_0028.nii \
	179	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0005.nii \
	179	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0015.nii \
	179	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0025.nii \
	179	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0008.nii \
	179	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0018.nii \
	179	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/179/con_0028.nii \
	181	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0005.nii \
	181	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0015.nii \
	181	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0025.nii \
	181	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0008.nii \
	181	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0018.nii \
	181	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/181/con_0028.nii \
	182	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0005.nii \
	182	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0015.nii \
	182	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0025.nii \
	182	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0008.nii \
	182	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0018.nii \
	182	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/182/con_0028.nii \
	183	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0005.nii \
	183	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0015.nii \
	183	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0025.nii \
	183	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0008.nii \
	183	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0018.nii \
	183	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/183/con_0028.nii \
	184	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0005.nii \
	184	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0015.nii \
	184	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0025.nii \
	184	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0008.nii \
	184	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0018.nii \
	184	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/184/con_0028.nii \
	185	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0005.nii \
	185	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0015.nii \
	185	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0025.nii \
	185	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0008.nii \
	185	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0018.nii \
	185	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/185/con_0028.nii \
	186	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0005.nii \
	186	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0015.nii \
	186	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0025.nii \
	186	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0008.nii \
	186	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0018.nii \
	186	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/186/con_0028.nii \
	187	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0005.nii \
	187	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0015.nii \
	187	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0025.nii \
	187	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0008.nii \
	187	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0018.nii \
	187	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/187/con_0028.nii \
	188	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0005.nii \
	188	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0015.nii \
	188	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0025.nii \
	188	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0008.nii \
	188	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0018.nii \
	188	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/188/con_0028.nii \
	190	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0005.nii \
	190	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0015.nii \
	190	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0025.nii \
	190	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0008.nii \
	190	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0018.nii \
	190	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/190/con_0028.nii \
	192	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0005.nii \
	192	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0015.nii \
	192	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0025.nii \
	192	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0008.nii \
	192	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0018.nii \
	192	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/192/con_0028.nii \
	193	Good	AL COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0005.nii \
	193	Good	PR COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0015.nii \
	193	Good	SE COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0025.nii \
	193	Bad	AL COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0008.nii \
	193	Bad	PR COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0018.nii \
	193	Bad	SE COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/193/con_0028.nii \
	194	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0005.nii \
	194	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0015.nii \
	194	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0025.nii \
	194	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0008.nii \
	194	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0018.nii \
	194	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/194/con_0028.nii \
	195	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0005.nii \
	195	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0015.nii \
	195	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0025.nii \
	195	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0008.nii \
	195	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0018.nii \
	195	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/195/con_0028.nii \
	196	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0005.nii \
	196	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0015.nii \
	196	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0025.nii \
	196	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0008.nii \
	196	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0018.nii \
	196	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/196/con_0028.nii \
	197	Good	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0005.nii \
	197	Good	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0015.nii \
	197	Good	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0025.nii \
	197	Bad	AL	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0008.nii \
	197	Bad	PR	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0018.nii \
	197	Bad	SE	COM	/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/197/con_0028.nii \
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