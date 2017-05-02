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
      % when you paste the matrix into this here script)

% reo params: determined via spm8 Display, recorded in Excel

reoParams = [... % copy the data from the MATLAB Command Window, paste it below   

%   right     forward   up        pitch     roll      yaw       [x y z] zoom (always = [1 1 1])      [x y z] shear (always = [0 0 0])  
    2.5000   -3.0000  -22.0000    0.3400   -0.0400    0.0300    1.0000    1.0000    1.0000         0         0         0
   -2.0000   11.0000   -5.0000   -0.0800         0    0.0400    1.0000    1.0000    1.0000         0         0         0
   -3.0000    8.0000    5.0000    0.2200         0    0.0400    1.0000    1.0000    1.0000         0         0         0
         0   16.0000    4.0000    0.1400    0.0400    0.0200    1.0000    1.0000    1.0000         0         0         0
    3.6000   14.0000   -4.0000    0.0500    0.0100    0.0400    1.0000    1.0000    1.0000         0         0         0
    4.0000    5.0000  -11.0000         0   -0.0500    0.0400    1.0000    1.0000    1.0000         0         0         0
    1.0000    8.0000  -11.0000    0.2000         0   -0.0600    1.0000    1.0000    1.0000         0         0         0
    2.0000   12.0000    4.0000    0.2000   -0.0300    0.0300    1.0000    1.0000    1.0000         0         0         0
    1.0000   14.0000   -8.0000    0.1000   -0.0700    0.0400    1.0000    1.0000    1.0000         0         0         0
         0  -12.0000  -18.0000    0.0600   -0.0600         0    1.0000    1.0000    1.0000         0         0         0
    2.0000  -14.0000  -16.0000   -0.0200   -0.0200    0.1200    1.0000    1.0000    1.0000         0         0         0
    4.0000   12.0000    6.0000    0.0500    0.0200    0.0200    1.0000    1.0000    1.0000         0         0         0
   -2.0000    4.0000   -4.0000    0.0200   -0.0600    0.0300    1.0000    1.0000    1.0000         0         0         0
         0   12.0000  -12.0000    0.0500    0.0500    0.0200    1.0000    1.0000    1.0000         0         0         0
    4.0000   10.0000   -3.0000    0.0400    0.0200    0.0800    1.0000    1.0000    1.0000         0         0         0
    2.0000    6.0000  -12.0000    0.1000         0   -0.0100    1.0000    1.0000    1.0000         0         0         0
    2.0000   -5.0000         0         0         0    0.0200    1.0000    1.0000    1.0000         0         0         0
         0   -2.0000   10.0000    0.1300    0.0300         0    1.0000    1.0000    1.0000         0         0         0
   -1.0000   10.0000   -4.0000         0    0.0200   -0.0500    1.0000    1.0000    1.0000         0         0         0
   -1.0000    9.0000  -10.0000         0   -0.0300    0.0200    1.0000    1.0000    1.0000         0         0         0
   -1.0000    6.0000  -28.0000   -0.0500    0.1200    0.0500    1.0000    1.0000    1.0000         0         0         0
    4.0000   12.0000  -20.0000         0         0    0.0900    1.0000    1.0000    1.0000         0         0         0
    1.0000    8.0000  -21.0000    0.1000   -0.0200   -0.0200    1.0000    1.0000    1.0000         0         0         0
         0   -8.0000  -26.0000    0.0700   -0.0200   -0.0200    1.0000    1.0000    1.0000         0         0         0
   -1.0000   10.0000  -13.0000    0.1600   -0.0500   -0.0500    1.0000    1.0000    1.0000         0         0         0
    4.0000    3.0000  -20.0000    0.0200    0.0300         0    1.0000    1.0000    1.0000         0         0         0
    3.0000    7.0000   -6.0000    0.0300    0.0300    0.0400    1.0000    1.0000    1.0000         0         0         0
    4.0000    8.0000  -16.0000    0.0200    0.0700    0.0500    1.0000    1.0000    1.0000         0         0         0
    4.0000   14.0000    2.0000    0.0600   -0.0500    0.0700    1.0000    1.0000    1.0000         0         0         0
   -3.0000   16.0000    7.0000    0.0600    0.0200   -0.0200    1.0000    1.0000    1.0000         0         0         0
    3.0000   12.0000         0    0.0200    0.0200         0    1.0000    1.0000    1.0000         0         0         0
    2.0000   10.0000         0    0.1200   -0.0200    0.0800    1.0000    1.0000    1.0000         0         0         0
   -2.0000    5.0000   -3.0000    0.2800   -0.0300    0.0700    1.0000    1.0000    1.0000         0         0         0
    8.0000   14.0000   35.0000    0.1500    0.0400    0.0700    1.0000    1.0000    1.0000         0         0         0
    5.0000   10.0000  -14.0000   -0.0800    0.0500    0.0600    1.0000    1.0000    1.0000         0         0         0
    2.0000    3.0000  -28.0000    0.0300    0.0200    0.0500    1.0000    1.0000    1.0000         0         0         0
   -1.0000    8.0000  -15.0000         0    0.0300    0.0200    1.0000    1.0000    1.0000         0         0         0
         0    3.0000   -4.0000    0.1000   -0.0200   -0.0400    1.0000    1.0000    1.0000         0         0         0
         0   -7.0000  -16.0000         0    0.0200   -0.0200    1.0000    1.0000    1.0000         0         0         0
         0   -2.0000   -2.0000    0.1300         0    0.0700    1.0000    1.0000    1.0000         0         0         0
    7.0000    9.0000  -10.0000         0    0.0300    0.1300    1.0000    1.0000    1.0000         0         0         0
    4.0000    6.0000  -16.0000    0.0300   -0.0600    0.0200    1.0000    1.0000    1.0000         0         0         0
   -5.0000   14.0000  -16.0000    0.1000   -0.0200   -0.1300    1.0000    1.0000    1.0000         0         0         0
   -3.0000   16.0000   16.0000    0.2500         0         0    1.0000    1.0000    1.0000         0         0         0
    6.0000    7.0000   -5.0000   -0.1000   -0.0200    0.0900    1.0000    1.0000    1.0000         0         0         0
    7.0000    8.0000  -22.0000    0.0600         0    0.1100    1.0000    1.0000    1.0000         0         0         0
   -1.0000   10.0000   -2.0000         0   -0.0300   -0.0200    1.0000    1.0000    1.0000         0         0         0
    3.0000   10.0000         0    0.0500    0.0300    0.0800    1.0000    1.0000    1.0000         0         0         0
         0   10.0000  -13.0000    0.1000   -0.0400   -0.0700    1.0000    1.0000    1.0000         0         0         0
   -3.0000   12.0000  -10.0000         0   -0.0400         0    1.0000    1.0000    1.0000         0         0         0
         0   16.0000         0    0.1600   -0.0500    0.0300    1.0000    1.0000    1.0000         0         0         0
   -2.0000   12.0000    6.0000    0.3300   -0.0800         0    1.0000    1.0000    1.0000         0         0         0
         0   18.0000    4.0000    0.0800    0.0200    0.0300    1.0000    1.0000    1.0000         0         0         0
         0    6.0000  -18.0000    0.2500   -0.0400   -0.0300    1.0000    1.0000    1.0000         0         0         0
   -3.0000   14.0000  -10.0000    0.1800   -0.0300    0.0400    1.0000    1.0000    1.0000         0         0         0
         0   16.0000   10.0000    0.2500   -0.0100         0    1.0000    1.0000    1.0000         0         0         0
   -1.0000   18.0000   -6.0000    0.1000    0.1000   -0.0500    1.0000    1.0000    1.0000         0         0         0
   -2.0000   12.0000   -5.0000         0   -0.0500   -0.0300    1.0000    1.0000    1.0000         0         0         0
    5.0000   14.0000   10.0000    0.1500    0.0200    0.0900    1.0000    1.0000    1.0000         0         0         0
];

% subList = a cell string (a list of strings in cell format) of subject
% names. You don't need the paths, just the names of each subject's folder
% at the ~/Studies/YourStudy/Subjects/ level

subList = {... 
%~(CHANGE ME)~
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
   't183'
   't184'
};

% subPath = the path to the Subjects directory 

subPath = '/vxfsvol/home/research/tds/subjects_G59';
% ~(CHANGE ME)~

% reoJobDir = the folder where you want all the spm jobs to go
% (essentially, pick a name and location for the equivalent of
% spmbatch_jobs folder)

reoJobDir = '/vxfsvol/home/research/tds/scripts/batch/spm_ppc/reo_jobs_G59/ru_jobs';
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
matlabbatch{1}.cfg_basicio.file_fplist.filter = 'rustop';
matlabbatch{1}.cfg_basicio.file_fplist.rec = 'FPListRec';
matlabbatch{2}.spm.util.reorient.srcfiles(1) = cfg_dep;
matlabbatch{2}.spm.util.reorient.srcfiles(1).tname = 'Images to reorient';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(1).name = 'class';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(1).value = 'cfg_files';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.util.reorient.srcfiles(1).tgt_spec{1}(2).value = 'e';
   
% SPnote: the following line sets the filename prefix to 'ru' instead of b_ because we did not bet the images
% and the reorienting was done after realign-unwarp-coreg
% It is necessary to run reoBatchMaker_G59 3 times, once each for 'ru', 'mprage', and 'mean'(for the meanru images)   
   
matlabbatch{2}.spm.util.reorient.srcfiles(1).sname = 'File Selector (Batch Mode): Selected Files (rustop)';
matlabbatch{2}.spm.util.reorient.srcfiles(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.util.reorient.srcfiles(1).src_output = substruct('.','files');
matlabbatch{2}.spm.util.reorient.transform.transprm = reoParams(i,:);
matlabbatch{2}.spm.util.reorient.prefix = 'o';

save((strcat(reoJobDir,filesep,subList{i},'_reo.mat')),'matlabbatch');

end

