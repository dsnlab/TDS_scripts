% Theresa Cheng | Nandita Vijayakumar
% February 2016

% generate_NamesOnsetsDurations_Inclusion 

% This script generates .mat files of the format subID_1 containing names,
% onsets, and durations based on summary_subID_1 csv files 

clear all

%setting directory and listing csv files in matlab directory
f = '/vxfsvol/home/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_summary/blocks/excFpHi_allFp';
g = '/vxfsvol/home/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_NOD/blocks/excFpHi_allFp';
d = dir(fullfile(f,'*_1.csv'));

for k=1:length(d)
    
filename = d(k).name;
fid=fopen(filename, 'r');
M = textscan(fid,'%s%s%s%s%f\n','delimiter',',','Headerlines',1);
fclose(fid);

%changing last column (durationss) from double to cell format
M{5} = num2cell(M{5});

%creating a dataframe of names, onsetss and durationss
Mdata = [M{3} M{4} M{5}];

%create separate data arrays for each condition (exc, fp, and pt)
for i=1:length(Mdata) % for each row in Mdata
    if Mdata{i,1}=='1' % if it matches event 1 (wait), write a new row 
        wait{i,1} = Mdata{i,1};
        wait{i,2} = Mdata{i,2};
        wait{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='2' %ditto for cond 2 (fp1)
        fp1{i,1} = Mdata{i,1};
        fp1{i,2} = Mdata{i,2};
        fp1{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='3'%cond 3 (fpi)
        fpi{i,1} = Mdata{i,1};
        fpi{i,2} = Mdata{i,2};
        fpi{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='4'%cond 4 (hyperinclusion)
        hi{i,1} = Mdata{i,1};
        hi{i,2} = Mdata{i,2};
        hi{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='5'%cond 5 (pt)
        pt{i,1} = Mdata{i,1};
        pt{i,2} = Mdata{i,2};
        pt{i,3} = Mdata{i,3};
    end
        end
        end
    end
    end
end


%this command removes all of the blank cells from fp and pt data arrays
fp1(all(cellfun('isempty',fp1),2),:)=[]; %this command removes all of the blank cells from data arrays
fpi(all(cellfun('isempty',fpi),2),:)=[];
hi(all(cellfun('isempty',hi),2),:)=[];
pt(all(cellfun('isempty',pt),2),:)=[];

%generate onsets
onsets{1,1}=wait(:,2);
onsets{1,2}=fp1(:,2);
onsets{1,3}=fpi(:,2);
onsets{1,4}=hi(:,2);
onsets{1,5}=pt(:,2);

%generate durations
durations{1,1}=wait(:,3);
durations{1,2}=fp1(:,3);
durations{1,3}=fpi(:,3);
durations{1,4}=hi(:,3);
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

names={'wait','fp1','fpi','hi', 'pt'};

% X = exist('cont');
%     if (X>0)    
%         cont(all(cellfun('isempty',cont),2),:)=[];
%         names={'wait','inc','pt','cont'}; %generate names
%         onsets{1,4}=cont(:,2);
%         durations{1,4}=cont(:,3);
%         onsets{4}=str2double(onsets{4});
%         durations{4}=cell2mat(durations{4});
%     else (X == 0)
%         
%     end
    
%sub ID
saveName=strcat('t',M{2}(1),'_1_NOD.mat')
cd (g) %need to change this to the output folder
save(saveName{1},'names','onsets','durations')

clearvars -except f g d

end