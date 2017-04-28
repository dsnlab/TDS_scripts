#!/bin/bash


cd /home/research/tds/fMRI/analysis/rx/ylg 
module add R/3.3.1-shlib-tcltk
export PATH=/usr/local/afni_16.1.06:${PATH}
3dLME -prefix OutcomesXContextTDS2 -jobs 8 \
	-model  "Outcome*Context" \
	-ranEff '~1' \
	-SS_type 3 \
	#-qVars "age_c" \
	#-qVarCenters "0" \
	-num_glt 4 \
	-glfLabel 1 'tds2_outByContext' -glfCode 1 'Context : 1*AL -1*PR & 1*AL -1*SE Outcome : 1*good -1*bad Group : 1*control :' \
	-gltLabel 2 'OG-OB_AL-SE' -gltCode  4 'Outcome : 1*OG -1*OB :1*AL -1*SE : ' \
	-gltLabel 3 'OG-OB_AL-PR' -gltCode  4 'Outcome : 1*OG -1*OB :1*AL -1*PR : ' \
	-gltLabel 4 'OG-OB_PR-SE' -gltCode  4 'Outcome : 1*OG -1*OB :1*PR -1*SE : ' \
	-mask /home/research/tds/fMRI/analysis/masks/G80/G80_gw_smoothed_group_average_optthr.nii \
	-dataTable  

	-dataTable  
	Subj	Outcome	Context Group InputFile \
	t109	Good	AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0005.nii \
	t109	Good	PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0015.nii \
	t109	Good	SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0025.nii \
	t109	Bad		AL	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0008.nii \
	t109	Bad		PR	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0018.nii \
	t109	Bad		SE	control	/vxfsvol/home/research/tds/fMRI/subjects/t109/fx/fx_ylg_allconds_nonorth/con_0028.nii \
	
  