% This script takes a template contrast batch .m file that has contrasts
% only defined on each of the condition columns that all participants
% should have. That is, the conditions we care about in the design matrix
% are the decisions and outcomes (this entails 7 conditions including
% GAMEOVER events. However, participants will also have columns for penalty
% conditions and motion regressors. The script reads the participant's
% multiple conditions file to determine whether to include 0 padding in the
% contrasts for penalty conditions, and also 0 pads the contrasts by the
% number of motion regressors, set below.
%
% This is necessary because the contrasts are defined with all runs
% concatentated, so the motion and penalty conditions come between each set
% of contrasts we care about.
%
% To use this file, you should simply be able to change the paths and other
% options below to match your configuration. The ground truth against which
% to compare these options is the design matrix for the first level models.
% Whether the columns are defined as conditions or pmods is of no
% importance, except to the part of the script that saves a tally of events
% for each condition. You can find this part below and alter it so it
% reports pmods if necessary.


SPM_PATH='/projects/dsnlab/shared/SPM12/';
multicondDir='/projects/dsnlab/shared/tds/fMRI/analysis/fx/multicond/ylg/nopmods/';
contrastJobMat='/projects/dsnlab/shared/tds/TDS_scripts/fMRI/fx/models/ylg/contrasts/fx_ylg_allconds_nopmod_cons_tds1.m'; %.m file for version control and readability
outputDir='/projects/dsnlab/shared/tds/TDS_scripts/fMRI/fx/models/ylg/contrasts/sid_batches/fx_ylg_allconds_nopmod_cons_tds1/';
outprefix='fx_ylg_allconds_nopmod_tds1_';
outpostfix='.mat';
outcomeCSV=fullfile(outputDir, 'multicondinfo-base.csv');  
numColsPerRun=7; % how many columns per run in the template file?
numRuns=3; % how many runs in the template file?
nMotionRegressors=5; %how many columns are used for motion correction
excludeThese={'301' '304' '362' '364' '376' '378'}; % via failed fx models

%You shouldn't need to change these options unless the multiple conditions setup has changed substantially
numCondsWithoutPenalties=7; %this is the number of conditions when one has no penalty conditions - should include GAMEOVER (doesn't include pmods)
expression='multicond_decout_nopmod_(?<pid>[0-9]{3})_stop(?<run>\w+)\.mat'; %regular expression for extracting information from multicond file names.

%this determines the filename for the multicond file to be read to infer
%how to adjust the contrast coding.
prefix='multicond_decout_nopmod_'; 
midfix='_stop';
postfix='.mat';

%---
% No more options below
%---

addpath(SPM_PATH);
spm_jobman('initcfg');

mcCSVFID=fopen(outcomeCSV,'w'); 
fprintf(mcCSVFID, 'pid, run, go, stop, go_good_o, stop_good_o, go_bad_o, stop_bad_o, pendec, penout\n');
fclose(mcCSVFID);

run(contrastJobMat);
contrastJobBatch.matlabbatch=matlabbatch;
if(any(cellfun(@(x) length(x.tcon.weights)~=numColsPerRun*numRuns,...
    contrastJobBatch.matlabbatch{1}.spm.stats.con.consess)));
    error(['Template file has wrong length for at least one contrast (all should be ', num2str(numColsPerRun*numRuns), ' )']);
end
%if a multicond has penalty conditions, add 7 zeros, otherwise, add just
%the 5 for motion parameters

dirsearchstring=fullfile(multicondDir, 'multicond_decout_nopmod_*stop*mat');

filenames=dir(dirsearchstring);

tokennames = regexp(filenames(1).name, expression, 'names');

pidsAndRuns=arrayfun(@(aFile) regexp(aFile.name, expression, 'names'), filenames);
uniquePIDs=unique(arrayfun(@(x) x.pid, pidsAndRuns, 'UniformOutput',false));
%Need to specify unique runs explicitly because of alpha order issue.
%uniqueRuns=unique(arrayfun(@(x) x.run, pidsAndRuns, 'UniformOutput',false));
uniqueRuns={'ALONE'; 'PEER'; 'EXCL'};

%exclude some folks
uniquePIDs=uniquePIDs(~ismember(uniquePIDs, excludeThese));

for(pid_i = 1:length(uniquePIDs))
    display(['PID index: ', num2str(pid_i)]);
    nExtraConds={0, 0, 0};
    matlabbatch=contrastJobBatch.matlabbatch;
    for(run_i = 1:length(uniqueRuns))
        display(['Run index: ', num2str(run_i)]);
        filename=[prefix uniquePIDs{pid_i} midfix uniqueRuns{run_i} postfix];
        runConds=load(fullfile(multicondDir,filename), '-mat', 'names','onsets');
        nNamedConds=length(runConds.names);
        if(~nNamedConds==length(runConds.onsets))
            error(['names length not equal to onsets length for pid:' uniquePIDs{pid_i} ...
                ' run:' uniqueRuns{run_i} '!']);
        end
        if(~ismember(nNamedConds, [numCondsWithoutPenalties,numCondsWithoutPenalties+2]))
            error(['Num conditions = ' num2str(length(runConds.names)) ...
                ' for pid:' uniquePIDs{pid_i} ...
                ' run:' uniqueRuns{run_i} ', but should be ' ...
                num2str(numCondsWithoutPenalties) ' or ' ...
                num2str(numCondsWithoutPenalties + 2) '!']);
        end
        nExtraConds{run_i} = nNamedConds - numCondsWithoutPenalties;
        nPenDec=0; nPenOut=0;
        if(nNamedConds == numCondsWithoutPenalties+2)
            nPenDec=length(runConds.onsets{numCondsWithoutPenalties+1});
            nPenOut=length(runConds.onsets{numCondsWithoutPenalties+2});
        end
        mcCSVFID=fopen(outcomeCSV,'a');  %'a' = append to the prev file
        %fprintf(mcCSVFID, 'pid, run, go, stop, go_good_o, stop_good_o, go_bad_o, stop_bad_o, pendec, penout\n');
        %This section is not flexible to changes between pmod and non-pmod
        %style models. But it is also just here to keep track of how many
        %events each person has for later checking.
        fprintf(mcCSVFID, '%s, %s, %d, %d, %d, %d, %d, %d, %d, %d\n', ...
            uniquePIDs{pid_i}, uniqueRuns{run_i}, ...
            length(runConds.onsets{1}), length(runConds.onsets{2}), ...
            length(runConds.onsets{3}), length(runConds.onsets{4}), ...
            length(runConds.onsets{5}), length(runConds.onsets{6}), ...
            nPenDec, nPenOut);
        fclose(mcCSVFID);
    end
    matlabbatch{1}.spm.stats.con.spmmat=...
        regexprep(matlabbatch{1}.spm.stats.con.spmmat, '/[0-9]{3}/',...
        ['/' uniquePIDs{pid_i} '/']);
    for(consess_i = 1:length(matlabbatch{1}.spm.stats.con.consess))
        runweights={};
        for(run_i = 1:length(uniqueRuns))
            runweights{run_i}=[matlabbatch{1}.spm.stats.con.consess{consess_i}.tcon.weights([1:numColsPerRun]+numColsPerRun*(run_i-1)) ...
                zeros(1, (5 + nExtraConds{run_i}))];
        end
        newWeights = cell2mat(runweights);
        matlabbatch{1}.spm.stats.con.consess{consess_i}.tcon.weights = newWeights;
    end
    outfileName=fullfile(outputDir,[outprefix num2str(uniquePIDs{pid_i}) outpostfix]);
    save(outfileName, 'matlabbatch');
    clear('nExtraConds','matlabbatch','runweights','newWeights')
end
