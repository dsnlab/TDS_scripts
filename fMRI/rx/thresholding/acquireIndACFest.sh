#!/bin/bash

# Acquire individual level acf estimates
# Authors: Theresa W. Cheng, Nandita Vijayakumar
# Date created; 11/21/2016; Last modified: 6/16/2017
# This script should be run after writing residuals from second level models in SPM, and before running "AvgIndACFest.R"

rx_path=/projects/dsnlab/tds/fMRI/analysis/rx

export PATH=/usr/local/afni_16.1.06:${PATH} # set path to latest AFNI version
cd ${rx_path}/ylg/alone/tds2_n79/regr/cov_puberty/9-bad_go-stop #rx directory w/ residuals

# estimate acf parameters for per subject and save this output to a log file
for i in Res_* 
	do 
	j=${i:0:8}
	3dFWHMx -acf -mask mask.nii $i >> log_$j.txt
done
