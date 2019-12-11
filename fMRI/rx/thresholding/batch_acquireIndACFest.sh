#!/bin/bash

module load afni
#export PATH=/usr/local/packages/afni/17.1.01/:${PATH} # set path to latest AFNI version

rx_path=/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/rx/cyb/tds2_quad_N69 

declare -a rx_list=("F_conj_pmod_flexi_excQuad")

echo "${rx_list[@]}"

for i in "${rx_list[@]}"
  do
    cd $rx_path/$i
    for k in Res_*  # estimate acf parameters for per subject and save this output to a log file
      do 
        j=${k:0:8}
        3dFWHMx -acf -mask mask.nii $k >> log_$j.txt
      done
done
