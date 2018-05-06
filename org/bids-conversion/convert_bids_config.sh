#!/bin/bash

# This script is the configuration file for convert_bids_template.sh
# It should be in the same directory as convert_bids_template.sh
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
cpflags="-n -v"
fieldmapEPI="FALSE"
declare -a anat="mprage"
declare -a fmap="fieldmap"
#declare -a resting=("resting_bold_mb6_2.5mm_tr780")
declare -a tasks=("cyb1" "cyb2" "stop3" "stop4" "stop5" "stop6" "stop7" "stop8" "vid1" "vid2")

# Set which sequences to convert
convertanat="TRUE"
convertfmap="TRUE"
#convertrest="FALSE"
converttask="TRUE"

# Set error log file
errorlog="$scriptsdir/errorlog_convertBIDS.txt"
