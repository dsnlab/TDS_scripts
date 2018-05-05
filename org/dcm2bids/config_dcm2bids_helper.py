# This is the configuration file for the dcm2bids_helper script,
# which will use the dcm2bids_helper to create json files
# for use in creating the study specific configuration file
#
# See the dcm2Bids repo for instructions to create the config file:
# https://github.com/cbedetti/Dcm2Bids
#
# More detailed instructions on san wiki:
# https://uosanlab.atlassian.net/wiki/spaces/SW/pages/44269646/Convert+DICOM+to+BIDS

import os

######################## CONFIGURAGBLE PART BELOW ########################
# Set study info (may need to change for your study)
group = "dsnlab"
study = "tds"
gitrepo = "dcm2bids"
test_subject = "110_20141107" # Name of a directory that contains DICOMS for one participant

dicomdir = os.path.join(os.sep, "projects", "lcni", "dcm", group, "TDS")
singularity_image =  os.path.join(os.sep, "projects", group, "shared", "BIDS", "Dcm2Bids-master.simg")

# Set directories
niidir = os.path.join(os.sep, "projects", group, "shared", study, "archive", "clean_nii")
codedir =  os.path.join(os.sep, "projects", group, "shared", study, "TDS_scripts", "org", gitrepo)
logdir = os.path.join(codedir, "logs_helper")

outputlog = os.path.join(logdir, "outputlog_helper.txt")
errorlog = os.path.join(logdir, "errorlog_helper.txt")
