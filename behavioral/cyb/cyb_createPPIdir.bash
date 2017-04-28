#!/bin/bash

# This script deletes unnecessary files


cd /vxfsvol/home/research/tds/behavioral/raw/cyberball

subj=`cat SubjectList_full.txt`

for i in $subj;
    do 
    	mkdir /vxfsvol/home/research/tds/fMRI/subjects/$i/ppi
    	echo made ppi directory in $i folder!
    done