#!/bin/bash
export PATH= /Users/blinky/abin/afni_16.1.06:${PATH} # set path to latest AFNI version

rx_path=/Volumes/TDS/nonbids_data/derivatives/fMRI/rx/cyb/tds2_N69

declare -a rx_list=("F_2x2" 
"F_2x2_age" 
)

#"F_2x2_ageXthrow" 
#"F_2x2_ageXcontext" 
#"F_2x2_agequad" 
#"F_2x2_agequadXcontext" 
#"F_2x2_agequadXthrow" 
#"F_conj_pmod_flexi" 
#"F_conj_pmod_flexi_age" 
#"F_conj_pmod_flexi_ageXpmod" 
#"F_conj_pmod_flexi_agequad" 
#"F_conj_pmod_flexi_agequadXpmod"

echo "${rx_list[@]}"

i=1
for i in "${rx_list[@]}"
  do
    cd $rx_path/$i
    for i in Res_*  # estimate acf parameters for per subject and save this output to a log file
      do 
        j=${i:0:8}
        3dFWHMx -acf -mask mask.nii $i >> log_$j.txt
      done
done
