export PATH=/usr/local/afni_16.1.06:${PATH}

# set directories
model_dir='/home/research/tds/fMRI/analysis/rx/cyb/events/concat_wWait' #rx model directory
subj_dir='/home/research/tds/fMRI/subjects' #subjects directory
con_dir=(fx/cyb/events_concat_wWait) #fx directory
parc_dir='/home/research/tds/templates' #parcellation atlas directory 
aparc_output='/home/research/tds/fMRI/analysis/parcellations/cyb' #parcellation output directory
rx_output=(groupLevel) #sub-directory in $aparc_output
fx_output=(subjectLevel) #sub-directory in $aparc_output

# set variables
parc=(craddock_all.nii.gz) #parcellation atlas file
parc_map=(25) #parcellation map number (if applicable)
aparc=(aligned_craddock) #aligned parcellation map name
aparc_num=(168 80 62 172 222 26 98 145) #parcellation numbers to extract from; use $(seq 1 N) where N is the total number of parcels to extract from all
subj=(t113
t114
t115
t116
t117
t119
t121
t125
t126
t127
t128
t129
t130
t131
t132
t133
t134
t135
t136
t137
t139
t140
t141
t142
t144
t145
t146
t150
t151
t152
t155
t156
t157
t158
t159
t160
t161
t162
t163
t164
t165
t167
t168
t169
t170
t171
t172
t173
t174
t175
t177
t179
t181
t182
t183
t184
t185
t186
t187
t188
t189
t190
t192
t193
t196) #subjects
rx_conName1=(incPmodVwait) #name of rx constrast for output files
rx_con1=(con_0001.nii) #rx inc_P>wait con file to extract from
rx_conName2=(excPmodVwait) #name of rx constrast for output files
rx_con2=(con_0002.nii) #rx inc_P>wait con file to extract from
fx_con=(con_0011 con_0013) #fx con files to extract from

# align parcellation map to data
echo "aligning parcellation map"
if [ -f $parc_dir/${aparc}+tlrc.BRIK ]
	then
	echo "aligned parcellation map already exists"
else 
3dAllineate -source $parc_dir/$parc[$parc_map] -master $model_dir/$rx_con1 -final NN -1Dparam_apply '1D: 12@0'\' -prefix $parc_dir/$aparc
fi


# loop through parcellations and extract from group-level rx_cons
echo "extracting from rx cons"
for num in ${aparc_num[@]}
do
	echo $num
	3dmaskave -sigma -quiet -mrange $num $num -mask $parc_dir/${aparc}+tlrc $model_dir/$rx_con1 > $aparc_output/$rx_output/${rx_conName1}_${num}.txt
	3dmaskave -sigma -quiet -mrange $num $num -mask $parc_dir/${aparc}+tlrc $model_dir/$rx_con2 > $aparc_output/$rx_output/${rx_conName2}_${num}.txt
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
