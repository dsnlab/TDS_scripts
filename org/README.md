# Organization

This contains helpers and information general to the entire projects, such as scripts to add subdirectories that are sub-project specific.

## Dicom Convert

You will run the dicom conversion locally on a machine that has McVerter and parallel installed. We've used Ralph before. You can mount the PSI file server in order to access the raw dicoms, and then you should copy the converted `nii` files back to the proper place on both the PSI file server and, if you need to do analysis, Talapas.

Relevant files are

- `dicom_convert_01-batch_convert_dicoms.sh` which gets options from
- `subject_list.txt` which you can see an example of in `subject_list_template.txt`
- and for each of the lines in that file calls `dicom_convert-convert_dicoms.sh` which has options you should edit
- and which makes use of `tasks_template.txt`.
- After that, you can open RStudio and walk through `dicom_convert_02-move_correct_nii.r` in order to make sure you're using the `nii` files from the correct run if any runs were aborted and restarted.
