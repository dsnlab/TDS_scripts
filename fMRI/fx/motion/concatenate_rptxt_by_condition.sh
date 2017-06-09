#!/bin/bash

#################################################################
### use the parameter file as an argument for the script      ###
### (e.g. sh tds_merge_rptxts.sh tds_merge_rptxts_config.txt) ###
#################################################################

# This script merges the rp.txt files for separate runs (stop3, stop4, etc.) into single txt files for each condition (alone, peer, excl) 

prmfile=./$1
echo "parameters file = $prmfile"

if [ -f $prmfile ]
  then
  source $prmfile # set all vars in params file
  echo "sourceFolder = $sourceFolder"
  echo "subs are ${subs[@]}"
  if [ -d $sourceFolder ]
    then
    cd $sourceFolder #go into folder where rp.txt files are located
    pwd
    echo "1. I'm in the $sourceFolder folder for $studyName"
    for i in ${subs[@]}   # For each subj, merge the rp.txt files from each run into one rp.txt file for each condition. 
      do  
      cp "rp_${i}_stop3.txt" "rp_${i}_alone.txt"
      cat "rp_${i}_stop4.txt" >> "rp_${i}_alone.txt"
      cp "rp_${i}_stop5.txt" "rp_${i}_peer.txt"
      cat "rp_${i}_stop6.txt" >> "rp_${i}_peer.txt"
      cp "rp_${i}_stop7.txt" "rp_${i}_excl.txt"
      cat "rp_${i}_stop8.txt" >> "rp_${i}_excl.txt"
    done
  fi
fi
