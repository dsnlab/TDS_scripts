#!/bin/bash
#export PATH=/usr/local/packages/afni/17.1.01/:${PATH} # set path to latest AFNI version
module load afni

rx_path=/projects/dsnlab/shared/tds/fMRI/analysis/rx/cyb/group_comp

declare -a rx_list=(
	"flexi_2x2x2_demo"
	"flexi_pmod_demo"
	) # MUST be in order that corresponds ot means_list

declare -a means_list=("0.6324164" "4.917155" "10.79975" "0.6026691" "4.975973" "11.28673") # avg ACF estimates from 3dFWHMX, ordered by model

echo "${rx_list[@]}"
echo "${means_list[@]}"

for i in {0..3};
	do
	cd $rx_path/${rx_list[i]}
	3dClustSim -mask mask.nii -acf ${means_list[@]:$((3*($i))):3} > threshlog_${rx_list[i]}.txt # starting from the 3*(i-1)th position, take three acf values, log it all with the rx folders
	echo "----"
done
