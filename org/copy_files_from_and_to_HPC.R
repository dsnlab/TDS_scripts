# Copy from PSI server to HPC
rsync -n -aiv -e ssh /Volumes/TDS/nonbids_data/fMRI/subjects/104/ jpfeifer@hpc-ln1.uoregon.edu:/projects/dsnlab/tds/fMRI/subjects_tds2/104/
rsync -aiv -e ssh /Volumes/TDS/nonbids_data/fMRI/subjects/104/ jpfeifer@hpc-ln1.uoregon.edu:/projects/dsnlab/tds/fMRI/subjects_tds2/104/

# Copy from HPC to PSI server
rsync -n -aiv -e ssh jpfeifer@hpc-ln1.uoregon.edu:/projects/dsnlab/tds/fMRI/subjects_tds2/104/ /Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tds2/104_redo2/
rsync -aiv -e ssh jpfeifer@hpc-ln1.uoregon.edu:/projects/dsnlab/tds/fMRI/subjects_tds2/104/ /Volumes/TDS/nonbids_data/derivatives/fMRI/ppc/subjects_tds2/104_redo2/