#!/bin/bash
#
# This script uses the lovely mcverter tool 
# to convert dicoms to niftis. First, you'll
# need to make sure the sequences and directory
# names are correct. Run this script
# by running the batch_dicom_convert.sh file
# and calling on subject_list.txt
# Be sure to write your task names in tasks.txt
#

WITHIN_DICOM_PATH=$1
SUBID_DICOM=$2
SUBID=$3

## First make sure these directories are right ##
DICOMDIR=$(echo "/Users/ralph/Documents/${WITHIN_DICOM_PATH}/${SUBID_DICOM}")
OUTPUTDIR="/Users/ralph/Documents/tds"
tasks=`cat /Users/ralph/Documents/tds/tds_repo/org/scripts/tasks.txt`

## No need to change this part ##
echo -e "\nConverting ${SUBID}"
echo -e "\nSetting Up mcverter"
#module load mriconvert
echo -e "\nStudy directory is $OUTPUTDIR"
echo -e "\nDicom directory is $DICOMDIR"
########################

## Run the modules present in your study ##
# possible modules =(mprage SVC DRS field Resting)

# Converts anatomical and places in sMRI folder #
echo -e "\nConverting anatomical mprage into nifti"
mkdir -pv $OUTPUTDIR/sMRI/subjects/
cd $OUTPUTDIR/sMRI/subjects/
mkdir -pv ${SUBID}
anatomicaloutput="${OUTPUTDIR}/sMRI/subjects/${SUBID}"
echo -e "sMRI dir: ${anatomicaloutput}"
mcverter -o $anatomicaloutput/ --format=nifti --nii --match=mprage -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR

# Converts resting state and places in rsfMRI folder #
echo -e "\nConverting resting state into 4D nifti"
mkdir -pv $OUTPUTDIR/rsfMRI/subjects/
cd $OUTPUTDIR/rsfMRI/subjects/
mkdir -pv $SUBID
restingoutput="${OUTPUTDIR}/rsfMRI/subjects/${SUBID}"
echo -e "rsfMRI dir: ${restingoutput}"
mcverter -o $restingoutput/ --format=nifti --nii --fourd --match=rest -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR

# Converts field map and places in fMRI folder #
mkdir -pv $OUTPUTDIR/fMRI/subjects/
echo -e "\nConverting field map and placing in fMRI folder"
cd $OUTPUTDIR/fMRI/subjects/
fieldmapoutput="${OUTPUTDIR}/fMRI/subjects/${SUBID}/fmaps"
echo -e "fm dir: ${fieldmapoutput}"
mcverter -o $fieldmapoutput/ --format=nifti --nii --split_dir --match=field -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR

# Moves fieldmaps from split_dir directories to fmaps
cd $fieldmapoutput && mv *fieldmap*/fieldmap*nii ./

# Converts task fMRI and places in fMRI folder assigned to each task #
echo -e "\nConverting task data into niftis"
mkdir -pv ${OUTPUTDIR}/fMRI/subjects/${SUBID}/
cd ${OUTPUTDIR}/fMRI/subjects/${SUBID}/
for task in $tasks; do
 mkdir ${task}
 taskoutput="${OUTPUTDIR}/fMRI/subjects/${SUBID}/${task}"
 echo -e "fMRI task dir: ${taskoutput}"
 mcverter -o $taskoutput/ --format=nifti --nii --split_dir --match=$task -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR
done

# Copies mprage from sMRI folder to fMRI folder
cd ${OUTPUTDIR}/fMRI/subjects/${SUBID} && mkdir -p structurals && cp ${anatomicaloutput}/mprage* $OUTPUTDIR/fMRI/subjects/$SUBID/structurals/
