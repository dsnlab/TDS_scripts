%-----------------------------------------------------------------------
% Job saved on 16-Mar-2017 16:57:19 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.spatial.coreg.estimate.ref = {'/Users/ralph/Documents/MATLAB/spm12/canonical/avg152T1.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estimate.source = {'/Users/ralph/Documents/tds/fMRI/subjects/178/structurals/mprage.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estimate.other = {''};
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{2}.spm.spatial.preproc.channel.vols(1) = cfg_dep('Coregister: Estimate: Coregistered Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','cfiles'));
matlabbatch{2}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{2}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{2}.spm.spatial.preproc.channel.write = [0 0];
matlabbatch{2}.spm.spatial.preproc.tissue(1).tpm = {'/Users/ralph/Documents/MATLAB/spm12/tpm/TPM.nii,1'};
matlabbatch{2}.spm.spatial.preproc.tissue(1).ngaus = 2;
matlabbatch{2}.spm.spatial.preproc.tissue(1).native = [1 1];
matlabbatch{2}.spm.spatial.preproc.tissue(1).warped = [1 0];
matlabbatch{2}.spm.spatial.preproc.tissue(2).tpm = {'/Users/ralph/Documents/MATLAB/spm12/tpm/TPM.nii,2'};
matlabbatch{2}.spm.spatial.preproc.tissue(2).ngaus = 2;
matlabbatch{2}.spm.spatial.preproc.tissue(2).native = [1 1];
matlabbatch{2}.spm.spatial.preproc.tissue(2).warped = [1 0];
matlabbatch{2}.spm.spatial.preproc.tissue(3).tpm = {'/Users/ralph/Documents/MATLAB/spm12/tpm/TPM.nii,3'};
matlabbatch{2}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{2}.spm.spatial.preproc.tissue(3).native = [1 1];
matlabbatch{2}.spm.spatial.preproc.tissue(3).warped = [1 0];
matlabbatch{2}.spm.spatial.preproc.tissue(4).tpm = {'/Users/ralph/Documents/MATLAB/spm12/tpm/TPM.nii,4'};
matlabbatch{2}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{2}.spm.spatial.preproc.tissue(4).native = [1 1];
matlabbatch{2}.spm.spatial.preproc.tissue(4).warped = [1 0];
matlabbatch{2}.spm.spatial.preproc.tissue(5).tpm = {'/Users/ralph/Documents/MATLAB/spm12/tpm/TPM.nii,5'};
matlabbatch{2}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{2}.spm.spatial.preproc.tissue(5).native = [1 1];
matlabbatch{2}.spm.spatial.preproc.tissue(5).warped = [1 0];
matlabbatch{2}.spm.spatial.preproc.tissue(6).tpm = {'/Users/ralph/Documents/MATLAB/spm12/tpm/TPM.nii,6'};
matlabbatch{2}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{2}.spm.spatial.preproc.tissue(6).native = [1 1];
matlabbatch{2}.spm.spatial.preproc.tissue(6).warped = [1 0];
matlabbatch{2}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{2}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{2}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{2}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{2}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{2}.spm.spatial.preproc.warp.samp = 2;
matlabbatch{2}.spm.spatial.preproc.warp.write = [0 0];