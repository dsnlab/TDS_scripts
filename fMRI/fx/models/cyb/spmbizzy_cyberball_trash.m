%% DSN_spmbatch

% This is just a little interface to spmbatch 
% w/ the options I find most useful.  
% (It's a bear of a function to call from the line)
%
% outputs an spmbatch_jobs folder, the name of which
% should be changed immediately.


% path to the job you want to find/replace stuff in

job = '/vxfsvol/home/research/tds/scripts/batch/fx/fx_G80_cyb/fx_G80_cyb_Fcontrasts_derivatives_trash.mat';

this = 't113';

that = {... 
%~(CHANGE ME)~
'115'
'117'
'119'
'121'
'129'
'130'
'132'
'133'
'134'
'135'
'136'
'137'
'139'
'140'
'141'
'142'
'144'
'145'
'150'
'151'
'158'
'159'
'160'
'163'
'164'
'165'
'168'
'169'
'170'
'171'
'172'
'173'
'175'
'177'
'181'
'183'
'184'
'185'
'186'
'187'
'188'
'189'
'192'
'196'

};

% Adrian Imfeld's spmbatch (an enormously efficient alternative to crappy
% matlabbatch code, but probably less icy than good matlabbatch code).

spmbatch('run','no',...            % Should we do these jobs? NO! We goan have to fix the anomalies first...
    'mode','expression',...        % "Everybody stand back."
    'template_job', job, ...       %
    'list','yes',...               % show me what you done 
    'find_str', this, ...        % 
    'replace_str', that);   % 