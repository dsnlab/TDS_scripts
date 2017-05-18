% Theresa Cheng | Nandita Vijayakumar
% March 2016

% generate_NamesOnsetsDurations_Events

% This script generates .mat files containing names,
% onsets, durations, pmods based on summary_events csv files 

clear all

%setting directory and listing csv files in matlab directory
addpath('/Volumes/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_summary/events/concat');
addpath('/Volumes/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_NOD/events/concat_wWait');

f = '/Volumes/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_summary/events/concat';
g = '/Volumes/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_NOD/events/concat_wWait';
d = dir(fullfile(f,'*.csv'));

for k=1:length(d)
    
filename = d(k).name;
fid=fopen(filename, 'r');
M = textscan(fid,'%s%s%s%s%f%s%s\n','delimiter',',','Headerlines',1);
fclose(fid);

%changing durations from double to cell format
M{5} = num2cell(M{5});

%creating a dataframe of names, onsets, durations, and pmod
Mdata = [M{3} M{4} M{5} M{7}];

%create separate data arrays for each event
for i=1:length(Mdata) % for each row in Mdata
    if Mdata{i,1}=='"1"' % if it matches event 1 (wait), write a new row 
        wait{i,1} = Mdata{i,1};
        wait{i,2} = Mdata{i,2};
        wait{i,3} = Mdata{i,3};
        wait{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='"2"' %ditto for event 2 
        pt{i,1} = Mdata{i,1};
        pt{i,2} = Mdata{i,2};
        pt{i,3} = Mdata{i,3};
        pt{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='"3"'%event 3 
        ct_2C_inc{i,1} = Mdata{i,1};
        ct_2C_inc{i,2} = Mdata{i,2};
        ct_2C_inc{i,3} = Mdata{i,3};
        ct_2C_inc{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='"4"'%event 4 
        ct_2P_inc{i,1} = Mdata{i,1};
        ct_2P_inc{i,2} = Mdata{i,2};
        ct_2P_inc{i,3} = Mdata{i,3};
        ct_2P_inc{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='"5"'%event 5
        pc{i,1} = Mdata{i,1};
        pc{i,2} = Mdata{i,2};
        pc{i,3} = Mdata{i,3};
        pc{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='"6"'%event 6
        ct_2C_exc{i,1} = Mdata{i,1};
        ct_2C_exc{i,2} = Mdata{i,2};
        ct_2C_exc{i,3} = Mdata{i,3};
        ct_2C_exc{i,4} = Mdata{i,4};
    else Mdata{i,1}=='"7"' %event 7
        ct_2P_exc{i,1} = Mdata{i,1};
        ct_2P_exc{i,2} = Mdata{i,2};
        ct_2P_exc{i,3} = Mdata{i,3};
        ct_2P_exc{i,4} = Mdata{i,4};
        end
        end
        end
    end
        end
    end
end


%this command removes all of the blank cells from fp and pt data arrays
% pt(all(cellfun('isempty',pt),2),:)=[]; %this command removes all of the blank cells from data arrays
wait(all(cellfun('isempty',wait),2),:)=[];
ct_2C_inc(all(cellfun('isempty',ct_2C_inc),2),:)=[];
ct_2P_inc(all(cellfun('isempty',ct_2P_inc),2),:)=[];
pc(all(cellfun('isempty',pc),2),:)=[]; 
ct_2C_exc(all(cellfun('isempty',ct_2C_exc),2),:)=[];
ct_2P_exc(all(cellfun('isempty',ct_2P_exc),2),:)=[];

%generate onsets
onsets{1,1}=wait(:,2);
onsets{1,2}=pc(:,2);
onsets{1,3}=ct_2C_inc(:,2);
onsets{1,4}=ct_2P_inc(:,2);
onsets{1,5}=ct_2C_exc(:,2);
onsets{1,6}=ct_2P_exc(:,2);

%generate durations
durations{1,1}=wait(:,3);
durations{1,2}=pc(:,3);
durations{1,3}=ct_2C_inc(:,3);
durations{1,4}=ct_2P_inc(:,3);
durations{1,5}=ct_2C_exc(:,3);
durations{1,6}=ct_2P_exc(:,3);

%convert durations and onsets into the "double" format
onsets{1}=str2double(onsets{1});
onsets{2}=str2double(onsets{2});
onsets{3}=str2double(onsets{3});
onsets{4}=str2double(onsets{4});
onsets{5}=str2double(onsets{5});
onsets{6}=str2double(onsets{6});

durations{1}=cell2mat(durations{1});
durations{2}=cell2mat(durations{2});
durations{3}=cell2mat(durations{3});
durations{4}=cell2mat(durations{4});
durations{5}=cell2mat(durations{5});
durations{6}=cell2mat(durations{6});

names={'wait','pc','ct_2C_inc','ct_2P_inc','ct_2C_exc','ct_2P_exc'}; %generate names, 'pt' removed

%% PMODS
x = ct_2P_inc(:,4);
x = cellstr(x);
x = str2double(x);

y = ct_2C_exc(:,4);
y = cellstr(y);
y = str2double(y);

%generate pmods for cyb_1 inclusion %COMMENT OUT IF RUNNING CYB_2; FOR CYB_1 only%
pmod = struct('name',{''},'param', {}, 'poly', {});
pmod(4).name{1} = 'ct_2P_pmod_inc';
pmod(5).name{1} = 'ct_2C_pmod_exc';
pmod(4).param{1}=x;
pmod(5).param{1}=y;
pmod(4).poly{1}=1;
pmod(5).poly{1}=1;

%% SAVE
%sub ID
saveName=strcat('t',M{2}(1),'_NOD.mat') 
cd (g) %need to change this to the output folder
%save(saveName{1},'names','onsets','durations')
save(saveName{1},'names','onsets','durations', 'pmod') % Change: Add 'pmod' if using them

clearvars -except f g d

end