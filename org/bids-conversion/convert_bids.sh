#!/bin/bash

# This script will convert dicoms, create the BIDS files structure,
# and move and rename converted files to BIDS specification
#
# It will also check the number of files and print errors to the error log
#
# Dependencies:
# * edited convert_bids_config.sh
# * $subid from batch_convert_bids.sh

# Load mcverter and other software
module load MRIConvert 
module load python3
module load dcmtk
module load fsl

# Load variables
source convert_bids_config.sh
echo "${subid}"_"${sessid}"

# Create error log file
touch "${errorlog}"

# Check directory dependencies
if [ ! -d "${bidsdir}" ]; then
	mkdir -v "${bidsdir}"
fi

if [ ! -d "${bidsdir}"/derivatives ]; then
	mkdir -v "${bidsdir}"/derivatives
fi

# Run python script to extract Multiband Acceleration Factor
#echo -e "\nCreating text file with additionl acquisition info"
#python $scriptsdir/extract_dicom_fields.py "$dicomdir" "$niidir"/"${subid}"/"${sessid}"/"${subid}"_"${sessid}"_multiband_accel.txt PatientName StudyDate SeriesNumber SeriesDescription ImageComments -a -n

# Copy group meta-data to bids directory
rsync -aiv $scriptsdir/meta_data/ $bidsdir/

# Create bids directory structure for one subject
echo -e "\nCreating BIDS directory stucture..."
mkdir -pv "$bidsdir"/sub-"${subid}"/ses-"${sessid}"
cd "$bidsdir"/sub-"${subid}"/ses-"${sessid}"
if [ "${convertanat}" == "TRUE" ]; then mkdir -pv anat; fi
if [ "${convertfmap}" == "TRUE" ]; then mkdir -pv fmap; fi
if [ "${converttask}" == "TRUE" ]; then mkdir -pv func; fi

# Copy and rename files to BIDS structure
# structural (mprage)
if [ "${convertanat}" == "TRUE" ]; then
	echo -e "\nCopying structural"
	if [ $(ls "${nonbidsdir}"/sMRI/subjects/"${subid}"/mprage.nii | wc -l) -eq 1 ]; then
		anat="${nonbidsdir}"/sMRI/subjects/"${subid}"/mprage.nii
		gzip "${anat}"
		mv "${anat}".gz "$bidsdir"/sub-"${subid}"/ses-"${sessid}"/anat/sub-"${subid}"_ses-"${sessid}"_T1w.nii.gz
	elif [ $(ls "${nonbidsdir}"/sMRI/subjects/"${subid}"/mprage.nii | wc -l) -eq 0 ]; then
		# print missing file paths in errorlog.txt if = 0 files
		echo "ERROR: no files; nothing to copy"
		echo "${subid}": MISSING mprage >> $errorlog
	else 
		# print file paths in errorlog.txt if =~ 1 file; copy both files
		echo "ERROR: wrong number of files; all files copied"
		ls "${nonbidsdir}"/sMRI/subjects/"${subid}"/ >> $errorlog
	fi	
fi

# fieldmaps
if [ "${convertfmap}" == "TRUE" ]; then
	echo -e "\nCopying fieldmaps"

	# print missing file paths in errorlog.txt if = 3 files
	if [ $(ls "${nonbidsdir}"/fMRI/subjects/"${subid}"/fmaps/fieldmap* | wc -l) -eq 3 ]; then
		phase=$(ls -f "${nonbidsdir}"/fMRI/subjects/"${subid}"/fmaps/fieldmap.nii)
		mag1=$(ls -f "${nonbidsdir}"/fMRI/subjects/"${subid}"/fmaps/fieldmap_01.nii)
		mag2=$(ls -f "${nonbidsdir}"/fMRI/subjects/"${subid}"/fmaps/fieldmap_02.nii)
		gzip "${phase}"
		gzip "${mag1}"
		gzip "${mag2}"

		mv "${phase}".gz "$bidsdir"/sub-"${subid}"/ses-"${sessid}"/fmap/sub-"${subid}"_ses-"${sessid}"_phasediff.nii.gz 
		mv "${mag1}".gz "$bidsdir"/sub-"${subid}"/ses-"${sessid}"/fmap/sub-"${subid}"_ses-"${sessid}"_magnitude1.nii.gz
		mv "${mag2}".gz "$bidsdir"/sub-"${subid}"/ses-"${sessid}"/fmap/sub-"${subid}"_ses-"${sessid}"_magnitude2.nii.gz		

	# print file paths in errorlog.txt if =~ 3 files
	elif [ $(ls "${nonbidsdir}"/fMRI/subjects/"${subid}"/fmaps/fieldmap* | wc -l) -ne 3 ]; then
		echo "ERROR: wrong number of files"
		ls "${nonbidsdir}"/fMRI/subjects/"${subid}"/fmaps/ >> $errorlog
	fi
fi

# fMRI task data
if [ "${converttask}" == "TRUE" ]; then
 	echo -e "\nCopying task fMRI"
	for task in ${tasks[@]}; do 
		runnum="$(echo "${task}" | sed 's/[^0-9]//g')"
		taskalpha="$(echo "${task}" | sed 's/[^a-zA-Z]//g')"
		taskdir="${nonbidsdir}"/fMRI/subjects/"${subid}"/"${task}"
		
		if [ $(ls "${taskdir}"/"${task}"*.nii | wc -l) >0 ]; then
			fslmerge -t "${taskdir}"/"${task}" "${taskdir}"/"${task}"*.nii
			mv "${taskdir}"/"${task}".nii.gz "$bidsdir"/sub-"${subid}"/ses-"${sessid}"/func/sub-"${subid}"_ses-"${sessid}"_task-"${taskalpha}"_run-0"${runnum}"_bold.nii.gz 

		else [ $(ls "${taskdir}"/"${task}"*.nii | wc -l) -eq 0 ]; 
			# print missing file paths in errorlog.txt if = 0 files
			echo "ERROR: no "${task}" files; nothing to copy"
			echo "${subid}": MISSING "${task}" >> $errorlog
		fi
	done
fi

echo -e "\nCOMPLETED"
