% Theresa Cheng | Nandita Vijayakumar
% February 2016

% Generate_NamesOnsetsDurations_Exclusion

% This script generates .mat files of the format subID_2 containing names,
% onsets, and durations based on summary_subID_2 csv files 

clear all

%setting directory and listing csv files in matlab directory
f = '/vxfsvol/home/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_summary/blocks/excFpHi_allFp';
g = '/vxfsvol/home/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_NOD/blocks/excFpHi_allFp';
d = dir(fullfile(f,'*_2.csv'));

for k=1:length(d)

filename = d(k).name;
fid=fopen(filename, 'r');
M = textscan(fid,'%s%s%s%s%f\n','delimiter',',','HeaderLines',1);
fclose(fid);

%changing last column (durationss) from double to cell format
M{5} = num2cell(M{5});

%creating a dataframe of names, onsetss and durationss
Mdata = [M{3} M{4} M{5}];

%create separate data arrays for each condition (exc, fp, and pt)
for i=1:length(Mdata) % for each row in Mdata
    if Mdata{i,1}=='1' % if it matches condition 1 (exclusion), write a new row of exc
        wait{i,1} = Mdata{i,1};
        wait{i,2} = Mdata{i,2};
        wait{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='2' %ditto for cond 2 (fair play)
        fp1{i,1} = Mdata{i,1};
        fp1{i,2} = Mdata{i,2};
        fp1{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='3'%cond 3 (fp_exclusion)
        fpe{i,1} = Mdata{i,1};
        fpe{i,2} = Mdata{i,2};
        fpe{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='4'%cond 4 (exc)
        exc{i,1} = Mdata{i,1};
        exc{i,2} = Mdata{i,2};
        exc{i,3} = Mdata{i,3};   
    else Mdata{i,1}=='5'%cond 5 (participant throws)
        pt{i,1} = Mdata{i,1};
        pt{i,2} = Mdata{i,2};
        pt{i,3} = Mdata{i,3}; 
        end
        end
    end
    end
end


%this command removes all of the blank cells from fp and pt data arrays
fp1(all(cellfun('isempty',fp1),2),:)=[]; %this command removes all of the blank cells from fp, pt, and exc data arrays
fpe(all(cellfun('isempty',fpe),2),:)=[];
exc(all(cellfun('isempty',exc),2),:)=[];
pt(all(cellfun('isempty',pt),2),:)=[];

%generate names
names={'wait','fp1','fpe','exc','pt'};

%generate onsets
onsets{1,1}=wait(:,2);
onsets{1,2}=fp1(:,2);
onsets{1,3}=fpe(:,2);
onsets{1,4}=exc(:,2);
onsets{1,5}=pt(:,2);

%generate durations
durations{1,1}=wait(:,3);
durations{1,2}=fp1(:,3);
durations{1,3}=fpe(:,3);
durations{1,4}=exc(:,3);
durations{1,5}=pt(:,3);

%convert durationss and onsetss into the "double" format
onsets{1}=str2double(onsets{1});
onsets{2}=str2double(onsets{2});
onsets{3}=str2double(onsets{3});
onsets{4}=str2double(onsets{4});
onsets{5}=str2double(onsets{5});

durations{1}=cell2mat(durations{1});
durations{2}=cell2mat(durations{2});
durations{3}=cell2mat(durations{3});
durations{4}=cell2mat(durations{4});
durations{5}=cell2mat(durations{5});

%sub ID
saveName=strcat('t',M{2}(1),'_2_NOD.mat');
cd (g) %need to change this to the output folder
save(saveName{1},'names','onsets','durations');

clearvars -except f g d

end