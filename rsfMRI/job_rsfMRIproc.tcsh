#!/bin/tcsh
#
# This script calls from the variables set in batch_rsfMRIproc.sh
# and uses afni_proc.py to generate a participant-specific resting
# state preprocessing script, which will:
#
#  a) live in the participants' folder
#  b) be named t{SUBID}.proc
#  c) execute automatically.
#

setenv PATH /usr/local/afni_16.1.06:${PATH}

echo $SHELL
echo $SHLVL
echo ${SUBID}

# set data directories
set top_dir=/home/research/tds
echo $top_dir
set anat_dir=$top_dir/sMRI/subjects/freesurfer/"${SUBID}"/SUMA
echo $anat_dir
set epi_dir=$top_dir/rsfMRI/subjects/"${SUBID}"
echo $epi_dir
cd epi_dir

# set subject and group identifiers
set subj="${SUBID}"
echo $subj

# remove previous output
#pushd $epi_dir
#rm proc.t$subj
#rm -r t$subj.results

# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                \
-script proc.$subj -scr_overwrite                          \
-blocks despike tshift align volreg mask regress      \
-copy_anat $anat_dir/"${subj}"_SurfVol.nii                          \
-anat_follower_ROI aaseg anat $anat_dir/aparc.a2009s+aseg_rank.nii   \
-anat_follower_ROI aeseg epi  $anat_dir/aparc.a2009s+aseg_rank.nii   \
-anat_follower_ROI FSvent epi $anat_dir/"${subj}"_vent.nii           \
-anat_follower_ROI FSWe epi $anat_dir/"${subj}"_WM.nii            \
-anat_follower_erode FSvent FSWe                           \
-dsets $epi_dir/resting_bold_mb6_2_5mm_tr780.nii.gz                           \
-tcat_remove_first_trs 13                                  \
-volreg_align_to MIN_OUTLIER                               \
-volreg_align_e2a                                          \
-regress_ROI_PC FSvent 3                                   \
-regress_make_corr_vols aeseg FSvent                       \
-regress_anaticor_fast                                     \
-regress_anaticor_label FSWe                               \
-regress_bandpass 0.01 0.1                                 \
-regress_apply_mot_types demean deriv                      \
-regress_run_clustsim no

tcsh -xef proc.$subj
