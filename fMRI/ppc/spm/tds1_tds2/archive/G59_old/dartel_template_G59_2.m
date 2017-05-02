% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/vxfsvol/home/research/tds/scripts/batch/spm_ppc/dartel_template_G59_2_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
