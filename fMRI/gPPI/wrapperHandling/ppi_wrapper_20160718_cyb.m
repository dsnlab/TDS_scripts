spm fmri
function ppi_wrapper_20170720_ylg(regionnumber,firstsubject,lastsubject)

% To run this for your second seed, ppi_wrapper_20150402(2,1,64). It will
% exclude the bad subjects listed below

studyDir = '/projects/dsnlab/tds/fMRI/analysis/fx/models/ylg/fx_ylg_alone/';
fxModelFolder = '';
templateSuffix = '_20170720_ylg';
exclude = [];
%User input required (directories and subjects)
addpath([studyDir 'TDS_scripts/fMRI/'])
addpath('/vxfsvol/home/research/dsnlab/matlab/spm8/')
subDir = [studyDir 'fMRI/subjects/'];
% Subjects={'INC001','INC002','INC003','INC004'};
Subjects={
't113'
't114'
't115'
't116'
't117'
't119'
't121'
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
't190'
't192'
't193'
't196'
    };

VOIdir = [studyDir 'fMRI/analysis/ppi/inputStructs'];

%User input required (region files)
regionfile={[VOIdir '/' '4mmS_n22_52_22_LdlPFC.nii']
    [VOIdir '/' '4mmS_0_44_36_dmPFC.nii']
    [VOIdir '/' '4mmS_4_32_n6_vACC.nii']
    [VOIdir '/' '4mmS_48_26_n10_RvlPFC.nii']
    [VOIdir '/' '4mmS_56_n24_n8_RSTS.nii']
    [VOIdir '/' '4mmS_2_54_18_vmPFC.nii']
    [VOIdir '/' '4mmS_n8_6_38_dACC.nii']
    [VOIdir '/' '4mmS_24_38_46_RdlPFC.nii']
    [VOIdir '/' '4mmS_n44_20_n10_LvlPFC.nii']
   [VOIdir '/' '4mmS_n8_6_38_dACC.nii'] };

% regionfile={[VOIdir 'mOFC_view_blur_0_50_-19_p0001.nii'] % change these so they're all different
%     [VOIdir 'mOFC_view_blur_0_50_-19_p0001.nii']
%     [VOIdir 'mOFC_view_blur_0_50_-19_p0001.nii']  };

%User input required (region names) These are nicknames you can pick.
region={'LdlPFC', 'dmPFC','vACC','RvlPFC','RSTS','vmPFC','dACC','RdlPFC', 'LvlPFC', 'dACC2'};
% region={'mOFC' 'VS' 'occipital'};

load([studyDir 'fMRI/scripts/gPPI/mats/ppi_template' templateSuffix '.mat'])
P.VOI=regionfile{regionnumber};
P.Region=region{regionnumber};
save([studyDir 'fMRI/analysis/ppi/inputStructs/' region{regionnumber} '.mat'],'P');

for i=firstsubject:lastsubject;
    if find(exclude==i)
        % do nothing
    else
        %User input required directory of SPM.mat files
        Directory=[subDir Subjects{i} '/' fxModelFolder];
        cd(Directory)
        %User input required (directory same as line 23 above)
        load([studyDir 'fMRI/analysis/ppi/inputStructs/' region{regionnumber} '.mat'])
        P.subject=Subjects{i};
        P.directory=Directory;
        %User input required (change analysis to be more specific)s
        save([subDir Subjects{i} '/' 'ppi/' region{regionnumber} '.mat'],'P');
        [subDir Subjects{i} '/' 'ppi/' region{regionnumber} '.mat'] %did this get accidentally added?
        PPPI([subDir Subjects{i} '/' 'ppi/' region{regionnumber} '.mat']);
    end
end
end
