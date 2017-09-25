# How to use contrast scripts on Talapas

Talapas is a SLURM cluster at the University of Oregon.

## Custom contrast maker

`fx_ylg_allconds_custom_contrast_maker.m`

Each participant's first level model may have a different number of columns in the design matrix due to the presence or absence of error trials (when neither a go nor stop is pressed). The script `fx_ylg_allconds_custom_contrast_maker.m` takes a contrast template and then for each subject examines the multiple condition file to see how many, and where, extra `0`s are required in order to make your contrasts fit the design matrix. 

This script requires you to update several paths. Here's the header of that file showing what could be changed:

```
multicondDir='/where/your/multiconds/are/'; %those that generated the fx models
contrastJobMat='/where/your/contrast/template/is/'; %this shouldn't account for error trial columns
outputDir='/where/you/want/contrasts/saved/to/'; %it should be an empty directory that exists
outprefix='fx_ylg_allconds_'; #contrast file prefix
outpostfix='.mat'; #and postfix
outcomeCSV=fullfile(outputDir, 'multicondinfo-base.csv'); #a csv file you can use for QC  
excludeThese={'101' '102' '104' '105' '106' '108' '110' '111' '178' '189' '350' '356'}; %these are your exclusions

numCondsWithoutPenalties=4; %this is the number of conditions when one has no penalty conditions (doesn't include pmods either)
expression='multicond_decout_pmod_(?<pid>[0-9]{3})_stop(?<run>\w+)\.mat';
prefix='multicond_decout_pmod_';
midfix='_stop';
postfix='.mat';
```

This requires a template `.m` file created by SPM which contains all of the contrasts you want without accounting for either penalty trials or motion regressors. These are padded in automatically by the contrast maker.

To run the custom contrast maker, make sure you've cloned the spm-job-scheduler repository and deleted the `spm-job-scheduler/.git` folder so these scripts will be sync'd with the primary TDS repository. Be sure to edit the log file name for the `batch_arbitrary_matlab_script.sh`. You should be in the `contrasts` directory.

```{bash}
$ sbatch spm-job-scheduler/batch_arbitrary_matlab_script.sh fx_ylg_allconds_custom_contrast_maker.m
```

This will leave the contrasts in whatever dir you specified in the file header, and the output (so you can check for errors) in whatever file you specified in the header of the batch bash script.

## Do the contrasting

To actually estimate the contrasts, you need to submit a bunch of matlab jobs. Luckily, there is a script for that. `Open spm-job-scheduler/batch_existing_jobs.sh` and set the log files to go someplace sensible like `output/spm_con-%A_%a.log`.

To run the jobs as a SLURM array job, you need to know how many jobs you have to run. Here's an example where we will run a subset of contrast jobs (just the participants starting with 1):

```{bash}
$ ls -1 sid_batches/fx_ylg_allconds_simple/fx_ylg_allconds_1*mat |wc -l
70
$ sbatch -a 0-70 spm-job-scheduler/batch_existing_jobs.sh sid_batches/fx_ylg_allconds_simple/fx_ylg_allconds_1*.mat
Submitted batch job 136051
```

You can diagnose errors for the jobs by looking at the logs.
