% Overwrite flexifactorial script
%
% Theresa Cheng
% March 24, 2017 | Last edited: Mon, 9/18/17

clear all

%% Define these variables
rx_folder = '~/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/cyb';
rx_scripts = {'F_2x2'}; % 'F_2x2_age.mat'; do NOT incldude the .mat
analysis_folder = 'smb://PSI-SVR-FILER.uoregon.edu/TDS/nonbids_data/derivatives/fMRI/rx/cyb/tds2_N69/';  % Make sure that the desired rx directories exist within this analysis folder! Make sure this ends with '/'

fx_folder = 'smb://PSI-SVR-FILER.uoregon.edu/TDS/nonbids_data/derivatives/fMRI/fx/models/cyb/tds2/'; % root folder for fx models, right up to the subject ID, make sure this ends with '/'
con_list= {'con_0004.nii','con_0006.nii', 'con_0010.nii', 'con_0014.nii'};
conds = [1,1;1,2;2,1;2,2];

fileID= fopen('~/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/cyb/tds2_N69_subject-list.txt') % create file identifier for subject list
char_in_SID= 3 % number of characters per SID, in TDS this is 3

    % Create subject list vector
    subject_list = fscanf(fileID, '%s') % read the file
    fclose(fileID) % close file identifier
    subject_list=cellstr(reshape(subject_list,char_in_SID,[])') % break up the string into one column per three characters (or however many characters there are in a subject ID)

%% Edit flexi factorial scripts
cd(rx_folder) % location of rx file folder

% write a loop that goes through all of the batch scripts of interest
for i = 1:length(rx_scripts) % for each rx script of interest
    load(strcat(char(rx_scripts(1)),'.mat'));  % load the rx .mat script
    matlabbatch{1, 1}.spm.stats.factorial_design.dir = {strcat(analysis_folder, (char(rx_scripts(1))))} % overwrite directory
    % replace existing con files 
    for j = 1: length(subject_list)
        for k = 1: length(con_list)
        matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(j).scans{k,1}= ...
        strcat(fx_folder,subject_list(j),'/',con_list(k))
        matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(j).conds=conds
        end
    end
    save(strcat(rx_folder, '/test_', char(rx_scripts(i))))
end

%% Replaces called con files for existing data

% Problem: Flexifactorial path suffix need to be updated for each file, for each
% subject. 
% Previous path: /vxfsvol/home/research/tds/...
% New path: /Volumes/psych-cog/dsnlab/TDS/...

% File: rx_F_2x2_flexi_cesd_age.mat
% Location:
% matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(1).scans[1:4,]
% for i= 1:length(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject) % for each subject (the length of fsubject)
%     matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{1,1}=... % the scans field should equal
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{1,1},'/vxfsvol/home/research/tds/fMRI/subjects/t',... 
%         '/Users/ralph/Documents/tds/fMRI/analysis/fx/models/cyb/tds2/'); % replace the first string with the second string
%         matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{1,1}=...
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{1,1},'fx/cyb/events_meanCpmod_noquad_w190/con_0007.nii','con_0007.nii'); % and do this again
% 
%     matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1}=...
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1},'/vxfsvol/home/research/tds/fMRI/subjects/t',...
%         '/Users/ralph/Documents/tds/fMRI/analysis/fx/models/cyb/tds2/'); % for the second field, replace the first string with the second string
%         matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1}=...
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1},'fx/cyb/events_meanCpmod_noquad_w190/con_0011.nii','con_0011.nii'); % and do it again
%     
%     matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{3,1}= [] 
%     matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{4,1}= []
%     matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans=...
%         matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans(~cellfun('isempty',matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(1).scans'));
% 
%     %matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).conds(:,2)=[]
%     %matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).conds(3:4,:)=[]
%     %matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).conds(1:2,:)=[1;2]
% end   
    
%  I don't know what this does
% % for i= 1:length(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject)
%     for j=1:length(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans)
%     matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{j,1} = ...
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{j,1},'/vxfsvol/home/research/tds/',...
%         '/Volumes/psych-cog/dsnlab/TDS/archive/');
%     end 
% end

%    strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{1,1},'/vxfsvol/home/research/tds/fMRI/subjects/t',... 
%         '/Users/ralph/Documents/tds/fMRI/analysis/fx/models/cyb/tds2/'); % replace the first string with the second string
%         matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{1,1}=...
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{1,1},'fx/cyb/events_meanCpmod_noquad_w190/con_0007.nii','con_0007.nii'); % and do this again
% 
%     matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1}=...
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1},'/vxfsvol/home/research/tds/fMRI/subjects/t',...
%         '/Users/ralph/Documents/tds/fMRI/analysis/fx/models/cyb/tds2/'); % for the second field, replace the first string with the second string
%         matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1}=...
%         strrep(matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(i).scans{2,1},'fx/cyb/events_meanCpmod_noquad_w190/con_0011.nii','con_0011.nii'); % and do it again
%     