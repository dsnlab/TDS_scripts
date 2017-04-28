#! /bin/bash
echo here1
########################
## MODIFY THESE LINES ##
declare -a subjects=(
#”t101"
#"t102"
#"t104"
#"t105"
#"t106"
#"t108"
#"t109"
"t110"
"t111"
#"t113"
#"t114"
#"t115"
#"t116"
#"t117"
#"t119"
#"t120"
#"t121"
#"t122"
#"t124"
#"t125"
#"t126"
#"t127"
#"t128"
#"t129"
#"t130"
#"t131"
#"t132"
#"t133"
#"t134"
#"t135"
#"t136"
#"t137"
#"t139"
#"t140"
#"t141"
#"t142"
#"t144"
#"t145"
#"t146"
#"t150"
#"t151"
#"t152"
#"t155"
#"t156"
#"t157"
#"t158"
#"t159"
#"t160"
#"t161"
#"t162"
#"t163"
#"t164"
#"t165"
#"t167"
#"t168"
#"t169"
#"t170"
#"t171"
#"t172"
#"t173"
"t174"
#"t175"
#"t177"
#”t178"
#"t179"
#"t181"
#"t182"
#"t183"
#"t184"
#"t185"
#"t186"
#"t187"
#"t188"
#"t189"
#"t192"
#"t193"
#"t194"
#"t195"
#"t196"
#"t197"

) 

#declare -a runs=("cyb2")
declare -a runs=("cyb1" "cyb2" "stop3" "stop4" "stop5" "stop6" "stop7" "stop8" "vid1" "vid2")
basedir="/home/research/tds/fMRI/subjects/"
funcDir="/ppc/"
prefix="_oru" 
suffix="_4d.nii" 
echo $suffix
########################

for p in "${subjects[@]}" ; do  	    
	for arun in "${runs[@]}"; do
		fullDir="$basedir$p$funcDir$arun/"
    	if [ -d "$fullDir" ]; then
    		echo "Making movies in $fullDir"
    		cd $fullDir

    		###########################
    		## MODIFY THIS LINE TOO! ##
            ## Specifically *.nii    ##
    		## fsl5.0-fslmerge -t $prefix$arun$suffix oru*.nii
    		fslmerge -t $prefix$arun$suffix oru*.nii
			###########################
    	fi
    done
done
