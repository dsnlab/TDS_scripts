#!/bin/bash
export PATH=/usr/local/packages/afni/17.1.01/:${PATH} # set path to latest AFNI version

rx_path=/projects/dsnlab/tds/fMRI/analysis/rx/cyb/tds2_N69

declare -a rx_list=("F_2x2_agequad"
"F_2x2_agequadXcontext"
"F_2x2_agequadXthrow"
"F_2x2_ageXcontext"
"F_2x2_ageXthrow"
"F_conj_pmod_flexi"
"F_conj_pmod_flexi_age"
"F_conj_pmod_flexi_agequad"
"F_conj_pmod_flexi_agequadXpmod"
"F_conj_pmod_flexi_ageXpmod") # MUST be in order that corresponds ot means_list

# "F_2x2"
# "F_2x2_age"

declare -a means_list=("0.632917" "4.969117" "10.53273" "0.6316185" "4.958489" "10.53657" "0.6339003" "4.970812" "10.55053" "0.6325339" "4.955162" "10.65608" "0.6333553" "4.979888" "10.58577" "0.6069083" "5.0017" "10.22843" "0.6098346" "4.982031" "10.17603" "0.615881" "4.981043" "10.21146" "0.6145158" "4.974418" "10.32169" "0.6064427" "5.015824" "10.11897") # avg ACF estimates from 3dFWHMX, ordered by model

# "0.631969" "4.975783" "10.43874" "0.6329993" "4.970349" "10.60153"

echo "${rx_list[@]}"
echo "${means_list[@]}"

i=0
for i in "${rx_list[@]}"
	do
	cd $rx_path/$i
	echo $rx_path/$i
	3dClustSim -mask mask.nii -acf ${means_list[@]:$((3*($i-1))):3} > threshlog_${rx_list[$i]}.txt # starting from the 3*(i-1)th position, take three acf values, log it all with the rx folders
done