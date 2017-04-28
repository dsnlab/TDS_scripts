export PATH=/usr/local/afni_16.1.06:${PATH}

# set directories
model_dir='/vxfsvol/home/research/dsnlab/Studies/FP/rx/standard/FlexFactorial' #rx model directory
subj_dir='/vxfsvol/home/research/dsnlab/Studies/FP/subjects' #subjects directory
con_dir=(fx/fx_standard) #fx directory
parc_dir='/vxfsvol/home/research/dsnlab/Studies/FP/templates' #parcellation atlas directory 
aparc_output='/vxfsvol/home/research/dsnlab/Studies/FP/rx/parcellations' #parcellation output directory
rx_output=(groupLevel) #sub-directory in $aparc_output
fx_output=(subjectLevel) #sub-directory in $aparc_output

# set variables
parc=(craddock_all.nii.gz) #parcellation atlas file
parc_map=(19) #parcellation map number (if applicable)
aparc=(aligned_craddock) #aligned parcellation map name
aparc_num=(105 109 11 113 116 122 13 14 146 149 151 161 178 183 188 190 191 192 20 200 27 31 34 42 47 51 52 57 58 59 62 66 77 78 8 89 90 92 97 98) #parcellation numbers to extract from; use $(seq 1 N) where N is the total number of parcels to extract from all
subj=(FP001 FP002 FP003 FP004 FP005 FP006 FP007 FP008 FP009 FP010 FP011 FP012 FP013 FP014 FP015 FP016 FP018 FP019 FP020 FP021 FP022 FP023 FP024 FP025 FP026 FP027 FP028 FP029 FP032 FP035) #subjects
rx_conName=(regLook) #name of rx constrast for output files
rx_con=(con_0004.nii) #rx con file to extract from
fx_con=(con_0001 con_0002 con_0003 con_0004) #fx con files to extract from


# align parcellation map to data
echo "aligning parcellation map"
if [ -f $parc_dir/${aparc}+tlrc.BRIK ]
	then
	echo "aligned parcellation map already exists"
else 
3dAllineate -source $parc_dir/$parc[$parc_map] -master $model_dir/$rx_con -final NN -1Dparam_apply '1D: 12@0'\' -prefix $parc_dir/$aparc
fi


# loop through parcellations and extract from group-level rx_cons
echo "extracting from rx cons"
for num in ${aparc_num[@]}
do
	echo $num
	3dmaskave -sigma -quiet -mrange $num $num -mask $parc_dir/${aparc}+tlrc $model_dir/$rx_con > $aparc_output/$rx_output/${rx_conName}_${num}.txt
done


# loop through parcellations and extract from subject-level cons
echo "extracting from fx cons"
for sub in ${subj[@]}
do
	echo $sub
	for con in ${fx_con[@]}
	do
		echo $con
		for num in ${aparc_num[@]}
		do
			echo $num
			3dmaskave -sigma -quiet -mrange $num $num -mask $parc_dir/${aparc}+tlrc $subj_dir/$sub/$con_dir/${con}.nii > $aparc_output/$fx_output/${num}_${sub}_${con}.txt
		done
	done
	
done
