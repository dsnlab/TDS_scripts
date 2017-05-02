%% dsn_svpmbatch

% This is just a little interface to spmbatch 
% w/ the options I find most useful.  
% (It's a bear of a function to call from the line)
%
% outputs an spmbatch_jobs folder, the name of which
% should be changed immediately.


% path to the job you want to find/replace stuff in
job = 'realign_coreg_nobet_tds3_template.mat';
%job = 'segment_tds3_template.mat';
%job = 'normalize_tds3_template.mat';

this = '401';

that = {... 
%~(CHANGE ME)~
'401'
'405'
};

% Adrian Imfeld's spmbatch (an enormously efficient alternative to crappy
% matlabbatch code, but probably less icy than good matlabbatch code).

spmbatch('run','no',...             % Should we do these jobs? NO! We goan have to fix the anomalies first...
    'mode','expression',...         % "Everybody stand back."
    'template_job', job, ...        %
    'list','yes',...                % show me what you done 
    'find_str', this, ...        % 
    'replace_str', that);   % 
