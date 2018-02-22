# Scoring Qualtrics Data

The file `questionnaire_data_and_descriptives.Rmd` demonstrates how to use the package [`scorequaltrics`](https://github.com/jflournoy/qualtrics) to retrieve and score the qualtrics data. It also scores all of the data we currently have, displays some descriptive statistics about the data in graphical form (and if possible, outputs text describing psychometric properties like internal consistency measures), and writes scored scale data to csv files. 

You can use this script to rescore the data if necessary (modifying paths, and most likely stepping through the script in R Studio chunk-by-chunk), or as a guide for pulling and scoring just the data that you care about as part of your own scripts.

The workflow in the scoring Rmd file roughly follows: download data, scoring and recoding rubrics → recode items → remove duplicates and test cases → apply scoring rubrics and scale-specific scoring functions → generate descriptive output.
