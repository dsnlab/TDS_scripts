#!/bin/bash
#--------------------------------------------------------------
# This script:
#	* Merges residuals for each run separately
#	* Calculates ACF parameters for each run separately
#	* Averages ACF parameters and saves in ACFparameters_average.1D
#
# D.Cos 2018.11.06
#--------------------------------------------------------------

# merge residual files
echo -------------------------------------------------------------------------------
echo "${SUB}"
echo "Merging residuals"
echo -------------------------------------------------------------------------------

fx_dir=/projects/dsnlab/shared/tds/fMRI/analysis/fx/models/ylg/fx_ylg_allconds_nonorth_nopmod/${SUB}
sub_dir=/projects/dsnlab/shared/tds/fMRI/subjects_tdsall/${SUB}
# N runs for residual calculation
#RUNS=(6)
STOP=(stop3 stop4 stop5 stop6 stop7 stop8)
# Make text file with residual files for each run
for i in "${STOP[@]}"; do 
	cd $sub_dir/$i
	num=$(ls -l | grep -v ${i}_0*  | wc -l)
	touch $fx_dir/residuals_${i}.txt 
	for j in $(seq 1 $num); do 
		printf "Res_%04d.nii\n" $j >> $fx_dir/residuals_${i}.txt 
	done
	#echo $(printf "Res_%04d.nii\n" {1..$(num)}) > $fx_dir/residuals_${i}.txt
done

#echo $(printf "Res_%04d.nii\n" {226..450}) > residuals_run2.txt

module load fsl
#script_dir=$(pwd)
#RUNS=$(ls residuals*.txt | wc -l)

cd ${fx_dir}

for i in "${STOP[@]}"; do
	echo "merging residuals for ${i}"
	residual_files=`cat ${fx_dir}/residuals_${i}.txt`
	fslmerge -t residuals_${i} ${residual_files}
	#rm ${residual_files}
done

# run 3dFWHMx
echo -------------------------------------------------------------------------------
echo "Calculating ACF parameters"
echo -------------------------------------------------------------------------------

module load afni

for i in "${STOP[@]}"; do
	echo "calculating ACF parameters for ${i}"
	3dFWHMx -acf -mask mask.nii residuals_${i}.nii.gz >> ACFparameters.1D
done

# average ACF parameters
echo -------------------------------------------------------------------------------
echo "Averaging ACF parameters"
echo -------------------------------------------------------------------------------
3dTstat -mean -prefix - ACFparameters.1D'{1..$(2)}'\' >> ACFparameters_average.1D