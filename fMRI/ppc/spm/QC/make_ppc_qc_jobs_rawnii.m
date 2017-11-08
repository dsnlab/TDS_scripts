% script to create ppc qc jobs
% 5.11.2017

% define paths
jobDir = '~/Desktop/TDS_QC/';
%jobDir = '/projects/dsnlab/tds/TDS_scripts/fMRI/ppc/spm/tds1_tds2/QCraw/';

addpath(jobDir)

% loop through subjects and replace subject ID, wave, reo parameters
for subCount = 300:399;
    subID = (num2str(subCount))
        fn = ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID];
        if exist(fn, 'dir')
        matlabbatch{1}.spm.util.checkreg.data = {
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/structurals/mprage.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/fmaps/fieldmap.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/cyb1/cyb1_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/cyb2/cyb2_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/stop3/stop3_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/stop4/stop4_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/stop5/stop5_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/stop6/stop6_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/stop7/stop7_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/stop8/stop8_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/vid1/vid1_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID,'/vid2/vid2_0001.nii,1']
                                                 };
        matlabbatch{2}.spm.util.print.fname = ['rawnii_',subID];
        matlabbatch{2}.spm.util.print.fig.figname = 'Graphics';
        matlabbatch{2}.spm.util.print.opts = 'pdf';
        
        saveJob = [jobDir,[subID,'_qc_rawnii.mat']];
        save(saveJob,'matlabbatch');
        clear matlabbatch; 
        end
end