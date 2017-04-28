%-----------------------------------------------------------------------
% Job saved on 20-Mar-2017 13:42:34 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% Edited ZodM 20-Mar-2017
%-----------------------------------------------------------------------


jobDir = '/Users/ralph/Documents/tds/tds_repo/fMRI/scripts/templates/masks/mask_jobs';
job_prefix='mask';

structpath = ['/Users/ralph/Documents/tds/fMRI/subjects/', num2str(sub), '/structurals/'];
outputfilename = [num2str(sub), '_gw_join']

matlabbatch{1}.spm.util.imcalc.input = {[structpath, 'wc1mprage.nii,1']
                                        [structpath, 'wc2mprage.nii,1']};
matlabbatch{1}.spm.util.imcalc.output = outputfilename;
matlabbatch{1}.spm.util.imcalc.outdir = {'/Users/ralph/Documents/tds/tds_repo/templates/masks/'};
matlabbatch{1}.spm.util.imcalc.expression = '(i1>i2).*i1+(i2>i1).*i2';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 0;
matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
matlabbatch{2}.spm.spatial.smooth.data(1) = cfg_dep(['Image Calculator: Imcalc Computed Image:', outputfilename], substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{2}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{2}.spm.spatial.smooth.dtype = 0;
matlabbatch{2}.spm.spatial.smooth.im = 0;
matlabbatch{2}.spm.spatial.smooth.prefix = 's';

save(strcat(jobDir,'/',sub,'_',job_prefix,'.mat'),'matlabbatch');