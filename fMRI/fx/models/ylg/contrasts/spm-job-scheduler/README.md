# spm-job-scheduler

These scripts help you execute matlab jobs across many participants in a parallelized way. Most of these scripts require you to edit options within the script itself.

- `batch_arbitrary_matlab_script.m` will execute a single script, specified as the first argument
- `batch_spm_job.sh` executes an arbitrary SPM job across many participants, specified in `subject_list.txt`
- `make_sid_matlabbatch.m` the workhorse that deals with the template SPM job
- `spm_job.sh` executes the job for a single sub
- `subject_list.txt` list of subjects

