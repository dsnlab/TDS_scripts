%% dsn_svpmbatch

% This is just a little interface to spmbatch 
% w/ the options I find most useful.  
% (It's a bear of a function to call from the line)
%
% outputs an spmbatch_jobs folder, the name of which
% should be changed immediately.


% path to the job you want to find/replace stuff in
% 'Realign_Coreg_template_no_bet.mat'
% 'Realign_Coreg_no_bet_G59.mat'
% 'segment_unwarp_only_template.mat'
% 'normalise_to_mni_template.mat'

job = 'fx_G80_vid_outc_template.mat';

this = 't101';

that = {... 
%~(CHANGE ME)~
't101'
't102'
't104'
't105'
't106'
't108'
't109'
't110'
't111'
't113'
't114'
't115'
't116'
't117'
't119'
't120'
't121'
't122'
't124'
't125'
't126'
't127'
't128'
't129'
't130'
't131'
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
't146'
't150'
't151'
't152'
't155'
't156'
't157'
't158'
't159'
't160'
't161'
't162'
't163'
't164'
't165'
't167'
't168'
't169'
't170'
't171'
't172'
't173'
't174'
't175'
't177'
't178'
't179'
't181'
't182'
't183'
't184'
't185'
't186'
't187'
't188'
't189'
't192'
't193'
't194'
't195'
't196'
't197'
};

% Adrian Imfeld's spmbatch (an enormously efficient alternative to crappy
% matlabbatch code, but probably less icy than good matlabbatch code).

spmbatch('run','no',...             % Should we do these jobs? NO! We goan have to fix the anomalies first...
    'mode','expression',...         % "Everybody stand back."
    'template_job', job, ...        %
    'list','yes',...                % show me what you done 
    'find_str', this, ...        % 
    'replace_str', that);   % 