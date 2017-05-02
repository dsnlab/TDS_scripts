%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% reoBatchMaker.m
%
% ~WEM3 [120210]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a batch script to reorient images based on manually determined 
% parameters. Using this instead of entering the params into a pre-existing
% script saves considerable time and tedium. MORE IMPORTANTLY, it reduces
% the extent to which the noise of human error is introduced into the data
% (because we all know that tedious pasting into scripts leads to
% mistakes).
%
% Execute: 
%          prior to any spm8 ppc steps if 'jiggling' funk --> anatomical 
%         
%          after coreg if anat --> mean funk...)
%
% call spm_jobman configuration so that our new jobs save properly

spm_jobman('initcfg')

%
% Make your [n x 12] matrix in Excel, and then copy/paste it into the
% MATLAB Command Window like this: 

% (NOTE: the code underneath won't affect
% successful execution of the script, but is there w/o comment to provide 
% a more salient example).

% whatevsies = [... % name a variable anything you want, press enter
    
%    'your pasted matrix (sans single quotes)' % instead of typing, just Paste the cells you copied in Excel 
    
%   ] % actually type this bracket, press enter


      % NOTE: there's no semicolon.  That way, a MATLAB formatted matrix 
      % will be printed to the Command Window.  This way, you can just copy
      % what's in the command window, and the formatting will look even 
      %when you paste the matrix into this here script)

% reo params: determined via spm8 Display, recorded in Excel

reoParams = [... % copy the data from the MATLAB Command Window, paste it below   
%~(CHANGE ME)~
    
%   right     forward   up        pitch     roll      yaw       [x y z] zoom (always = [1 1 1])      [x y z] shear (always = [0 0 0])  

3.5   8  -22   0  0  0.01  1  1  1  0  0  0
0  18 -10   0  -0.02 0  1  1  1  0  0  0
12 13 45 -0.05 0.02  0.1   1  1  1  0  0  0
0  7  -7 0  -0.01 0  1  1  1  0  0  0
1  13 0.5   0.05  0.05  0.04  1  1  1  0  0  0
-4 10 -2 0  0  0  1  1  1  0  0  0
2.5   -3 -22   0.34  -0.04 0.03  1  1  1  0  0  0
-2 11 -5 -0.08 0  0.04  1  1  1  0  0  0
-3 8  5  0.22  0  0.04  1  1  1  0  0  0
0  16 4  0.14  0.04  0.02  1  1  1  0  0  0
3.6   14 -4 0.05  0.01  0.04  1  1  1  0  0  0
4  5  -11   0  -0.05 0.04  1  1  1  0  0  0
1  8  -11   0.2   0  -0.06 1  1  1  0  0  0
2  12 4  0.2   -0.03 0.03  1  1  1  0  0  0
1  14 -8 0.1   -0.07 0.04  1  1  1  0  0  0
0  -12   -18   0.06  -0.06 0  1  1  1  0  0  0
2  -14   -16   -0.02 -0.02 0.12  1  1  1  0  0  0
4  12 6  0.05  0.02  0.02  1  1  1  0  0  0
-2 4  -4 0.02  -0.06 0.03  1  1  1  0  0  0
0  12 -12   0.05  0.05  0.02  1  1  1  0  0  0
4  10 -3 0.04  0.02  0.08  1  1  1  0  0  0
2  6  -12   0.1   0  -0.01 1  1  1  0  0  0
2  -5 0  0  0  0.02  1  1  1  0  0  0
0  -2 10 0.13  0.03  0  1  1  1  0  0  0
-1 10 -4 0  0.02  -0.05 1  1  1  0  0  0
-1 9  -10   0  -0.03 0.02  1  1  1  0  0  0
-1 6  -28   -0.05 0.12  0.05  1  1  1  0  0  0
4  12 -20   0  0  0.09  1  1  1  0  0  0
1  8  -21   0.1   -0.02 -0.02 1  1  1  0  0  0
0  -8 -26   0.07  -0.02 -0.02 1  1  1  0  0  0
-1 10 -13   0.16  -0.05 -0.05 1  1  1  0  0  0
4  3  -20   0.02  0.03  0  1  1  1  0  0  0
3  7  -6 0.03  0.03  0.04  1  1  1  0  0  0
4  8  -16   0.02  0.07  0.05  1  1  1  0  0  0
4  14 2  0.06  -0.05 0.07  1  1  1  0  0  0
-3 16 7  0.06  0.02  -0.02 1  1  1  0  0  0
3  12 0  0.02  0.02  0  1  1  1  0  0  0
2  10 0  0.12  -0.02 0.08  1  1  1  0  0  0
-2 5  -3 0.28  -0.03 0.07  1  1  1  0  0  0
8  14 35 0.15  0.04  0.07  1  1  1  0  0  0
5  10 -14   -0.08 0.05  0.06  1  1  1  0  0  0
2  3  -28   0.03  0.02  0.05  1  1  1  0  0  0
-1 8  -15   0  0.03  0.02  1  1  1  0  0  0
0  3  -4 0.1   -0.02 -0.04 1  1  1  0  0  0
0  -7 -16   0  0.02  -0.02 1  1  1  0  0  0
0  -2 -2 0.13  0  0.07  1  1  1  0  0  0
7  9  -10   0  0.03  0.13  1  1  1  0  0  0
4  6  -16   0.03  -0.06 0.02  1  1  1  0  0  0
-5 14 -16   0.1   -0.02 -0.13 1  1  1  0  0  0
-3 16 16 0.25  0  0  1  1  1  0  0  0
6  7  -5 -0.1  -0.02 0.09  1  1  1  0  0  0
7  8  -22   0.06  0  0.11  1  1  1  0  0  0
-1 10 -2 0  -0.03 -0.02 1  1  1  0  0  0
3  10 0  0.05  0.03  0.08  1  1  1  0  0  0
0  10 -13   0.1   -0.04 -0.07 1  1  1  0  0  0
-3 12 -10   0  -0.04 0  1  1  1  0  0  0
0  16 0  0.16  -0.05 0.03  1  1  1  0  0  0
-2 12 6  0.33  -0.08 0  1  1  1  0  0  0
0  18 4  0.08  0.02  0.03  1  1  1  0  0  0
0  6  -18   0.25  -0.04 -0.03 1  1  1  0  0  0
-4.5  13.5  -4 -0.05 -0.02 0  1  1  1  0  0  0
0  16 10 0.25  -0.01 0  1  1  1  0  0  0
-1 18 -6 0.1   0.1   -0.05 1  1  1  0  0  0
-0.5  0  -19   0.02  -0.05 0  1  1  1  0  0  0
-2 12 -5 0  -0.05 -0.03 1  1  1  0  0  0
5  14 10 0.15  0.02  0.09  1  1  1  0  0  0
5.5   10 0  0  0  0.15  1  1  1  0  0  0
3  11 -22   0.07  -0.02 -0.02 1  1  1  0  0  0
0  7  -4 0.07  0.02  0.06  1  1  1  0  0  0
-1 9  6  -0.06 -0.03 0.02  1  1  1  0  0  0
5  10 1  0.25  0.12  0.08  1  1  1  0  0  0
2  -13   29.5  0.03  -0.05 0.02  1  1  1  0  0  0
2.5   17 -9 0.16  0.12  0.08  1  1  1  0  0  0
3  6  -20   -0.04 0.045 0.02  1  1  1  0  0  0
-4 -3 -1 0.03  -0.1  0.04  1  1  1  0  0  0
0  6  -1 0.09  -0.035   -0.02 1  1  1  0  0  0
2  8  0  -0.1  -0.03 0.03  1  1  1  0  0  0
   ];

% subList = a cell string (a list of strings in cell format) of subject
% names. You don't need the paths, just the names of each subject's folder
% at the ~/Studies/YourStudy/Subjects/ level

subList = {... 
%~(CHANGE ME)~

't101'
't102'
't104'
't105'
't106'
't108'
't109'
't113'
't114'
't115'
't116'
't117'
't119'
't120'
't121'
't122'
't124'
't125'
't126'
't127'
't128'
't129'
't130'
't131'
't132'
't133'
't134'
't135'
't136'
't137'
't139'
't140'
't141'
't142'
't144'
't145'
't146'
't150'
't151'
't152'
't155'
't156'
't157'
't158'
't159'
't160'
't161'
't162'
't163'
't164'
't165'
't167'
't168'
't169'
't170'
't171'
't172'
't173'
't175'
't177'
't178'
't179'
't181'
't182'
't183'
't184'
't185'
't186'
't187'
't188'
't189'
't192'
't193'
't194'
't195'
't196'
't197'
};

% subPath = the path to the Subjects directory 

subPath = '/vxfsvol/home/research/tds/subjects_G80';
% ~(CHANGE ME)~

% reoJobDir = the folder where you want all the spm jobs to go
% (essentially, pick a name and location for the equivalent of
% spmbatch_jobs folder)

reoJobDir = '/vxfsvol/home/research/tds/scripts/batch/spm_ppc/reo_jobs_G80';
% ~(CHANGE ME)~

% an empty cell that will hold a list of individual subjects' directories

subDir = cell(1,length(subList));

% a cell to hold the reorientation parameters for each subject

reoVec = cell(1,length(subList));

% loop over subjects

for i=1:length(subList);
    
    % get the subject's directory info
    
    subDir{i}=fullfile(subPath,subList{i},'/');
    
    % put the reoParams for that subject into a cell
    
    reoVec{i}=reoParams(i,:);
    

% this is the matlabbatch code that would be generated by the spm8 Batch
% Editor GUI if you chose 'File Selector (Batch Mode)' and 'Reorient'. What
% we're doing here is essentially just a more nuts & bolts version of 
% spmbatch.  The jobs will end up in reoJobDir.

matlabbatch{1}.cfg_basicio.file_fplist.dir = subDir(i);
matlabbatch{1}.cfg_basicio.file_fplist.filter = '(ru.*nii|mprage.nii)';
matlabbatch{1}.cfg_basicio.file_fplist.rec = 'FPListRec';
matlabbatch{2}.spm.util.reorient.srcfiles(1) = cfg_dep;
matlabbatch{2}.spm.util.reorient.srcfiles(1).tname = 'Images to reorient';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(1).name = 'class';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(1).value = 'cfg_files';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.util.reorient.srcfiles(1).sname = 'File Selector (Batch Mode): Selected Files (b_)';
matlabbatch{2}.spm.util.reorient.srcfiles(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.util.reorient.srcfiles(1).src_output = substruct('.','files');
matlabbatch{2}.spm.util.reorient.transform.transprm = reoParams(i,:);
matlabbatch{2}.spm.util.reorient.prefix = 'o';

save((strcat(reoJobDir,filesep,subList{i},'_reo.mat')),'matlabbatch');

end

