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
't115'
't117'
't119'
't121'
't129'
't130'
't132'
't133'
't134'
't135'
't136'
't137'
't139'
't140'
't141'
't142'
't144'
't145'
't150'
't151'
't158'
't159'
't160'
't163'
't164'
't165'
't168'
't169'
't170'
't171'
't172'
't173'
't175'
't177'
't181'
't183'
't184'
't185'
't186'
't187'
't188'
't189'
't192'
't196'
};

% Adrian Imfeld's spmbatch (an enormously efficient alternative to crappy
% matlabbatch code, but probably less icy than good matlabbatch code).

spmbatch('run','no',...            % Should we do these jobs? NO! We goan have to fix the anomalies first...
    'mode','expression',...        % "Everybody stand back."
    'template_job', job, ...       %
    'list','yes',...               % show me what you done 
    'find_str', this, ...        % 
    'replace_str', that);   % 