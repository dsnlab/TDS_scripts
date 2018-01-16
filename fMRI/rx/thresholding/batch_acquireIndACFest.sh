#!/bin/bash

module load afni
#export PATH=/usr/local/packages/afni/17.1.01/:${PATH} # set path to latest AFNI version

rx_path=/projects/dsnlab/shared/tds/fMRI/analysis/rx/cyb/group_comp

declare -a rx_list=("flexi_pmod_demo" "flexi_2x2x2_demo")

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
