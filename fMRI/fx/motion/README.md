# Motion scripts

For each of these scripts, carefully check the options in either the associated options text file, or at the top of the script.

Generally, we run the scripts in the following order:

1. process_rp_text/motion_check.r in order to modify the raw motion params and leave them all in one place.
2. integrate_artifact_and_motion.r in order to add trash regressors for manual artifacts.
3. concatenate_rptxt_by_condition.sh in order to join the runs from the same condition (because this is how the fx models are set up).
