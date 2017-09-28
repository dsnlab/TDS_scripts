% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/theresacheng/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/cyb/F_2x2_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
