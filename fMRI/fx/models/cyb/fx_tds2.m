% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/ralph/Documents/tds/tds_repo/fMRI/scripts/fx/models/cyb/fx_tds2_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
