%-----------------------------------------------------------------------
% Job saved on 03-Mar-2015 08:45:22 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/vxfsvol/home/research/tds/test_segment_etc'};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 'rc1xmprage.nii';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/vxfsvol/home/research/tds/test_segment_etc'};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 'rc2xmprage.nii';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/vxfsvol/home/research/tds/test_segment_etc'};
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 'rc3xmprage.nii';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/vxfsvol/home/research/tds/test_segment_etc'};
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 'rc4xmprage.nii';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/vxfsvol/home/research/tds/test_segment_etc'};
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 'rc5xmprage.nii';
matlabbatch{5}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/vxfsvol/home/research/tds/test_segment_etc'};
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 'rc6xmprage.nii';
matlabbatch{6}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPListRec';
matlabbatch{7}.spm.tools.dartel.warp.images{1}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (rc1xmprage.nii)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{7}.spm.tools.dartel.warp.images{2}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (rc2xmprage.nii)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{7}.spm.tools.dartel.warp.images{3}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (rc3xmprage.nii)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{7}.spm.tools.dartel.warp.images{4}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (rc4xmprage.nii)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{7}.spm.tools.dartel.warp.images{5}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (rc5xmprage.nii)', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{7}.spm.tools.dartel.warp.images{6}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (rc6xmprage.nii)', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{7}.spm.tools.dartel.warp.settings.template = 'Template';
matlabbatch{7}.spm.tools.dartel.warp.settings.rform = 0;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(1).its = 3;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(1).rparam = [4 2 1e-06];
matlabbatch{7}.spm.tools.dartel.warp.settings.param(1).K = 0;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(1).slam = 16;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(2).its = 3;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(2).rparam = [2 1 1e-06];
matlabbatch{7}.spm.tools.dartel.warp.settings.param(2).K = 0;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(2).slam = 8;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(3).its = 3;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(3).rparam = [1 0.5 1e-06];
matlabbatch{7}.spm.tools.dartel.warp.settings.param(3).K = 1;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(3).slam = 4;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(4).its = 3;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(4).rparam = [0.5 0.25 1e-06];
matlabbatch{7}.spm.tools.dartel.warp.settings.param(4).K = 2;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(4).slam = 2;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(5).its = 3;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(5).rparam = [0.25 0.125 1e-06];
matlabbatch{7}.spm.tools.dartel.warp.settings.param(5).K = 4;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(5).slam = 1;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(6).its = 3;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(6).rparam = [0.25 0.125 1e-06];
matlabbatch{7}.spm.tools.dartel.warp.settings.param(6).K = 6;
matlabbatch{7}.spm.tools.dartel.warp.settings.param(6).slam = 0.5;
matlabbatch{7}.spm.tools.dartel.warp.settings.optim.lmreg = 0.01;
matlabbatch{7}.spm.tools.dartel.warp.settings.optim.cyc = 3;
matlabbatch{7}.spm.tools.dartel.warp.settings.optim.its = 3;
