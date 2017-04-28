cd('/vxfsvol/home/research/tds/fMRI/subjects')

subjects = { 
 't113'
%'t114'
%'t115'
%'t116'
%'t117'
%'t119'
%'t121'
%'t125'
%'t126'
%'t127'
%'t128'
%'t129'
%'t130'
%'t131'
%'t132'
%'t133'
%'t134'
%'t135'
%'t136'
%'t137'
%'t139'
%'t140'
%'t141'
%'t142'
%'t144'
%'t145'
%'t146'
%'t150'
%'t151'
%'t152'
%'t155'
%'t156'
%'t157'
%'t158'
%'t159'
%'t160'
%'t161'
%'t162'
%'t163'
%'t164'
%'t165'
%'t167'
%'t168'
%'t169'
%'t170'
%'t171'
%'t172'
%'t173'
%'t174'
%'t175'
%'t177'
%'t179'
%'t181'
%'t182'
%'t183'
%'t184'
%'t185'
%'t186'
%'t187'
%'t188'
%'t189'
%'t190'
%'t192'
%'t193'
%'t196'
    };

for s=1:length(subjects)
    cd([subjects{s} '/fx/cyb/noderivatives/newPT_excVfp/'])
    
    load('SPM.mat')
    save('SPM_oldPath.mat','SPM')
    
    %for i=1:size(SPM.xY.VY,1)
        a=SPM.xY.VY(i).fname; % Change SPM.xY.VY
        a=[a(1:27) 'fMRI/subjects' a(40:49) a(62:84)];
        SPM.xY.VY(i).fname=a;
    end
    
    editedArray = char(size(SPM.xY.P,1),73);
    for i=1:size(SPM.xY.P,1)
        a=SPM.xY.P(i,:);
        SPM.xY.P(i,1:73)=[a(1:27) 'fMRI/subjects' a(40:49) a(62:84)];% Change SPM.xY.P
    end
    
     SPM.xY.P = editedArray; 
     
%     SPM.swd(10:13) = 'NIBL'; % Change SPM.swd
    save('SPM.mat','SPM')
    cd ../../../..
end