#!/bin/bash

# This script is the configuration file for createJson.sh
# It should be in the same directory as createJson.sh
# 
# Sequence variables are based on the sequence protocol names

# Set study name
study="tds"
scripts="TDS_scripts"

# Set directory names
nonbidsdir="/projects/dsnlab/shared/"$study"/nonbids_data"
bidsdir="/projects/dsnlab/shared/"$study"/bids_data"
scriptsdir="/projects/dsnlab/shared/"$study"/"$scripts"/org/bids-conversion"

# Set study info
declare -a anat="mprage_p2"
declare -a fmap="fieldmap_2mm"
#declare -a resting=("Resting_1" "Resting_2")
declare -a tasks=("cyb1" "cyb2" "stop3" "stop4" "stop5" "stop6" "stop7" "stop8
" "vid1" "vid2")

#Set phase encoding direction for fmap and task
#1a = A-P
#1b = P-A
#2a = I-S 
#2b = S-I
#3a = R-L 
#3b = L-R

PhaseEncoding_task=1a

# Set which sequences to create Json
convertanat="TRUE"
convertfmap="TRUE"
#convertrest="FALSE"
converttask="TRUE"

# Set log files of new Json files and errors
newlog="${scriptsdir}"/new_Json.txt #lists subject-specific functional and anatomical json files that are created.
errorlog="${scriptsdir}"/errorlog_Json.txt #lists when subjects were not checked by scan (i.e., missing files or wrong number of files)
