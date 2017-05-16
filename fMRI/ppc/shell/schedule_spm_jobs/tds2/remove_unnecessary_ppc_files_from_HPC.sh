# This script allows for the removal of unnecessary ppc files from HPC.
#
# By Zdena Op de Macks, 5/16/2017
###########################################
# Set directory
SOURCE_DIR=/projects/dsnlab/tds/fMRI/subjects_tds2

# Set lists
SUBJECT_LIST=`cat subject_list_all.txt`
TASK_LIST=`cat task_list.txt`

# Remove files from HPC
for SUB in $SUBJECT_LIST
do
	echo "Removing files for $SUB"
	for TASK in $TASK_LIST
	do
		echo "Removing unnecessary ppc files from $TASK"
		rm $SOURCE_DIR/$SUB/${TASK}/ru*
		rm $SOURCE_DIR/$SUB/${TASK}/u*
		rm $SOURCE_DIR/$SUB/${TASK}/wfmag*
		rm $SOURCE_DIR/$SUB/${TASK}/mean*
		rm $SOURCE_DIR/$SUB/${TASK}/"${TASK}"*
	done
	echo "Files removed for $SUB"
	echo "----------------------"
done