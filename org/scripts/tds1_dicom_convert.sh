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

## First make sure these directories are right ##
DICOMDIR=$(echo "/raid/data2/scans/dsnlab/TDS/TDS${SUBID}"*)
#DICOMDIR=$(echo "/vxfsvol/home/research/tds/archive/archive/dicoms/${SUBID}"*)
OUTPUTDIR="/vxfsvol/home/research/${STUDYDIR}"
tasks=`cat $OUTPUTDIR/org/scripts/tasks.txt`

## No need to change this part ##
echo -e "\nSetting Up mcverter"
module load mriconvert
echo -e "\nStudy directory is $OUTPUTDIR"
echo -e "\nDicom directory is $DICOMDIR"
########################

## Run the modules present in your study ##
# possible modules =(mprage SVC DRS field rest)

# Converts anatomical and places in sMRI folder #
echo -e "\nConverting anatomical mprage into nifti"
cd $OUTPUTDIR/sMRI/subjects/
mkdir $SUBID
anatomicaloutput="${OUTPUTDIR}/sMRI/subjects/${SUBID}"
mcverter -o $anatomicaloutput/ --format=nifti --nii --match=mprage -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR

# Converts resting state and places in rsfMRI folder #
echo -e "\nConverting resting state into 4D nifti"
cd $OUTPUTDIR/rsfMRI/subjects/
mkdir $SUBID
restingoutput="${OUTPUTDIR}/rsfMRI/subjects/${SUBID}"
mcverter -o $restingoutput/ --format=nifti --nii --fourd --match=rest -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR

# Converts field map and places in fMRI folder #
echo -e "\nConverting field map and placing in resting state folder"
cd $OUTPUTDIR/fMRI/subjects/tds1/
fieldmapoutput="${OUTPUTDIR}/fMRI/subjects/tds1/${SUBID}/fmaps"
mcverter -o $fieldmapoutput/ --format=nifti --nii --split_dir --match=field -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR

# Moves fieldmaps from split_dir directories to fmaps #
cd $fieldmapoutput && mv *fieldmap*/fieldmap*nii ./

# Converts task fMRI and places in fMRI folder assigned to each task #
echo -e "\nConverting task data into niftis"
cd ${OUTPUTDIR}/fMRI/subjects/tds1/
mkdir $SUBID
cd $SUBID
for task in $tasks; do
 mkdir ${task}
 taskoutput="${OUTPUTDIR}/fMRI/subjects/tds1/${SUBID}/${task}"
 mcverter -o $taskoutput/ --format=nifti --nii --match=$task -F -PatientName-PatientId-SeriesDate-SeriesTime-StudyId-StudyDescription-SeriesNumber-SequenceName-ProtocolName+SeriesDescription $DICOMDIR
done

# Copies mprage from sMRI folder to fMRI folder
cd $OUTPUTDIR/fMRI/subjects/tds1/$SUBID && mkdir -p structurals && cp $anatomicaloutput/mprage.nii $OUTPUTDIR/fMRI/subjects/tds1/$SUBID/structurals/mprage*.nii

# Gzips resting state data and structural data #
find $OUTPUTDIR/sMRI/subjects/${SUBID} -name *.nii | xargs gzip
find $OUTPUTDIR/rsfMRI/subjects/${SUBID} -name *.nii | xargs gzip
