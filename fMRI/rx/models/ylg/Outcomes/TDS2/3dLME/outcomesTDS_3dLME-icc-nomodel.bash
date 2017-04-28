#!/bin/bash


cd /vxfsvol/home/research/tds/fMRI/analysis/rx/ylg/Outcomes/TDS2/3dLME 
module add R/3.3.1-shlib-tcltk
export PATH=/usr/local/afni_16.1.06:${PATH}
3dLME -prefix OutcomesTDS2_ICC_NOMODEL -jobs 1 \
	-model  "1" \
	-ranEff 'Subj' \
	-ICC \
	-SS_type 3 \
	-mask /vxfsvol/home/research/tds/fMRI/analysis/masks/G80/reslice_G80_gw_smoothed_group_average_optthr.nii \
	-dataTable 				\
	Subj	Outcome	Context Group InputFile \
	t109	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t109	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t109	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t109	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t109	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t109	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t113	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t113/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t113	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t113/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t113	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t113/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t113	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t113/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t113	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t113/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t113	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t113/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t114	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t114/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t114	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t114/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t114	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t114/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t114	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t114/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t114	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t114/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t114	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t114/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t115	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t115/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t115	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t115/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t115	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t115/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t115	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t115/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t115	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t115/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t115	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t115/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t116	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t116	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t116	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t116	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t116	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t116	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t117	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t117	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t117	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t117	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t117	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t117	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t116/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t119	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t119/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t119	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t119/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t119	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t119/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t119	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t119/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t119	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t119/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t119	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t119/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t120	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t120/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t120	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t120/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t120	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t120/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t120	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t120/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t120	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t120/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t120	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t120/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t121	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t121/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t121	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t121/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t121	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t121/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t121	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t121/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t121	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t121/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t121	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t121/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t122	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t122/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t122	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t122/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t122	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t122/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t122	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t122/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t122	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t122/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t122	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t122/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t124	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t124/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t124	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t124/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t124	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t124/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t124	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t124/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t124	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t124/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t124	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t124/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t125	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t125/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t125	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t125/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t125	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t125/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t125	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t125/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t125	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t125/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t125	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t125/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t126	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t126/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t126	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t126/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t126	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t126/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t126	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t126/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t126	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t126/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t126	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t126/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t128	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t128/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t128	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t128/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t128	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t128/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t128	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t128/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t128	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t128/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t128	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t128/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t129	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t129	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t129/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t129	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t129/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t129	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t129/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t129	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t129/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t129	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t129/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t130	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t130/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t130	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t130/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t130	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t130/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t130	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t130/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t130	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t130/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t130	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t130/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t131	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t131/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t131	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t131/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t131	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t131/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t131	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t131/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t131	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t131/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t131	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t131/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t132	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t132/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t132	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t132/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t132	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t132/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t132	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t132/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t132	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t132/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t132	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t132/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t133	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t133/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t133	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t133/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t133	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t133/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t133	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t133/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t133	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t133/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t133	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t133/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t134	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t134/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t134	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t134/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t134	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t134/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t134	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t134/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t134	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t134/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t134	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t134/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t135	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t135/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t135	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t135/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t135	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t135/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t135	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t135/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t135	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t135/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t135	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t135/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t136	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t136/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t136	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t136/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t136	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t136/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t136	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t136/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t136	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t136/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t136	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t136/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t137	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t137/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t137	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t137/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t137	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t137/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t137	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t137/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t137	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t137/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t137	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t137/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t139	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t139/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t139	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t139/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t139	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t139/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t139	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t139/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t139	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t139/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t139	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t139/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t140	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t140/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t140	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t140/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t140	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t140/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t140	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t140/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t140	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t140/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t140	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t140/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t141	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t141/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t141	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t141/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t141	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t141/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t141	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t141/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t141	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t141/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t141	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t141/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t142	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t142/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t142	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t142/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t142	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t142/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t142	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t142/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t142	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t142/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t142	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t142/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t144	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t144/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t144	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t144/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t144	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t144/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t144	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t144/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t144	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t144/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t144	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t144/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t145	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t145/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t145	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t145/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t145	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t145/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t145	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t145/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t145	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t145/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t145	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t145/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t146	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t146/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t146	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t146/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t146	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t146/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t146	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t146/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t146	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t146/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t146	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t146/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t150	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t150/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t150	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t150/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t150	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t150/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t150	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t150/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t150	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t150/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t150	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t150/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t151	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t151/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t151	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t151/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t151	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t151/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t151	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t151/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t151	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t151/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t151	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t151/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t152	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t152/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t152	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t152/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t152	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t152/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t152	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t152/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t152	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t152/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t152	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t152/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t155	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t155/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t155	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t155/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t155	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t155/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t155	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t155/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t155	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t155/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t155	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t155/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t156	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t156/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t156	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t156/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t156	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t156/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t156	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t156/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t156	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t156/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t156	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t156/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t157	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t157/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t157	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t157/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t157	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t157/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t157	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t157/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t157	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t157/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t157	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t157/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t158	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t158/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t158	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t158/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t158	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t158/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t158	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t158/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t158	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t158/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t158	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t158/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t159	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t159/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t159	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t159/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t159	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t159/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t159	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t159/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t159	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t159/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t159	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t159/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t160	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t160/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t160	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t160/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t160	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t160/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t160	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t160/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t160	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t160/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t160	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t160/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t161	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t161/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t161	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t161/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t161	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t161/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t161	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t161/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t161	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t161/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t161	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t161/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t162	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t162/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t162	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t162/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t162	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t162/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t162	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t162/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t162	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t162/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t162	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t162/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t163	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t163/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t163	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t163/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t163	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t163/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t163	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t163/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t163	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t163/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t163	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t163/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t164	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t164/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t164	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t164/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t164	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t164/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t164	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t164/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t164	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t164/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t164	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t164/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t165	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t165/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t165	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t165/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t165	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t165/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t165	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t165/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t165	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t165/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t165	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t165/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t167	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t167/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t167	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t167/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t167	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t167/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t167	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t167/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t167	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t167/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t167	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t167/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t168	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t168/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t168	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t168/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t168	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t168/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t168	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t168/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t168	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t168/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t168	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t168/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t169	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t169/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t169	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t169/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t169	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t169/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t169	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t169/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t169	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t169/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t169	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t169/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t170	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t170/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t170	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t170/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t170	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t170/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t170	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t170/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t170	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t170/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t170	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t170/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t171	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t171/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t171	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t171/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t171	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t171/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t171	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t171/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t171	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t171/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t171	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t171/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t172	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t172/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t172	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t172/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t172	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t172/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t172	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t172/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t172	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t172/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t172	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t172/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t173	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t173/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t173	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t173/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t173	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t173/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t173	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t173/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t173	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t173/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t173	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t173/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t174	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t174/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t174	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t174/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t174	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t174/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t174	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t174/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t174	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t174/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t174	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t174/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t175	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t175/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t175	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t175/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t175	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t175/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t175	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t175/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t175	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t175/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t175	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t175/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t177	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t177/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t177	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t177/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t177	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t177/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t177	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t177/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t177	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t177/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t177	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t177/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t178	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t178/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t178	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t178/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t178	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t178/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t178	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t178/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t178	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t178/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t178	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t178/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t179	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t179/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t179	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t179/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t179	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t179/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t179	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t179/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t179	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t179/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t179	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t179/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t181	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t181/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t181	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t181/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t181	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t181/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t181	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t181/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t181	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t181/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t181	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t181/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t182	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t182/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t182	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t182/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t182	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t182/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t182	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t182/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t182	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t182/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t182	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t182/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t183	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t183/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t183	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t183/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t183	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t183/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t183	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t183/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t183	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t183/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t183	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t183/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t184	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t184/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t184	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t184/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t184	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t184/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t184	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t184/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t184	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t184/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t184	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t184/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t185	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t185/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t185	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t185/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t185	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t185/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t185	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t185/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t185	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t185/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t185	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t185/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t186	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t186/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t186	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t186/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t186	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t186/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t186	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t186/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t186	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t186/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t186	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t186/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t187	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t187/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t187	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t187/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t187	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t187/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t187	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t187/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t187	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t187/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t187	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t187/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t188	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t188/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t188	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t188/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t188	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t188/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t188	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t188/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t188	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t188/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t188	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t188/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t190	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t190/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t190	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t190/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t190	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t190/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t190	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t190/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t190	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t190/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t190	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t190/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t192	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t192/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t192	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t192/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t192	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t192/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t192	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t192/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t192	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t192/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t192	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t192/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t193	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t193/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t193	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t193/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t193	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t193/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t193	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t193/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t193	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t193/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t193	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t193/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t194	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t194/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t194	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t194/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t194	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t194/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t194	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t194/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t194	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t194/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t194	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t194/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t195	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t195/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t195	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t195/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t195	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t195/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t195	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t195/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t195	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t195/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t195	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t195/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t196	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t196/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t196	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t196/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t196	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t196/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t196	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t196/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t196	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t196/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t196	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t196/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	t197	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t197/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t197	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t197/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t197	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t197/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t197	Bad	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t197/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t197	Bad	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t197/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t197	Bad	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t197/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
  
