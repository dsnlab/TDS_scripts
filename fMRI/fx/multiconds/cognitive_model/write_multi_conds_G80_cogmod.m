% Be sure to run the R script here first (it updates the
% mat file we get data from for this script):
% 	/home/research/tds/scripts/R/collect_data_for_multi_conds.r
% Paths in this script are set to run from the grid (danbo)

SKIP = [103 107 112 118 123 127 138 143 168 176 189]; % most of these exclusions are just missing fMRI data entirely. 189, however, is just missing stop6-stop8
DRY_RUN = false;

% Columns of matrix are:
%	1 sid, 2 run_index, 3 runtrialindex(1:160),
%	4 YL onset (s),
%	5 Outcome onset (s),
%	6 decision (0.5=go, -0.5=stop),
%   7 outcome (0.5=good, -0.5=bad),
%	8 expected value
%   9 penalty? (1=yes)
%  10 upper 95%
%  11 lower 05%
%  12 CI width (confidence)
%

% Onsets and durations are seconds.
%
multicond_type_name='EV';
sid_col=1;
rid_col=2;
list_of_runs_checklist=3:8;
%run_names={num2str(3:8)};
trial_id_col=3;
%cond_num_col=4;
onsetcol=[4 5];
penaltycol=9;
condswithpmod=[1 2];
pmodcol(1).col={9};
pmodnames(1).name={'pentalty'};
pmodcol(2).col={7 9};
pmodnames(2).name={'good' 'penalty'};
durations=false;
%game_end_col=7;
%cond_err_num=11;
namesraw={...
    'decision','outcome'};
%game_end_cond_num=length(namesraw)-2;
%conds_as_pmods=true;
%num_l1_conds=4;
% pmod_conds=struct('includeconds',[1 2 3 4],'pmodnames',{{'go'}},'pmodmatchconds',{{[1 2]}});
% pmod_conds(2)=struct('includeconds',[5 8], 'pmodnames', {{'go' 'next_is_go' 'switch'}}, 'pmodmatchconds',{{[5]}});
% pmod_conds(3)=struct('includeconds',[6 7],'pmodnames',{{'go' 'next_is_go' 'switch'}},'pmodmatchconds',{{[6]}});


multicond_WriteDir = '/home/research/tds/behavioral/stoplight/cognitive_model/multiconds/';
multicondSRCFileName = '/home/research/tds/behavioral/stoplight/cognitive_model/Emulticond.mat';

load(multicondSRCFileName, 'multicondSRC')
subject_names = unique(multicondSRC(:,sid_col));
run_nums=list_of_runs_checklist;
%run_nums = unique(multicondSRC(:,rid_col));
%condition_nums = unique(multicondSRC(:,cond_num_col));

%if(any(condition_nums==cond_err_num)) error('At least one outcome is "NONE", which is unacceptable.'); end

subject_index = multicondSRC(:,sid_col);
run_index = multicondSRC(:,rid_col);

% TEST the logic
% multicondSRC(subject_index==subject_names(1) & run_index==run_nums(1),:)
% thing=multicondSRC(subject_index==subject_names(1) & run_index==run_nums(3)...
% 	& condition_index == 1,7)

%if(length(names)-1 ~= length(condition_nums)) error('Names and conditions are not of equal length'); end

num_conditions=length(namesraw);

for(sid_i = 1:length(subject_names))
    subject_name = subject_names(sid_i);
    if(~any(subject_name == SKIP) && subject_name < 300)
        if(sum(ismember(list_of_runs_checklist,unique(multicondSRC(subject_index==subject_name,rid_col))))<length(list_of_runs_checklist))
            error(['Participant ',num2str(subject_name),' does not have all runs'])
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
            
            output_fname = ['multicond_',multicond_type_name,'_t',num2str(subject_name),...
                '_stop',this_run_name,'.mat'];
            
            onsets=cell(1,num_conditions);
            durations=cell(1,num_conditions);
            pmod=struct('name','','param',[], 'poly', []);
            
            %pmod_conds=struct('includconds',[1 2 3 4],'pmodnames',{{'go'}},'pmodmatchconds',{{[1 2]}});
            %pmod_conds(2)=struct('includconds',[5 6 7 8],'pmodnames',{{'go' 'good' 'interaction' 'next_is_go'}},'pmodmatchconds',{{[5 6], [5 8]}});
            
            for(cond_i = 1:num_conditions)
                onsets{cond_i} = multicondSRC(subject_index==subject_name & ...
                    run_index==run_num, ...
                    onsetcol(cond_i));
                durations{cond_i} = 0;
                if (ismember(cond_i, condswithpmod))
                    pmod(cond_i).name = pmodnames(cond_i).name;
                    for (pmod_i=1:length(pmodnames(cond_i).name))
                        pmod(cond_i).param{pmod_i} = multicondSRC(subject_index==subject_name & ...
                            run_index==run_num, ...
                            pmodcol(cond_i).col{pmod_i});
                        pmod(cond_i).poly{pmod_i} = 1;
                    end
                end
            end
            names=namesraw;
            
            display(['writing to ',output_fname]);
            if(~DRY_RUN)
                save([multicond_WriteDir,output_fname],'names','onsets','durations','pmod');
            end
            %clear onsets durations pmod;
        end
    end
end


