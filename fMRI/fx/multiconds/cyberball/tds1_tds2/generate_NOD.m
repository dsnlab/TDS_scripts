% Theresa Cheng | Nandita Vijayakumar
% March 2016

% generate_NamesOnsetsDurations_Events

% This script generates .mat files containing names,
% onsets, durations, pmods based on summary_events csv files 

clear all

%setting directory and listing csv files in matlab directory
f = '/Volumes/TDS/behavior/CyberBall/multiconds/Summary/tds1_tds2/';
g = '/Volumes/TDS/behavior/CyberBall/multiconds/NOD/tds1_tds2';
d = dir(fullfile(f,'*_2.csv')); %change to _2 for cyb2 (and also change which pmods to generate AND bottom of script where it saves file name)

for k=1:length(d)

cd (f)

filename = d(k).name;
fid=fopen(filename, 'r');
M = textscan(fid,'%s%s%s%s%s%s%s\n','delimiter',',','Headerlines',1);
fclose(fid);

%changing durations from double to cell format
M{5} = num2cell(M{5});

%creating a dataframe of names, onsets, durations, and pmod
Mdata = [M{3} M{4} M{5} M{7}];

%create separate data arrays for each event
for i=1:length(Mdata) % for each row in Mdata
    if Mdata{i,1}=='1' % if it matches event 1 (wait), write a new row 
        wait{i,1} = Mdata{i,1};
        wait{i,2} = Mdata{i,2};
        wait{i,3} = Mdata{i,3};
        wait{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='2' %ditto for event 2 
        pt{i,1} = Mdata{i,1};
        pt{i,2} = Mdata{i,2};
        pt{i,3} = Mdata{i,3};
        pt{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='3'%event 3 
        ct_2C{i,1} = Mdata{i,1};
        ct_2C{i,2} = Mdata{i,2};
        ct_2C{i,3} = Mdata{i,3};
        ct_2C{i,4} = Mdata{i,4};
    else if Mdata{i,1}=='4'%event 4 
        ct_2P{i,1} = Mdata{i,1};
        ct_2P{i,2} = Mdata{i,2};
        ct_2P{i,3} = Mdata{i,3};
        ct_2P{i,4} = Mdata{i,4};
    else Mdata{i,1}=='5'%event 5
        pc{i,1} = Mdata{i,1};
        pc{i,2} = Mdata{i,2};
        pc{i,3} = Mdata{i,3};
        pc{i,4} = Mdata{i,4};
        end
        end
        end
    end
end


%this command removes all of the blank cells from fp and pt data arrays
% pt(all(cellfun('isempty',pt),2),:)=[]; %this command removes all of the blank cells from data arrays
ct_2C(all(cellfun('isempty',ct_2C),2),:)=[];
ct_2P(all(cellfun('isempty',ct_2P),2),:)=[];
pc(all(cellfun('isempty',pc),2),:)=[]; 

%generate onsets
onsets{1,1}=wait(:,2);
onsets{1,2}=pc(:,2);
onsets{1,3}=ct_2C(:,2);
onsets{1,4}=ct_2P(:,2);
%onsets{1,5}=pc(:,2);

%generate durations
durations2{1,1}=wait(:,3);
durations2{1,2}=pc(:,3);
durations2{1,3}=ct_2C(:,3);
durations2{1,4}=ct_2P(:,3);
%durations{1,5}=pc(:,3);

%convert durations and onsets into the "double" format
onsets{1}=str2double(onsets{1});
onsets{2}=str2double(onsets{2});
onsets{3}=str2double(onsets{3});
onsets{4}=str2double(onsets{4});
% onsets{5}=str2double(onsets{5});

durations{1}=cellfun(@str2double, durations2{1});
durations{2}=cellfun(@str2double, durations2{2});
durations{3}=cellfun(@str2double, durations2{3});
durations{4}=cellfun(@str2double, durations2{4});
%durations{5}=cell2mat(durations{5});

names={'wait','pc','ct_2C','ct_2P'}; %generate names, 'pt' removed

%% PMODS
x = ct_2C(:,4);
x = cellstr(x);
x = str2double(x);

y = ct_2P(:,4);
y = cellstr(y);
y = str2double(y);

%generate pmods for cyb_1 inclusion %COMMENT OUT IF RUNNING CYB_2; FOR CYB_1 only%
%pmod = struct('name',{''},'param', {}, 'poly', {});
%pmod(4).name{1} = 'ct_2P_pmod_more_inc';
%pmod(4).param{1}=y;
%pmod(4).poly{1}=1;

%generate pmods for cyb_2 exclusion %COMMENT OUT IF RUNNING CYB_1; FOR CYB_2 only%
 pmod = struct('name',{''},'param', {}, 'poly', {});
 pmod(3).name{1} = 'ct_2C_pmod_more_exc';
 pmod(3).param{1}=x;
 pmod(3).poly{1}=1;

%% SAVE
%sub ID
saveName=strcat(M{2}(1),'_2_NOD.mat') % CHANGE FOR CYB_1 or _2!
cd (g) %need to change this to the output folder
%save(saveName{1},'names','onsets','durations')
save(saveName{1},'names','onsets','durations', 'pmod') % Change: Add 'pmod' if using them

clearvars -except f g d

end