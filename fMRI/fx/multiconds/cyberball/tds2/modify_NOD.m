% Theresa Cheng
% September 20, 2017 | Updated: 11/29/2019

% This script modifies the pmod value in multicond files

%% Set variables
% set variables, note that _1 refers to an inclusion run while _2 refers to
% an exclusion run

clear all

% oldMeanPmod_1= 2.802
% oldMeanPmod_2= 6.185

% newMeanPmod_1= 2.729
% newMeanPmod_2= 5.968

% subject_list = '~/projects/dsnlab/TDS/TDS_scripts/fMRI/fx/shell/schedule_spm_jobs/cyb/tds2/subject_list_fx.txt'
% 
% % get list of subjects
% fileID = fopen(subject_list, 'r');
% subject_list = textscan(fileID, ' %s');
% fclose(fileID);

input_dir='/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/fx/multicond/cyb/tds1_tds2/'; % directory with NOD files
output_dir='/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/fx/multicond/cyb/tds2_quad/';
%% change to poly = 2 for a quadratic effect

cd(input_dir) % set directory
listfiles_2= dir('1*_2_NOD.mat')

for i = 1:length(listfiles_2)
     load(listfiles_2(i).name);
     pmod(3).poly={[2]};
     output_name=[ output_dir 'quad_' listfiles_2(i).name ];
     save(output_name, 'durations', 'names', 'onsets', 'pmod');
end

%% Change mean centering

% cd(d) % set directory
% 
% listfiles_1= dir('*_1_NOD.mat')
% listfiles_2= dir('*_2_NOD.mat')
% 
% for i = 1:length(listfiles_1)
%     load(listfiles_1(i).name)
%     for j = 1:length(pmod(4).param)
%         pmod(4).param{j,1} = pmod(4).param{j,1} + oldMeanPmod_1 - newMeanPmod_1;
%     end
%     save(listfiles_1(i).name, 'durations', 'names', 'onsets', 'pmod')
% end
% 
% for i = 1:length(listfiles_2)
%     load(listfiles_2(i).name)
%     for j = 1:length(pmod(3).param)
%         pmod(3).param{j,1} = pmod(3).param{j,1} + oldMeanPmod_2 - newMeanPmod_2;
%     end
%     save(listfiles_2(i).name, 'durations', 'names', 'onsets', 'pmod')
% end