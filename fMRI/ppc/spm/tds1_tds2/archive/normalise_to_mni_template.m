%-----------------------------------------------------------------------
% Job saved on 09-Apr-2015 17:58:59 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.tools.dartel.mni_norm.template = {'/vxfsvol/home/research/tds/subjects_flux/dartel_template/Template30_6.nii'};
matlabbatch{1}.spm.tools.dartel.mni_norm.data.subj.flowfield = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/structurals/u_rc1mprage_Template30.nii'};
matlabbatch{1}.spm.tools.dartel.mni_norm.data.subj.images = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/structurals/mprage.nii'};
matlabbatch{1}.spm.tools.dartel.mni_norm.vox = [1 1 1];
matlabbatch{1}.spm.tools.dartel.mni_norm.bb = [NaN NaN NaN
                                               NaN NaN NaN];
matlabbatch{1}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{1}.spm.tools.dartel.mni_norm.fwhm = [1 1 1];
matlabbatch{2}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/structurals'};
matlabbatch{2}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = 'norm1';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Normalise to MNI Space: MNI Smo. Warped - Concentrations (Deformation 1)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}, '()',{':'}));
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_move.action.moveto(1) = cfg_dep('Make Directory: Make Directory ''norm1''', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));
matlabbatch{4}.spm.tools.dartel.mni_norm.template = {'/vxfsvol/home/research/tds/subjects_flux/dartel_template/Template30_6.nii'};
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subj.flowfield = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/structurals/u_rc1mprage_Template30.nii'};
matlabbatch{4}.spm.tools.dartel.mni_norm.data.subj.images = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/structurals/mprage.nii'};
matlabbatch{4}.spm.tools.dartel.mni_norm.vox = [2 2 2];
matlabbatch{4}.spm.tools.dartel.mni_norm.bb = [NaN NaN NaN
                                               NaN NaN NaN];
matlabbatch{4}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{4}.spm.tools.dartel.mni_norm.fwhm = [6 6 6];
matlabbatch{5}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.parent = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/structurals'};
matlabbatch{5}.cfg_basicio.file_dir.dir_ops.cfg_mkdir.name = 'norm2';
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_move.files(1) = cfg_dep('Normalise to MNI Space: MNI Smo. Warped - Concentrations (Deformation 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('{}',{1}, '()',{':'}));
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_move.action.moveto(1) = cfg_dep('Make Directory: Make Directory ''norm2''', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','dir'));
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/functionals'};
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^ru\w+_[0-9]{4}\.nii';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{8}.spm.tools.dartel.mni_norm.template = {'/vxfsvol/home/research/tds/subjects_flux/dartel_template/Template30_6.nii'};
matlabbatch{8}.spm.tools.dartel.mni_norm.data.subj.flowfield = {'/vxfsvol/home/research/tds/subjects_flux/t101/ppc/structurals/u_rc1mprage_Template30.nii'};
matlabbatch{8}.spm.tools.dartel.mni_norm.data.subj.images(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^ru\w+_[0-9]{4}\.nii)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{8}.spm.tools.dartel.mni_norm.vox = [2 2 2];
matlabbatch{8}.spm.tools.dartel.mni_norm.bb = [NaN NaN NaN
                                               NaN NaN NaN];
matlabbatch{8}.spm.tools.dartel.mni_norm.preserve = 0;
matlabbatch{8}.spm.tools.dartel.mni_norm.fwhm = [6 6 6];
