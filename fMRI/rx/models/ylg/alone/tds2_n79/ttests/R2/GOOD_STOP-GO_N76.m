% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/ralph/TDS_scripts/fMRI/rx/models/ylg/alone/tds2_n79/ttests/R2/GOOD_STOP-GO_N76_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
