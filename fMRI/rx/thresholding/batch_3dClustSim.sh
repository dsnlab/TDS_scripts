#!/bin/bash
export PATH=/usr/local/packages/afni/17.1.01/:${PATH} # set path to latest AFNI version

rx_path=/projects/dsnlab/tds/fMRI/analysis/rx/cyb/tds2_N69

declare -a rx_list=("F_2x2"
"F_2x2_age")

#"F_2x2_ageXcontext"
#"F_2x2_agequad"
#"F_2x2_ageXthrow"
#"F_2x2_agequadXcontext"
#"F_2x2_agequadXthrow"
#"F_conj_pmod_flexi"
#"F_conj_pmod_flexi_age"
#"F_conj_pmod_flexi_ageXpmod"
#"F_conj_pmod_flexi_agequad"
#"F_conj_pmod_flexi_agequadXpmod")

#batch_indACFest_summary.csv 

declare -a means_list= indACFest_ordered means.txt
echo "${means_list[@]}"

echo "${rx_list[@]}"

i=1
for i in "${rx_list[@]}"
	do 
	3dClustSim -mask mask.nii -acf .6327062 3.594482 8.192876 >> log_${rx_list[@]}.txt
done