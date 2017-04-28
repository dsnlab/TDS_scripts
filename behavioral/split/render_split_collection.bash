#!/bin/bash
module add R/3.3.1-shlib-tcltk
Rscript -e "library(rmarkdown);render('split_collection.r', output_dir='/home/research/tds/behavioral/processed/split/')"

