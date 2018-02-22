#!/bin/bash
#--------------------------------------------------------------
# Inputs:
#	* STUDY = study name
#	* SUBJLIST = defaced_subject_list.txt
#	* REPLACESID = initial subject
#
# Outputs:
#	* Removed identified mprages
#
# T Cheng 2018.1.23 | Run locally
#--------------------------------------------------------------

# Set your study directory; currently where MPRAGEs are temp stored for defacing
STUDY=/Volumes/TDS/nonbids_data/sMRI

# Set subject list
SUBJLIST=`cat deface_subject_list.txt`

for SUB in $SUBJLIST
	do 
		#cd ${STUDY}/subjects_defaced/${SUB}
		#rm mprage.nii
		#echo "removed identified info"
		#rsync -aiv ${STUDY}/subjects/${SUB}/mprage_info.txt ${STUDY}/subjects_defaced/${SUB}/
		#echo "rsync info.txt"
		gzip ${STUDY}/subjects_defaced/${SUB}/mprage_defaced.nii
		echo "gzipped $SUB"
	done