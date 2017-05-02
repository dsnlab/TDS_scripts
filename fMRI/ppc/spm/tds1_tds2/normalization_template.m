%-----------------------------------------------------------------------
% Job saved on 16-Mar-2017 18:18:38 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% Edited JCFZodM 15-Mar-2017
%-----------------------------------------------------------------------


jobDir = '/Users/ralph/Documents/tds/tds_repo/fMRI/scripts/ppc/spm/ppc2_jobs';
job_prefix='ppc2';

funcpath = ['/Users/ralph/Documents/tds/fMRI/subjects/', num2str(sub), '/'];

matlabbatch{1}.spm.tools.dartel.mni_norm.template = {'/Users/ralph/Documents/tds/fMRI/subjects/dartel_template/tds_template_n145_6.nii'};
matlabbatch{1}.spm.tools.dartel.mni_norm.data.subj.flowfield = {[funcpath, 'structurals/u_rc1mprage_tds_template_n145.nii']};
matlabbatch{1}.spm.tools.dartel.mni_norm.data.subj.images = {[funcpath, 'structurals/mprage.nii']};
matlabbatch{1}.spm.tools.dartel.mni_norm.vox = [1 1 1];
matlabbatch{1}.spm.tools.dartel.mni_norm.bb = [NaN NaN NaN
                                               NaN NaN NaN];
matlabbatch{1}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{1}.spm.tools.dartel.mni_norm.fwhm = [1 1 1];
matlabbatch{2}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent = {[funcpath, 'structurals']};
matlabbatch{2}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = 'norm1';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Normalise to MNI Space: MNI Smo. Warped - Concentrations (Deformation 1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}, '()',{':'}));
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_move.action.moveto(1) = cfg_dep('Make Directory: Make Directory ''norm1''', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));
matlabbatch{4}.spm.tools.dartel.mni_norm.template = {'/Users/ralph/Documents/tds/fMRI/subjects/dartel_template/tds_template_n145_6.nii'};
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subj.flowfield = {[funcpath, 'structurals/u_rc1mprage_tds_template_n145.nii']};
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subj.images = {[funcpath, 'structurals/mprage.nii']};
matlabbatch{4}.spm.tools.dartel.mni_norm.vox = [2 2 2];
matlabbatch{4}.spm.tools.dartel.mni_norm.bb = [NaN NaN NaN
                                               NaN NaN NaN];
matlabbatch{4}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{4}.spm.tools.dartel.mni_norm.fwhm = [4 4 4];
matlabbatch{5}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent = {[funcpath, 'structurals']};
matlabbatch{5}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = 'norm2';
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Normalise to MNI Space: MNI Smo. Warped - Concentrations (Deformation 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}, '()',{':'}));
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_move.action.moveto(1) = cfg_dep('Make Directory: Make Directory ''norm2''', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {['/Users/ralph/Documents/tds/fMRI/subjects/', num2str(sub)]};
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^ru\w+_[0-9]{4}\.nii';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{8}.spm.tools.dartel.mni_norm.template = {'/Users/ralph/Documents/tds/fMRI/subjects/dartel_template/tds_template_n145_6.nii'};
matlabbatch{8}.spm.tools.dartel.mni_norm.data.subj.flowfield = {[funcpath, 'structurals/u_rc1mprage_tds_template_n145.nii']};
matlabbatch{8}.spm.tools.dartel.mni_norm.data.subj.images(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^ru\w+_[0-9]{4}\.nii)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{8}.spm.tools.dartel.mni_norm.vox = [2 2 2];
matlabbatch{8}.spm.tools.dartel.mni_norm.bb = [NaN NaN NaN
                                               NaN NaN NaN];
matlabbatch{8}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{8}.spm.tools.dartel.mni_norm.fwhm = [4 4 4];

save(strcat(jobDir,'/',sub,'_',job_prefix,'.mat'),'matlabbatch');