%NEEDS TO BE GENERALIZED 
% check for correct number of motion regressors, and other things

multicondDir='/Users/ralph/Documents/tds/tds_repo/fMRI/analysis/fx/multicond/ylg/';
contrastJobMat='/Users/ralph/Documents/tds/tds_repo/fMRI/scripts/fx/models/ylg/contrasts/fx_ylg_allconds_con_base_53_template.mat';
outputDir='/Users/ralph/Documents/tds/tds_repo/fMRI/scripts/fx/models/ylg/contrasts/fx_ylg_allconds_con_base_53/';
outprefix='fx_ylg_allconds_';
outpostfix='.mat';
outcomeCSV=fullfile(outputDir, 'multicondinfo-base.csv');  
excludeThese={'101' '102' '104' '105' '106' '108' '110' '111' '178' '189' '350' '356'}; %SPnote: these exclusions based on subjs not in the allconds fx model

mcCSVFID=fopen(outcomeCSV,'w'); 
fprintf(mcCSVFID, 'pid, run, dec, decgo, good, goodgo, goodnextgo, goodswitch, bad, badgo, badnextgo, badswitch, pendec, penout\n');
fclose(mcCSVFID);

numCondsWithoutPenalties=4;
expression='multicond_decout_pmod_(?<pid>[0-9]{3})_stop(?<run>\w+)\.mat';
prefix='multicond_decout_pmod_';
midfix='_stop';
postfix='.mat';

contrastJobBatch=load(contrastJobMat);
if(any(cellfun(@(x) length(x.tcon.weights)~=33,...
    contrastJobBatch.matlabbatch{1}.spm.stats.con.consess)));
    error('Template file has wrong length for at least one contrast (all should be 33)');
end
%if a multicond has penalty conditions, add 7 zeros, otherwise, add 5


dirsearchstring=[multicondDir 'multicond_decout_pmod_*stop*mat'];

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
    nExtraConds={0, 0, 0};
    matlabbatch=contrastJobBatch.matlabbatch;
    for(run_i = 1:length(uniqueRuns))
        filename=[prefix uniquePIDs{pid_i} midfix uniqueRuns{run_i} postfix];
        runConds=load(fullfile(multicondDir,filename), '-mat', 'names','onsets','pmod');
        nNamedConds=length(runConds.names);
        if(~nNamedConds==length(runConds.onsets))
            error(['names length not equal to onsets length for pid:' uniquePIDs{pid_i} ...
                ' run:' uniqueRuns{run_i} '!']);
        end
        if(nNamedConds ~= 4 && nNamedConds ~= 6)
            error(['Num conditions = ' num2str(length(runConds.names)) ...
                ' for pid:' uniquePIDs{pid_i} ...
                ' run:' uniqueRuns{run_i} ', but should be 4 or 6!']);
        end
        nExtraConds{run_i} = nNamedConds - numCondsWithoutPenalties;
        nPenDec=0; nPenOut=0;
        if(nNamedConds == 6)
            nPenDec=length(runConds.onsets{5});
            nPenOut=length(runConds.onsets{6});
        end
        mcCSVFID=fopen(outcomeCSV,'a');  %'a' = append to the prev file
        %fprintf(mcCSVFID, 'pid, run, dec, decgo, good, goodgo, goodnextgo, goodswitch, bad, badgo, badnextgo, badswitch, pendec, penout\n');
        fprintf(mcCSVFID, '%s, %s, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d\n', ...
            uniquePIDs{pid_i}, uniqueRuns{run_i}, length(runConds.onsets{1}), sum(runConds.pmod(1).param{1}==.5), ...
            length(runConds.onsets{2}), sum(runConds.pmod(2).param{1}==.5), sum(runConds.pmod(2).param{2}==.5), sum(runConds.pmod(2).param{3}==.5), ...
            length(runConds.onsets{3}), sum(runConds.pmod(3).param{1}==.5), sum(runConds.pmod(3).param{2}==.5), sum(runConds.pmod(3).param{3}==.5), ...
            nPenDec, nPenOut);
        fclose(mcCSVFID);
    end
    matlabbatch{1}.spm.stats.con.spmmat=...
        regexprep(matlabbatch{1}.spm.stats.con.spmmat, '/[0-9]{3}/',...
        ['/' uniquePIDs{pid_i} '/']);
    for(consess_i = 1:length(matlabbatch{1}.spm.stats.con.consess))
        runweights={};
        for(run_i = 1:length(uniqueRuns))
            runweights{run_i}=[matlabbatch{1}.spm.stats.con.consess{consess_i}.tcon.weights([1:11]+11*(run_i-1)) ...
                zeros(1, (5 + nExtraConds{run_i}))];
        end
        newWeights = cell2mat(runweights);
        matlabbatch{1}.spm.stats.con.consess{consess_i}.tcon.weights = newWeights;
    end
    outfileName=fullfile(outputDir,[outprefix num2str(uniquePIDs{pid_i}) outpostfix]);
    save(outfileName, 'matlabbatch');
    clear('nExtraConds','matlabbatch','runweights','newWeights')
end
