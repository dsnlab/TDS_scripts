studyDir = '/vxfsvol/home/research/tds/';
load([studyDir 'fMRI/scripts/gPPI/mats/ppi_master_template.mat'])
templateSuffix = '_20160718_cyb';

% Set up template

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Easier parameters to set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P.analysis = 'psy'; % Default is 'psy' which means psycho-phiz. Alternatives are....
P.equalroi = 1; % Default is 1. This is unusual unless you're using sphere ROIs (or some other equal ROI procedure)
P.FLmask = 1; % Default is 0. 
P.extract = 'eig'; % Default is 'mean'
P.Weighted = 0; % Default is 1; Decide whether you want to weight by number of trials
P.contrast = 0; % 
P.CompContrasts = 0; % Default is 1. But contrasts are wonky in this script; you're better off doing it on your own.
P.maskdir = ['/vxfsvol/home/research/tds/fMRI/analysis/ppi/inputStructs']; 
P.Tasks = {'1' 'wait' 'pc' 'ct_2C' 'ct_2P'}; % Choose which conditions you want to interact with the seed timecourse.
% P.Tasks = {'0' 'CorrectGo' 'CorrectStop' 'FailedStop' 'Cue' 'Trash'};

P.SPMver = 12; % Default is 8
% P.method = 'trad'; % Default is 'cond' which lets your interact the seed with conditions separately
% P.VOI2 = 1; % Default is 0. Keep it 0 unles you're doing a phys-phys
% P.Estimate = 0; % Default is 1. Keep it as 1 if you want it to estimate the model.

save([studyDir 'fMRI/scripts/gPPI/mats/ppi_template' templateSuffix '.mat'],'P')

% IMPORTANT DESIGN MATRIX INFO
% Regressors in design matrix are (in this order) for each session:
% Psy for all conds/tasks, PPI for only specified conds/tasks, and phys
% With 3 of 5 tasks specified: 5+3+1 = 9 regressors per run.
