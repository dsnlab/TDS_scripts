% Overwrite flexifactorial scripts
%
% Theresa Cheng
% March 24, 2017 | Last edited: Tues, 9/26/17

clear all

%% Define these variables
rx_folder = '~/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/cyb';
rx_scripts = {'F_conj_pmod_flexi_agequad'}; % 'F_2x2_age.mat'; do NOT incldude the .mat
    % 'F_2x2', 'F_2x2_age', 'F_2x2_ageXcontext', 'F_2x2_ageXthrow', 'F_2x2_agequad', 'F_2x2_agequadXcontext', 'F_2x2_agequadXthrow', 'F_conj_pmod_flexi', 'F_conj_pmod_flexi_age', 'F_conj_pmod_flexi_agequad', 'F_conj_pmod_flexi_agequadXpmod', 'F_conj_pmod_flexi_ageXpmod'
analysis_folder = '/Volumes/TDS/nonbids_data/derivatives/fMRI/rx/cyb/tds2_N69/';  % Make sure that the desired rx directories exist within this analysis folder! Make sure this ends with '/'

fx_folder = '/Volumes/TDS/nonbids_data/derivatives/fMRI/fx/models/cyb/tds2/'; % root folder for fx models, right up to the subject ID, make sure this ends with '/'
con_list_2x2= {'con_0004.nii','con_0006.nii', 'con_0010.nii', 'con_0014.nii'};
con_list_conj= {'con_0007.nii','con_0011.nii'};
conds_2x2 = [1,1;1,2;2,1;2,2];
conds_conj= [1;2];

fileID= fopen('~/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/cyb/tds2_N69_subject-list.txt') % create file identifier for subject list
char_in_SID= 3 % number of characters per SID, in TDS this is 3

    % Create subject list vector
    subject_list = fscanf(fileID, '%s'); % read the file
    fclose(fileID); % close file identifier
    subject_list=cellstr(reshape(subject_list,char_in_SID,[])'); % break up the string into one column per three characters (or however many characters there are in a subject ID)

age_folder = '/Volumes/TDS/behavior/CyberBall/tds2_demographics' 
age_file = 'cyb_age.csv'

    % Create age vectors
    cd(age_folder)
    age_csv= csvread(age_file, 1) % R1=1 as a row offset so that the column names are not read in
    age= age_csv(:,2) % subset to the mean-centered age vector
    age_reps_2x2= repelem(age, length(conds_2x2)) % repeat age by the number of times needed for the 2x2 factorial model
    age_reps_conj= repelem(age, length(conds_conj)) % and for conj
    agequad= age_csv(:,3)
    agequad_reps_2x2= repelem(agequad, length(conds_2x2))
    agequad_reps_conj= repelem(agequad, length(conds_conj)) 
    
%% Edit flexi factorial scripts: calling on fx files
cd(rx_folder) % location of rx file folder

% write a loop that goes through all of the batch scripts of interest
for i = 1:length(rx_scripts) % for each rx script of interest
    load(strcat(char(rx_scripts(i)),'.mat'));  % load the rx .mat script
    matlabbatch{1, 1}.spm.stats.factorial_design.dir = {strcat(analysis_folder, (char(rx_scripts(i))))} % overwrite directory
    if contains(char(rx_scripts(i)), '2x2') %% Replace con files and age values for F_2x2 scripts
        for j = 1: length(subject_list)     % replace existing con files 
            for k = 1: length(con_list_2x2)
                matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(j).scans{k,1}= ...
                    char(strcat(fx_folder,subject_list(j),'/',con_list_2x2(k)));
                matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(j).conds=conds_2x2;
            end
        end
        if contains(char(rx_scripts(1)), 'agequad') % replace existing age + agequad values
            matlabbatch{1, 1}.spm.stats.factorial_design.cov(1).c =age_reps_2x2
            matlabbatch{1, 1}.spm.stats.factorial_design.cov(2).c = agequad_reps_2x2 
        elseif contains(char(rx_scripts(i)), 'age') % replace existing age values ONLY
            matlabbatch{1, 1}.spm.stats.factorial_design.cov.c = age_reps_2x2 %replace covariates with age_c values
        else 
        end
    elseif contains (char(rx_scripts(i)), 'conj') %% Replace con files and age values for CONJ PMOD scripts
              for j = 1: length(subject_list)     % replace existing con files 
            for k = 1: length(con_list_conj)
                matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(j).scans{k,1}= ...
                    char(strcat(fx_folder,subject_list(j),'/',con_list_conj(k)));
                matlabbatch{1,1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(j).conds=conds_conj;
            end
        end
        if contains(char(rx_scripts(i)), 'agequad') % replace existing age values
            matlabbatch{1, 1}.spm.stats.factorial_design.cov(1).c =age_reps_conj
            matlabbatch{1, 1}.spm.stats.factorial_design.cov(2).c = agequad_reps_conj
        elseif contains(char(rx_scripts(i)), 'age')
            matlabbatch{1, 1}.spm.stats.factorial_design.cov.c = age_reps_conj %replace covariates with age_c values
        else 
        end
    else
    end
end

%% Save the file

save(strcat(rx_folder, '/hpc_', char(rx_scripts(i))), 'matlabbatch')

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