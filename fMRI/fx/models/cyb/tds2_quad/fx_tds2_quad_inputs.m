% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/theresacheng/projects/dsnlab/TDS/TDS_scripts/fMRI/fx/models/cyb/tds2_quad/sid_batches/fx_tds2_quad_job_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
