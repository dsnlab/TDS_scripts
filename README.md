# TDS - Teen Decisions Study


The content is grouped by data-type. Analysis code and results is grouped within each modality.

- fMRI: Functional
- sMRI: Structural
- rsMRI: Resting State
- behavioral: Task and self-report measures


## Subject directories and data

In general, we ignore files that contain specific participant data. For example,
csv files in behavioral directories. **You can always add a specific
file** using `git add path/to/file` if you want to version control it.

The subject directories are .gitignored by default. Anything
in these folders should be able to be generated
from raw imaging data and the scripts that are version controlled:

- fMRI/subjects
- sMRI/subjects
- rsfMRI/subjects

The reason is that these directories can very quickly become
very large if you do not ignore the correct file-types, and 
may contain PHI that is not desirable to version control in
even a private repository.
