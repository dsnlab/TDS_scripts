studyDir = '/projects/dsnlab/tds/';
fxModelFolder = 'fMRI/analysis/fx/models/ylg/fx_ylg_alone/';
templateSuffix = '_20170720_ylg';

VOIdir = [studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/'];

load([studyDir 'TDS_scripts/fMRI/gPPI/mats/ppi_template' templateSuffix '.mat'])
P.VOI=[VOIdir 'bilat_NAcc_HO_p75.nii'];
P.Region='bilat_NAcc';
save([studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/' P.Region '.mat'],'P');

        %User input required directory of SPM.mat files
        Directory=[studyDir fxModelFolder '101'];
        cd(Directory)
        %User input required (directory same as line 23 above)
        load([studyDir 'fMRI/analysis/ppi/ylg/tds2/inputStructs/' P.Region '.mat'])
        P.subject='101';
        P.directory=Directory;
        %User input required (change analysis to be more specific)
        save([studyDir 'fMRI/analysis/ppi/ylg/tds2/' '101' '/' P.Region '.mat'],'P');
