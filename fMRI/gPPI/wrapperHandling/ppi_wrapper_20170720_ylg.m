function ppi_wrapper_20170720_ylg(regionnumber,firstsubject,lastsubject)

% To run this for your second seed, ppi_wrapper_20150402(2,1,64). It will
% exclude the bad subjects listed below

studyDir = '/projects/dsnlab/tds/';
fxModelFolder = 'fMRI/analysis/fx/models/ylg/fx_ylg_alone/';
templateSuffix = '_20170720_ylg';
exclude = [];
%User input required (directories and subjects)
addpath([studyDir 'TDS_scripts/fMRI/'])
addpath('/projects/dsnlab/spm8/')
%subDir = [studyDir 'fMRI/subjects_tds2/'];
% Subjects={'INC001','INC002','INC003','INC004'};
Subjects={
'101'
'102'
'104'
'105'
'106'
'108'
'109'
'110'
'111'
'113'
'114'
'115'
'116'
'117'
'119'
'120'
'121'
'122'
'124'
'125'
'126'
'127'
'128'
'129'
'130'
'131'
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
'146'
'150'
'151'
'152'
'155'
'156'
'157'
'159'
'160'
'161'
'162'
'163'
'164'
'165'
'167'
'168'
'169'
'170'
'171'
'172'
'173'
'174'
'175'
'177'
'178'
'179'
'181'
'182'
'183'
'184'
'185'
'186'
'187'
'188'
'190'
'192'
'193'
'194'
'195'
'196'
'197'
    };

VOIdir = [studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/'];

%User input required (region files)
regionfile={[VOIdir 'L_NAcc_p75.nii']
    [VOIdir 'R_NAcc_p75.nii']
    };

%User input required (region names) These are nicknames you can pick.
region={'L_NAcc', 'R_NAcc'};

load([studyDir 'TDS_scripts/fMRI/gPPI/mats/ppi_template' templateSuffix '.mat'])
P.VOI=regionfile{regionnumber};
P.Region=region{regionnumber};
save([studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/' region{regionnumber} '.mat'],'P');

for i=firstsubject:lastsubject;
    if find(exclude==i)
        % do nothing
    else
        %User input required directory of SPM.mat files
        Directory=[studyDir fxModelFolder Subjects{i}];
        cd(Directory)
        %User input required (directory same as line 23 above)
        load([studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/' region{regionnumber} '.mat'])
        P.subject=Subjects{i};
        P.directory=Directory;
        %User input required (change analysis to be more specific)
        save([studyDir 'fMRI/analysis/ppi/ylg/tds2/' Subjects{i} '/' region{regionnumber} '.mat'],'P');
        PPPI([studyDir 'fMRI/analysis/ppi/ylg/tds2/' Subjects{i} '/' region{regionnumber} '.mat']);
    end
end
end
