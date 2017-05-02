% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/ralph/Documents/tds/tds_repo/fMRI/scripts/ppc/spm/tds2/TDS189_coreg_realign_unwarp_coreg_segment_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
