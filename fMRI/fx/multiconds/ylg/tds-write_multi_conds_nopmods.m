% Be sure to run the R script here first (it updates the
% mat file we get data from for this script):
% 	/projects/dsnlab/tds/TDS_scripts/behavioral/ylg/tds-collect_data_for_multi_conds.r
% Paths in this script are set to run from the grid (danbo)

SKIP = [103 107 112 138 143 176 191 305 318 319 339 345];
DRY_RUN = false;

% Columns of matrix are:
%	1 sid, 2 supercondition_id, 3 tid,
%	4 condition_num,
%	5 onset_c,
%	6 duration,
%	7 game_end_c
%
% subject id is the same as the folder name
% run id is the super-condition number 1 = alone, 2 = peer, 3 = excl
% condition_name is:
% 	1 = 'GO_HIT_decision',
% 	2 = 'GO_MISS_decision',
% 	3 = 'STOP_FA_decision',
% 	4 = 'STOP_CR_decision',
% 	5 = 'GO_HIT_outcome',
% 	6 = 'GO_MISS_outcome',
% 	7 = 'STOP_FA_outcome',
% 	8 = 'STOP_CR_outcome',
%   9 = 'PENALTY_decision',
%  10 = 'PENALTY_outcome'
%
% Onsets and durations are in milliseconds and will be converted to seconds.
%
multicond_type_name='decout_nopmod';
sid_col=1;
rid_col=2;
list_of_runs_checklist=2:4;
run_names={'ALONE','PEER','EXCL'};
trial_id_col=3;
cond_num_col=4;
onset_col=5;
duration_col=6;
game_end_col=7;
cond_err_num=11;
namesraw={...
    'go', 'stop', 'good_go_outcome','good_stop_outcome', 'bad_go_outcome', 'bad_stop_outcome', 'GAMEOVER','penalty_decision','penalty_outcome'};
game_end_cond_num=length(namesraw)-2;

conds_as_pmods=false;
%Number of conditions not including penalties
num_l1_conds=7;

%ignore the pmod_conds naming -- we can use these to create conditions with
%no pmods too.
%Numbers in brackets refer to condition numbers in SRC mat file
% 	1 = 'GO_HIT_decision',
% 	2 = 'GO_MISS_decision',
pmod_conds=struct('includeconds',[1 2]);
% 	3 = 'STOP_FA_decision',
% 	4 = 'STOP_CR_decision',
pmod_conds(2)=struct('includeconds',[3 4]);
% 	5 = 'GO_HIT_outcome',
pmod_conds(3)=struct('includeconds',[5]);
% 	8 = 'STOP_CR_outcome'
pmod_conds(4)=struct('includeconds',[8]);
% 	6 = 'GO_MISS_outcome',
pmod_conds(5)=struct('includeconds',[6]);
% 	7 = 'STOP_FA_outcome',
pmod_conds(6)=struct('includeconds',[7]);

%CHANGE ME%
multicond_WriteDir = '/data/jflournoy/TDS/nonbids_data/derivatives/fMRI/fx/multicond/ylg/nopmod/';
multicondSRCFileName = '/data/jflournoy/TDS/tds-multicond_for_processing_decout_collapsed_jan2019.mat';

load(multicondSRCFileName, 'multicondSRC')
subject_names = unique(multicondSRC(:,sid_col));
run_nums = unique(multicondSRC(:,rid_col));
condition_nums = unique(multicondSRC(:,cond_num_col));

if(any(condition_nums==cond_err_num)) error('At least one outcome is "NONE", which is unacceptable.'); end

subject_index = multicondSRC(:,sid_col);
run_index = multicondSRC(:,rid_col);
condition_index = multicondSRC(:,cond_num_col);

% TEST the logic
% multicondSRC(subject_index==subject_names(1) & run_index==run_nums(3),:)
% thing=multicondSRC(subject_index==subject_names(1) & run_index==run_nums(3)...
% 	& condition_index == 1,7)

%if(length(names)-1 ~= length(condition_nums)) error('Names and conditions are not of equal length'); end

num_conditions=length(namesraw);

for(sid_i = 1:length(subject_names))
    subject_name = subject_names(sid_i);
    if(~any(subject_name == SKIP))
        if(~isequal(unique(multicondSRC(subject_index==subject_name,rid_col))',list_of_runs_checklist))
            warning(['Participant ',num2str(subject_name),' does not have all runs'])
        end
        for(run_i = 1:length(run_nums))
            run_num = run_nums(run_i);
            
            display(['sid: ',num2str(subject_name),...
                ' run: ',num2str(run_num)]);
            
            if(exist('run_names'))
                this_run_name=run_names{run_i};
            else
                this_run_name=num2str(run_num);
            end
            
            output_fname = ['multicond_',multicond_type_name,'_',num2str(subject_name),...
                '_stop',this_run_name,'.mat'];
            
            onsets=cell(1,num_l1_conds);
            durations=cell(1,num_l1_conds);
            pmodnext_is_go=struct('name','','param',[]);%
            
            %pmod_conds=struct('includconds',[1 2 3 4],'pmodnames',{{'go'}},'pmodmatchconds',{{[1 2]}});%
            %pmod_conds(2)=struct('includconds',[5 6 7 8],'pmodnames',{{'go' 'good' 'interaction' 'next_is_go'}},'pmodmatchconds',{{[5 6], [5 8]}});%%
            %
            for(cond_i = 1:(num_l1_conds-1))%
               include_these_conds = pmod_conds(cond_i).includeconds;%
               onsets{cond_i} = multicondSRC(subject_index==subject_name & ...%
                   run_index==run_num & ...%
                   ismember(condition_index, include_these_conds), onset_col)/1000;%
               durations{cond_i} = multicondSRC(subject_index==subject_name & ...%
                   run_index==run_num & ...%
                   ismember(condition_index, include_these_conds), duration_col)/1000;%
               theseConditions = multicondSRC(subject_index==subject_name & ...%
                   run_index==run_num & ...%
                   ismember(condition_index, include_these_conds), cond_num_col);%
               if(conds_as_pmods)
                   pmod(cond_i).name = pmod_conds(cond_i).pmodnames;%
                   for(pmodname_i = 1:length(pmod(cond_i).name))%
                       if (strcmp(pmod(cond_i).name(pmodname_i), 'interaction'))%
                           %not very flexible but fine for now%
                           condition_matches1 = ismember(theseConditions, pmod_conds(cond_i).pmodmatchconds{pmodname_i-2});%
                           condition_matches2 = ismember(theseConditions, pmod_conds(cond_i).pmodmatchconds{pmodname_i-1});%
                           pmod(cond_i).param{pmodname_i} = condition_matches1 .* condition_matches2;%
                           pmod(cond_i).poly{pmodname_i} = 1;%
                       elseif (strcmp(pmod(cond_i).name(pmodname_i), 'next_is_go'))%
                           %not very flexible but fine for now%
                           goindex=find(strcmp(pmod_conds(cond_i).pmodnames, 'go'));%
                           go_matches = ismember(theseConditions, pmod_conds(cond_i).pmodmatchconds{goindex});%
                           next_is_go = [go_matches(2:length(go_matches)); .5]; % .5 because we don't know what decision comes after the last one%
                           %and -.5 because we want to center it%
                           pmod(cond_i).param{pmodname_i} = next_is_go - 0.5;%
                           pmod(cond_i).poly{pmodname_i} = 1;%
                       elseif (strcmp(pmod(cond_i).name(pmodname_i), 'switch'))%
                           goindex=find(strcmp(pmod_conds(cond_i).pmodnames, 'go'));%
                           go_matches = ismember(theseConditions, pmod_conds(cond_i).pmodmatchconds{goindex});%
                           go_matches_short = go_matches(1:(length(go_matches)-1));%
                           next_is_go = go_matches(2:length(go_matches));%
                           switched = go_matches_short ~= next_is_go;%
                           pmod(cond_i).param{pmodname_i} = [switched; .5] - 0.5; %-.5 to center%
                           pmod(cond_i).poly{pmodname_i} = 1;%
                       else%
                           condition_matches = ismember(theseConditions, pmod_conds(cond_i).pmodmatchconds{pmodname_i});
                           pmod(cond_i).param{pmodname_i} = condition_matches - 0.5; %-.5 to center%
                           pmod(cond_i).poly{pmodname_i} = 1;%
                       end%
                   end%
               end
            end%
            run_end_time_s=multicondSRC(subject_index==subject_name & ...
                run_index==run_num, game_end_col)/1000;
            onsets{game_end_cond_num}=unique(run_end_time_s);
            durations{game_end_cond_num}=0;
            
            penalty_dec_onsets=multicondSRC(subject_index==subject_name & ...
                run_index==run_num & ...
                condition_index==9,onset_col)/1000;
            penalty_out_onsets=multicondSRC(subject_index==subject_name & ...
                run_index==run_num & ...
                condition_index==10,onset_col)/1000;
            if(~isempty(penalty_dec_onsets))
                if(isempty(penalty_out_onsets))
                    error('Has penalty decisions, but not outcomes');
                end
                onsets{game_end_cond_num+1}=penalty_dec_onsets;
                onsets{game_end_cond_num+2}=penalty_out_onsets;
                durations{game_end_cond_num+1}=0;
                durations{game_end_cond_num+2}=0;
            end
            if(isempty(penalty_dec_onsets) && ~isempty(penalty_out_onsets))
                error('Has penalty outcomes but not decisions')
            end
            if(isempty(penalty_dec_onsets) && isempty(penalty_out_onsets))
                names=namesraw(1:game_end_cond_num);
            else
                names=namesraw;
            end
            display(['writing to ',output_fname]);
            if(~DRY_RUN)
                if(conds_as_pmods)
                    save([multicond_WriteDir,output_fname],'names','onsets','durations','pmod');
                else
                    save([multicond_WriteDir,output_fname],'names','onsets','durations');
                end
            end
            clear onsets durations pmod;
        end
    end
end

