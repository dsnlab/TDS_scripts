% Theresa Cheng | Nandita Vijayakumar
% February 2016

% generate_NamesOnsetsDurations_Inclusion 

% This script generates .mat files of the format subID_1 containing names,
% onsets, and durations based on summary_subID_1 csv files 

clear all

%setting directory and listing csv files in matlab directory
f = '/vxfsvol/home/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_summary/blocks/excFpHi_concat';
g = '/vxfsvol/home/research/tds/fMRI/analysis/fx/multicond/cyberball/TDS2_cyb_NOD/blocks/excFpHi_concat';
d = dir(fullfile(f,'*.csv'));

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
    if Mdata{i,1}=='"1"' % if it matches event 1 (wait), write a new row 
        wait{i,1} = Mdata{i,1};
        wait{i,2} = Mdata{i,2};
        wait{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='"2"' %ditto for cond 2 (fp_1)
        fp_1{i,1} = Mdata{i,1};
        fp_1{i,2} = Mdata{i,2};
        fp_1{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='"3"'%cond 3 (fp_inc)
        fp_inc{i,1} = Mdata{i,1};
        fp_inc{i,2} = Mdata{i,2};
        fp_inc{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='"4"'%cond 4 (hi)
        hi{i,1} = Mdata{i,1};
        hi{i,2} = Mdata{i,2};
        hi{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='"5"'%cond 5 (pt)
        pt{i,1} = Mdata{i,1};
        pt{i,2} = Mdata{i,2};
        pt{i,3} = Mdata{i,3};
    else if Mdata{i,1}=='"6"'%cond 6 (fp_exc)
        fp_exc{i,1} = Mdata{i,1};
        fp_exc{i,2} = Mdata{i,2};
        fp_exc{i,3} = Mdata{i,3};
        else Mdata{i,1}=='"7"'%cond 7 (exc)
        exc{i,1} = Mdata{i,1};
        exc{i,2} = Mdata{i,2};
        exc{i,3} = Mdata{i,3};
    end
        end
        end
    end
        end
    end
end


%this command removes all of the blank cells from fp and pt data arrays
wait(all(cellfun('isempty',wait),2),:)=[]
fp_1(all(cellfun('isempty',fp_1),2),:)=[];
fp_inc(all(cellfun('isempty',fp_inc),2),:)=[];%this command removes all of the blank cells from data arrays
hi(all(cellfun('isempty',hi),2),:)=[];
pt(all(cellfun('isempty',pt),2),:)=[];
fp_exc(all(cellfun('isempty',fp_exc),2),:)=[];
exc(all(cellfun('isempty',exc),2),:)=[];

%generate onsets
onsets{1,1}=wait(:,2);
onsets{1,2}=fp_1(:,2);
onsets{1,3}=fp_inc(:,2);
onsets{1,4}=hi(:,2);
onsets{1,5}=pt(:,2);
onsets{1,6}=fp_exc(:,2);
onsets{1,7}=exc(:,2);

%generate durations
durations{1,1}=wait(:,3);
durations{1,2}=fp_1(:,3);
durations{1,3}=fp_inc(:,3);
durations{1,4}=hi(:,3);
durations{1,5}=pt(:,3);
durations{1,6}=fp_exc(:,3);
durations{1,7}=exc(:,3);
     
%convert durationss and onsetss into the "double" format
onsets{1}=str2double(onsets{1});
onsets{2}=str2double(onsets{2});
onsets{3}=str2double(onsets{3});
onsets{4}=str2double(onsets{4});
onsets{5}=str2double(onsets{5});
onsets{6}=str2double(onsets{6});
onsets{7}=str2double(onsets{7});

durations{1}=cell2mat(durations{1});
durations{2}=cell2mat(durations{2});
durations{3}=cell2mat(durations{3});
durations{4}=cell2mat(durations{4});
durations{5}=cell2mat(durations{5});
durations{6}=cell2mat(durations{6});
durations{7}=cell2mat(durations{7});

names={'wait','fp_1','fp_inc','hi','pt', 'fp_exc','exc'};

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
saveName=strcat('t',M{2}(1),'_NOD.mat')
cd (g) %need to change this to the output folder
save(saveName{1},'names','onsets','durations')

clearvars -except f g d

end