#!/bin/bash

#Regular expression for subject directory names -- e.g., 3[0-9][0-9] will match names between 300-399. t1[0-9][0-9] would match t100-t199
SIDPATTERN=3[0-9][0-9]
#Folder where structural subject directories live
STRUCTSUBS=/home/research/tds/sMRI/subjects/
#Folder where functional subject directories live
FUNCSUBS=/home/research/tds/fMRI/subjects/

echo "Copying all files matching /$SIDPATTERN/mprage.nii"
echo "from: $STRUCTSUBS"
echo "to: $FUNCSUBS"

rsync -aiv -O --no-perms --no-owner --no-group --include="/$SIDPATTERN/" --include="/$SIDPATTERN/mprage.nii" --exclude="*" $STRUCTSUBS $FUNCSUBS

echo ""
echo "Creating structurals folder"
echo ""

find $FUNCSUBS -regex ".*/$SIDPATTERN\$" -exec mkdir -v -p {}/structurals \;

echo ""
echo "Moving mprage.nii to structurals/mprage.nii"
echo ""

find $FUNCSUBS -regex ".*/3[0-9][0-9]/mprage.nii$" -exec rename -v "s/mprage\.nii/structurals\/mprage.nii/" {} \;
