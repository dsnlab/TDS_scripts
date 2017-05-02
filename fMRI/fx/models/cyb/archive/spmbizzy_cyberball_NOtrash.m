%% DSN_spmbatch

% This is just a little interface to spmbatch 
% w/ the options I find most useful.  
% (It's a bear of a function to call from the line)
%
% outputs an spmbatch_jobs folder, the name of which
% should be changed immediately.


% path to the job you want to find/replace stuff in

job = '/vxfsvol/home/research/tds/scripts/batch/fx/fx_G80_cyb/fx_G80_cyb_Fcontrasts_derivatives_NOtrash.mat';

this = 't114';

that = {... 
%~(CHANGE ME)~
't116'
't125'
't126'
't127'
't128'
't131'
't146'
't152'
't155'
't156'
't157'
't161'
't162'
't167'
't174'
't179'
't182'
't193'
};

% Adrian Imfeld's spmbatch (an enormously efficient alternative to crappy
% matlabbatch code, but probably less icy than good matlabbatch code).

spmbatch('run','no',...            % Should we do these jobs? NO! We goan have to fix the anomalies first...
    'mode','expression',...        % "Everybody stand back."
    'template_job', job, ...       %
    'list','yes',...               % show me what you done 
    'find_str', this, ...        % 
    'replace_str', that);   % 