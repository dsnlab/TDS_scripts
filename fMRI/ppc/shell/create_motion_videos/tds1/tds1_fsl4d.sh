#! /bin/bash
echo here1
########################
## MODIFY THESE LINES ##
declare -a subjects=(
#"301"
"302"
"303"
"304"
"306"
"307"
"310"
"312"
"313"
"314"
"316"
"317"
"320"
"321"
"322"
"323"
"324"
"325"
"326"
"327"
"328"
"329"
"330"
"331"
"332"
"333"
"334"
"335"
"336"
"337"
"341"
) 

#declare -a runs=("cyb2")
declare -a runs=("cyb1" "cyb2" "stop3" "stop4" "stop5" "stop6" "stop7" "stop8" "vid1" "vid2")
basedir="/home/research/tds/fMRI/subjects/tds1"
prefix="_oru" 
suffix="_4d.nii" 
echo $suffix
########################

for p in "${subjects[@]}" ; do
    echo $p  	    
	for arun in "${runs[@]}"; do
		fullDir="$basedir/$p/$arun/"
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
