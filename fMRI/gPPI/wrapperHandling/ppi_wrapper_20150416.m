function ppi_wrapper_20150416(regionnumber,firstsubject,lastsubject)

% To run this for your second seed, ppi_wrapper_20150402(2,1,64). It will
% exclude the bad subjects listed below

studyDir = '/vxfsvol/home/research/dsnlab/Studies/Duckees/Duckees_noAR/';
fxModelFolder = 'models/AL_001_2/';
templateSuffix = '_20150416';
exclude = [1 2 28 31 36 42];
%User input required (directories and subjects)
addpath([studyDir 'scripts/gPPI/'])
addpath('/vxfsvol/home/research/dsnlab/matlab/spm8/')
subDir = [studyDir 'subjects/'];
% Subjects={'INC001','INC002','INC003','INC004'};
Subjects={'DK001'
    'DK002'
    'DK003'
    'DK004'
    'DK005'
    'DK006'
    'DK007'
    'DK008'
    'DK009'
    'DK010'
    'DK011'
    'DK012'
    'DK013'
    'DK014'
    'DK015'
    'DK016'
    'DK017'
    'DK018'
    'DK019'
    'DK020'
    'DK021'
    'DK022'
    'DK023'
    'DK024'
    'DK025'
    'DK026'
    'DK027'
    'DK028'
    'DK029'
    'DK030'
    'DK031'
    'DK032'
    'DK033'
    'DK034'
    'DK035'
    'DK036'
    'DK037'
    'DK038'
    'DK039'
    'DK040'
    'DK041'
    'DK042'
    'DK043'
    'DK044'
    'DK045'
    'DK046'
    'DK047'
    'DK048'
    'DK049'
    'DK050'
    'DK051'
    'DK052'
    'DK053'
    'DK054'
    'DK055'
    'DK056'
    'DK057'
    'DK058'
    'DK059'
    'DK060'
    'DK061'
    'DK062'
    'DK063'
    'DK064'
    };

VOIdir = [studyDir 'PPI/seeds/'];

%User input required (region files)
%regionfile={[VOIdir 'mOFC_view_blur_0_50_-19_p0001.nii']};

regionfile={[VOIdir 'lPFC_Label_Blur_-42_17_26.nii'] % change these so they're all different
     [VOIdir 'rLPFC_Label_Blur_45_20_20.nii'] 
     [VOIdir 'mOFC_view_blur_0_50_-19_p0001.nii']
     [VOIdir 'l_amyg_view_blur_-24_-10_-19.nii']
     [VOIdir 'r_amyg_view_blur_24_-7_-16.nii']
     [VOIdir 'l_amyg_HOanatomical_75.nii']
     [VOIdir 'r_amyg_HOanatomical_75.nii']};

%User input required (region names) These are nicknames you can pick.
%region={'mOFC'};

region={'lLPFC' 'rLPFC8' 'mOFC8' 'lamygVB8' 'ramygVB8' 'lamyg75HO8' 'ramyg75HO8'};

load([studyDir 'scripts/gPPI/mats/ppi_template' templateSuffix '.mat'])
P.VOI=regionfile{regionnumber};
P.Region=region{regionnumber};
save([studyDir 'PPI/inputStructs/' region{regionnumber} '.mat'],'P');

for i=firstsubject:lastsubject;
    if find(exclude==i)
        % do nothing
    else
        %User input required directory of SPM.mat files
        Directory=[subDir Subjects{i} '/' fxModelFolder];
        cd(Directory)
        %User input required (directory same as line 23 above)
        load([studyDir 'PPI/inputStructs/' region{regionnumber} '.mat'])
        P.subject=Subjects{i};
        P.directory=Directory;
        %User input required (change analysis to be more specific)
        save([subDir Subjects{i} '/ppi/' region{regionnumber} '.mat'],'P');
        PPPI([subDir Subjects{i} '/ppi/' region{regionnumber} '.mat']);
    end
end
end
