#! /bin/bash

# run on 6/8 

echo here1
########################
## MODIFY THESE LINES ##
declare -a subjects=(
"101"
"102"
#"104"
#"105"
#"106"
#"108"
#"109"
#"110"
#"111"
#"113"
#"114"
#"115"
#"116"
#"117"
#"119"
#"120"
#"121"
#"122"
#"124"
#"125"
#"126"
#"127"
#"128"
#"129"
#"130"
#"131"
#"132"
#"133"
#"134"
#"135"
#"136"
#"137"
#"139"
#"140"
#"141"
#"142"
#"144"
#"145"
#"146"
#"150"
#"151"
#"152"
#"155"
#"156"
#"157"
#"159"
#"160"
#"161"
#"162"
#"163"
#"164"
#"165"
#"167"
#"168"
#"169"
#"170"
#"171"
#"172"
#"173"
#"174"
#"175"
#"177"
#"178"
#"179"
#"181"
#"182"
#"183"
#"184"
#"185"
#"186"
#"187"
#"188"
#"189"
#"190"
#"192"
#"193"
#"195"
#"196"
#"197"

) 

#declare -a runs=("cyb2")
declare -a runs=("cyb1" "cyb2" "stop3" "stop4" "stop5" "stop6" "stop7" "stop8" "vid1" "vid2")
basedir="/projects/dsnlab/tds/fMRI/subjects_tds2/"
#funcDir="/ppc/"
prefix="_ru" 
suffix="_4d.nii" 
echo $suffix
########################

for p in "${subjects[@]}" ; do  	    
	for arun in "${runs[@]}"; do
		fullDir="$basedir$p$arun/"
    	if [ -d "$fullDir" ]; then
    		echo "Making movies in $fullDir"
    		cd $fullDir

    		###########################
    		## MODIFY THIS LINE TOO! ##
            ## Specifically *.nii    ##
    		## fsl5.0-fslmerge -t $prefix$arun$suffix oru*.nii
    		fslmerge -t $prefix$arun$suffix ru*.nii
			###########################
    	fi
    done
done
