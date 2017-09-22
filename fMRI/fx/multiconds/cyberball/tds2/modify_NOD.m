% Theresa Cheng
% September 20, 2017

% This script modifies the pmod value in multicond files

%% Set variables
% set variables, note that _1 refers to an inclusion run while _2 refers to
% an exclusion run

clear all

oldMeanPmod_1= 2.802
oldMeanPmod_2= 6.185

newMeanPmod_1= 2.729
newMeanPmod_2= 5.968

d= '/Volumes/TDS/behavior/CyberBall/multiconds/NOD/tds2/' % directory with NOD files

%% Directory

cd(d) % set directory

listfiles_1= dir('*_1_NOD.mat')
listfiles_2= dir('*_2_NOD.mat')

for i = 1:length(listfiles_1)
    load(listfiles_1(i).name)
    for j = 1:length(pmod(4).param)
        pmod(4).param{j,1} = pmod(4).param{j,1} + oldMeanPmod_1 - newMeanPmod_1;
    end
    save(listfiles_1(i).name, 'durations', 'names', 'onsets', 'pmod')
end

for i = 1:length(listfiles_2)
    load(listfiles_2(i).name)
    for j = 1:length(pmod(3).param)
        pmod(3).param{j,1} = pmod(3).param{j,1} + oldMeanPmod_2 - newMeanPmod_2;
    end
    save(listfiles_2(i).name, 'durations', 'names', 'onsets', 'pmod')
end