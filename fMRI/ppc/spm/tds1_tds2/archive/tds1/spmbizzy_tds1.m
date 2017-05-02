%% dsn_svpmbatch

% This is just a little interface to spmbatch 
% w/ the options I find most useful.  
% (It's a bear of a function to call from the line)
%
% outputs an spmbatch_jobs folder, the name of which
% should be changed immediately.


% path to the job you want to find/replace stuff in
job = 'realign_coreg_nobet_tds1_template.mat';
%job = 'segment_tds1_template.mat';
%job = 'normalize_tds1_template.mat';

this = '301';

that = {... 
%~(CHANGE ME)~
%'301'
%'302'
%'303'
%'304'
%'306'
%'307'
%'308'
%'309'
%'310'
%'312'
%'313'
%'314'
%'315'
%'316'
%'317'
%'320'
%'321'
%'322'
%'323'
%'324'
%'325'
%'326'
%'327'
%'328'
%'329'
%'330'
%'331'
%'332'
%'333'
%'334'
%'335'
%'336'
%'337'
'340'
%'341'
'342'
'343'

};

% Adrian Imfeld's spmbatch (an enormously efficient alternative to crappy
% matlabbatch code, but probably less icy than good matlabbatch code).

spmbatch('run','no',...             % Should we do these jobs? NO! We goan have to fix the anomalies first...
    'mode','expression',...         % "Everybody stand back."
    'template_job', job, ...        %
    'list','yes',...                % show me what you done 
    'find_str', this, ...        % 
    'replace_str', that);   % 
