% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/vxfsvol/home/research/tds/fMRI/scripts/rx/models/ylg/rx_ylg_allconds_1wANOVA_GoDecs_G44_8contrasts_nonindp_implmask_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
