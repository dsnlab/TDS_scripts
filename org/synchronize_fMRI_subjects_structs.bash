#!/bin/bash
rsync -aiv --include="/t[0-9][0-9][0-9]/" --include="/t[0-9][0-9][0-9]/ppc/" --include="/t[0-9][0-9][0-9]/ppc/structurals/" --include="/t[0-9][0-9][0-9]/ppc/structurals/*" --include="/t[0-9][0-9][0-9]/ppc/fmaps/" --include="/t[0-9][0-9][0-9]/ppc/fmaps/*" --exclude="*" /home/research/tds/archive/subjects_G80/ /home/research/tds/fMRI/subjects/
