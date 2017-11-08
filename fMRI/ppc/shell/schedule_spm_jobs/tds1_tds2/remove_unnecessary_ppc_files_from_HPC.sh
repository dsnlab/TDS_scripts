# This script allows for the removal of unnecessary ppc files from HPC.
#
# By Zdena Op de Macks, 5/16/2017
###########################################
# Set directory
SOURCE_DIR=/projects/dsnlab/shared/tds/fMRI/subjects_tds1_tds2/

# Set lists
SUBJECT_LIST=`cat subject_list_remove.txt`
TASK_LIST=`cat task_list.txt`

# Remove files from HPC
for SUB in $SUBJECT_LIST
do
	echo "Removing files for $SUB"
	for TASK in $TASK_LIST
	do
		echo "Removing unnecessary ppc files from $TASK"
		rm $SOURCE_DIR/$SUB/${TASK}/sw*
	done
	
	echo "Removing unncessary ppc files from struc"
	rm -r $SOURCE_DIR/$SUB/structurals/norm*
	#rm $SOURCE_DIR/$SUB/structurals/u_rc1mprage*
	
	echo "Files removed for $SUB"
	echo "----------------------"
done
