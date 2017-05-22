%-----------------------------------------------------------------------
% Job saved on 02-May-2017 13:39:50 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
%-----------------------------------------------------------------------
matlabbatch{1}.spm.util.imcalc.input = {
                                        '/projects/dsnlab/tds/fMRI/subjects/101/structurals/wc1mprage.nii,1'
                                        '/projects/dsnlab/tds/fMRI/subjects/101/structurals/wc2mprage.nii,1'
                                        };
matlabbatch{1}.spm.util.imcalc.output = '101_gw_join';
matlabbatch{1}.spm.util.imcalc.outdir = {'/projects/dsnlab/tds/fMRI/analysis/masks/tds1_tds2'};
matlabbatch{1}.spm.util.imcalc.expression = '(i1>i2).*i1+(i2>i1).*i2';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 0;
matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
matlabbatch{2}.spm.spatial.smooth.data(1) = cfg_dep('Image Calculator: Imcalc Computed Image:101_gw_join', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{2}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{2}.spm.spatial.smooth.dtype = 0;
matlabbatch{2}.spm.spatial.smooth.im = 0;
matlabbatch{2}.spm.spatial.smooth.prefix = 's';
