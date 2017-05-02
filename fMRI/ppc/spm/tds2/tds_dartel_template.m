% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/ralph/Documents/tds/tds_repo/fMRI/scripts/ppc/spm/tds2/tds_dartel_template_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
