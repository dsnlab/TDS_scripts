% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/ralph/TDS_scripts/fMRI/rx/models/ylg/alone/tds2_n79/ttests/reduced/09-bad_go-stop_n77_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
