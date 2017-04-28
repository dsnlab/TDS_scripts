#!/bin/bash
#
echo "job_cleanupmess.sh ran on $(date) $line"

echo -e "\nSetting Up Freesurfer5.3"

source /home/research/tds/sMRI/scripts/SetUpFreeSurfer.sh

echo -e "\nSetting up AFNI"

export PATH="/usr/local/afni_16.1.06:${PATH}"

templatedir="/home/research/tds/sMRI/templates/"
rsfMRIdir="/home/research/tds/rsfMRI/subjects/"

echo -e "\nFreesurfer Home is $FREESURFER_HOME"
echo -e "\nFreeSurfer Output Directory is $SUBJECTS_DIR"
echo -e "\nTemplate Directory is $templatedir"
echo -e "\nResting State Output Directory is $rsfMRIdir"

cd $rsfMRIdir/$SUBID/$SUBID.results/

chmod 775 *

mkdir output

mv all_runs."${SUBID}"+orig.BRIK all_runs."${SUBID}"+orig.HEAD bandpass_rall.1D bpass.r01.1D bpass.r02.1D copy_af_aaseg+orig.BRIK copy_af_aaseg+orig.HEAD copy_af_aeseg+orig.BRIK copy_af_aeseg+orig.HEAD copy_af_FSvent_erode+orig.BRIK copy_af_FSvent_erode+orig.HEAD copy_af_FSvent+orig.BRIK copy_af_FSvent+orig.HEAD copy_af_FSWe_erode+orig.BRIK copy_af_FSWe_erode+orig.HEAD copy_af_FSWe+orig.BRIK copy_af_FSWe+orig.HEAD corr_af_aeseg+orig.BRIK corr_af_aeseg+orig.HEAD corr_af_FSvent+orig.BRIK corr_af_FSvent+orig.HEAD corr_brain+orig.BRIK corr_brain+orig.HEAD dfile.r01.1D dfile.r02.1D @epi_review."${SUBID}" errts."${SUBID}".tproject+orig.BRIK errts."${SUBID}".tproject+orig.HEAD follow_ROI_aeseg+orig.BRIK follow_ROI_aeseg+orig.HEAD follow_ROI_FSvent+orig.BRIK follow_ROI_FSvent+orig.HEAD follow_ROI_FSWe+orig.BRIK follow_ROI_FSWe+orig.HEAD full_mask."${SUBID}"+orig.BRIK full_mask."${SUBID}"+orig.HEAD gmean.errts.unit.1D Local_FSWe_rall+orig.BRIK Local_FSWe_rall+orig.HEAD mask_anat."${SUBID}"+orig.BRIK mask_anat."${SUBID}"+orig.HEAD mask_epi_extents+orig.BRIK mask_epi_extents+orig.HEAD mat.r01.vr.aff12.1D mat.r01.warp.aff12.1D mat.r02.vr.aff12.1D mat.r02.warp.aff12.1D mean.unit.aeseg.1D mean.unit.FSvent.1D min_outlier_volume+orig.BRIK min_outlier_volume+orig.HEAD out.cormat_warn.txt outcount.r01.1D outcount.r02.1D out.gcor.1D out.mask_ae_dice.txt out.mask_ae_overlap.txt out.min_outlier.txt out.pre_ss_warn.txt out.ss_review."${SUBID}".txt pb00."${SUBID}".r01.tcat+orig.BRIK pb00."${SUBID}".r01.tcat+orig.HEAD pb00."${SUBID}".r02.tcat+orig.BRIK pb00."${SUBID}".r02.tcat+orig.HEAD pb01."${SUBID}".r01.despike+orig.BRIK pb01."${SUBID}".r01.despike+orig.HEAD pb01."${SUBID}".r02.despike+orig.BRIK pb01."${SUBID}".r02.despike+orig.HEAD pb02."${SUBID}".r01.tshift+orig.BRIK pb02."${SUBID}".r01.tshift+orig.HEAD pb02."${SUBID}".r02.tshift+orig.BRIK pb02."${SUBID}".r02.tshift+orig.HEAD roi_pc_01_FSvent00.1D roi_pc_01_FSvent01.1D roi_pc_01_FSvent02.1D roi_pc_01_FSvent_eig.1D roi_pc_01_FSvent+orig.BRIK roi_pc_01_FSvent+orig.HEAD roi_pc_01_FSvent_vec.1D @ss_review_basic @ss_review_driver @ss_review_driver_commands stats.REML_cmd stimuli sum_ideal.1D "${SUBID}"_SurfVol_al_junk_e2a_only_mat.aff12.1D "${SUBID}"_SurfVol_al_junk_mat.aff12.1D "${SUBID}"_SurfVol_al_junk+orig.BRIK "${SUBID}"_SurfVol_al_junk+orig.HEAD "${SUBID}"_SurfVol_ns+orig.BRIK "${SUBID}"_SurfVol_ns+orig.HEAD "${SUBID}"_SurfVol+orig.BRIK "${SUBID}"_SurfVol+orig.HEAD TSNR."${SUBID}"+orig.BRIK TSNR."${SUBID}"+orig.HEAD X.jpg X.stim.xmat.1D X.xmat.1D output/

tar -zcvf output.tar.gz output/

rm -r output
