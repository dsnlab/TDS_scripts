% generate a new subject list

% get list of regular subject_ids
fileID = fopen('/Volumes/psy-ctn/psy-ctn/TDS/behavior/CyberBall/TDS_N69_subject_list.csv');
subject_ids = textscan(fileID, '%s');
subject_ids = subject_ids{1,1};
fclose(fileID);

% remove list of subjects (toggle comments for the two diff types of
% sensitivity analyses)
believe_tes_SIDs = [131; 134; 144; 151; 159; 167; 175; 190];
believe_tes_SIDs = num2str(believe_tes_SIDs);
% med_mental_SIDs = [126; 127; 133; 136; 139; 146; 168; 173];
% med_mental_SIDs = num2str(med_mental_SIDs);

trunc_subject_ids = setdiff(char(subject_ids), char(believe_tes_SIDs), 'rows'); %also replace here
trunc_subject_ids = cellstr(trunc_subject_ids);

% get the text that needs to be replaced in the job
text = [  ' matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(INDEX).scans =' ...
        , ' {''/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/fx/models/cyb/tds2/SUBJECTID/con_0007.nii''' ...
        , ' ''/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/fx/models/cyb/tds2/SUBJECTID/con_0011.nii''};' ...
        , ' matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(INDEX).conds = [1 2]'
        ];

for i = 1:length(trunc_subject_ids)
    new_text(i) = strrep(strrep(text, 'INDEX', int2str(i)), 'SUBJECTID', trunc_subject_ids(i)) 
end

% transpose - note that more editing is needed to remove additional
% quotation marks, it's also good to hit enter between the two file lines
new_text = new_text';
   