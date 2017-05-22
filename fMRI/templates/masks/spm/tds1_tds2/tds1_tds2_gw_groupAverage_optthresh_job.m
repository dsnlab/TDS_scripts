%-----------------------------------------------------------------------
% Job saved on 02-May-2017 13:26:01 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
%-----------------------------------------------------------------------
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/projects/dsnlab/tds/fMRI/analysis/masks/tds1_tds2'};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^s.*gw_join.nii';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.spm.util.imcalc.input(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^s.*gw_join.nii)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{2}.spm.util.imcalc.output = 'tds1_tds2_gw_smoothed_group_average.nii';
matlabbatch{2}.spm.util.imcalc.outdir = {'/projects/dsnlab/tds/fMRI/analysis/masks/tds1_tds2'};
matlabbatch{2}.spm.util.imcalc.expression = 'mean(X)';
matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{2}.spm.util.imcalc.options.dmtx = 1;
matlabbatch{2}.spm.util.imcalc.options.mask = 0;
matlabbatch{2}.spm.util.imcalc.options.interp = 0;
matlabbatch{2}.spm.util.imcalc.options.dtype = 4;
matlabbatch{3}.spm.tools.masking{1}.optthr.inname(1) = cfg_dep('Image Calculator: ImCalc Computed Image: tds1_tds2_gw_smoothed_group_average.nii', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.tools.masking{1}.optthr.optfunc = '@opt_thr_corr';
matlabbatch{3}.spm.tools.masking{1}.optthr.outname = 'tds1_tds2_gw_smoothed_group_average_optthr.nii';
matlabbatch{3}.spm.tools.masking{1}.optthr.outdir = {'/projects/dsnlab/tds/fMRI/analysis/masks/tds1_tds2'};
