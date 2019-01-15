% List of open inputs
nrun = 1; % enter the number of runs here
jobfile = {'/projects/dsnlab/tds/TDS_scripts/fMRI/rx/models/cyb/sensitivity_analyses/med_mental_hpc_F_conj_pmod_flexi_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
