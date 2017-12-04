% script to create ppc qc jobs
% 5.11.2017

% define paths
jobDir = '/projects/dsnlab/tds/TDS_scripts/fMRI/ppc/spm/QC/QC_ppced';

addpath(jobDir)

% loop through subjects and replace subject ID, wave, reo parameters
for subCount = 300:411;
    subID = (num2str(subCount))
        fn = ['/Volumes/TDS/nonbids_data/fMRI/subjects/',subID];
        if exist(fn, 'dir')
        matlabbatch{1}.cfg_basicio.file_dir.dir_ops.cfg_cd.dir = {'/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/QC/QC_ppced'};
        matlabbatch{2}.spm.util.checkreg.data = {
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/structurals/norm2/swmprage.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/cyb1/swrucyb1_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/cyb2/swrucyb2_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/stop3/swrustop3_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/stop4/swrustop4_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/stop5/swrustop5_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/stop6/swrustop6_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/stop7/swrustop7_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/stop8/swrustop8_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/vid1/swruvid1_0001.nii,1']
                                                 ['/Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tdsall/',subID,'/vid2/swruvid2_0001.nii,1']
                                                 };
        matlabbatch{3}.spm.util.print.fname = ['ppced_',subID];
        matlabbatch{3}.spm.util.print.fig.figname = 'Graphics';
        matlabbatch{3}.spm.util.print.opts = 'pdf';
        
        saveJob = [jobDir,[subID,'_qc_ppced.mat']];
        save(saveJob,'matlabbatch');
        clear matlabbatch; 
        end
end
