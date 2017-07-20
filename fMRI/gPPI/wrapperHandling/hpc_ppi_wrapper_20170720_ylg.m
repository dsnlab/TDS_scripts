studyDir = '/projects/dsnlab/tds/';
fxModelFolder = 'fMRI/analysis/fx/models/ylg/fx_ylg_alone/';
templateSuffix = '_20170720_ylg';

VOIdir = [studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/'];

%User input required (region files)
regionfile={[VOIdir 'bilat_NAcc_HO_p75.nii']
    };

%User input required (region names) These are nicknames you can pick.
region={'bilat_NAcc'};

load([studyDir 'TDS_scripts/fMRI/gPPI/mats/ppi_template' templateSuffix '.mat'])
P.VOI=regionfile{regionnumber};
P.Region=region{regionnumber};
save([studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/' region{regionnumber} '.mat'],'P');

        %User input required directory of SPM.mat files
        Directory=[studyDir fxModelFolder '101'];
        cd(Directory)
        %User input required (directory same as line 23 above)
        load([studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/' region{regionnumber} '.mat'])
        P.subject='101';
        P.directory=Directory;
        %User input required (change analysis to be more specific)
        save([studyDir 'fMRI/analysis/ppi/ylg/tds2/' '101' '/' region{regionnumber} '.mat'],'P');
        PPPI([studyDir 'fMRI/analysis/ppi/ylg/tds2/' '101' '/' region{regionnumber} '.mat']);
