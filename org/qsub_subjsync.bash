#!/bin/bash
old_dir=/home/research/tds/subjects_G80
new_dir=/home/research/tds/tds_reorg/fMRI/subjects
subjects=`ls -d "$old_dir"/t*`
log_dir=/home/research/tds/tds_reorg/org/scripts/output.fmrisubs/
name=tdssubjsync

echo All files below will be synchronized to
echo New directory = "$new_dir"
echo "$subjects"

for subject in $subjects
do
	sid=`basename $subject`
	qsub -v sid=${sid},old_dir=${old_dir},new_dir=${new_dir} -N "$name" -o "$log_dir$sid"_output.txt -e "$log_dir$sid"_error.txt synchronize_fMRI_subjects.bash
done

