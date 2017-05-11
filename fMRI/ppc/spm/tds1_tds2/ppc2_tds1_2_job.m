% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/ralph/Documents/tds/TDS_scripts/fMRI/ppc/spm/tds1_tds2/ppc2_tds1_2_job_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
