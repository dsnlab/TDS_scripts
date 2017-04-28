# This script copies the clean .nii files needed to create the average fmap.
# For each subject (with fmap), clean fmap and mprage .nii files will be used
# to create an average fmap, to be used for subjects without an fmap.
#
# Created by Zdena Op de Macks (4/17/2017)
subjects=(101 102 104 105 106 108 109 110 111 113 114 115 116 117 119 120 121 122 124 125 126 127 128 129 130 131 132 133 134 135 136 137 139 140 141 142 144 145 146 150 151 152 155 156 157 158 159 160 161 162 163 164 165 167 168 169 170 171 172 173 174 175 177 179 181 182 183 184 185 186 187 188 189 190 192 193 194 195 196 197)
RootDir=/Users/ralph/Documents/tds/fMRI/subjects/avg_fmap

for s in ${subjects[@]};
do
	echo $s
	cd $RootDir
	mkdir $s
	cd $s
	mkdir fmaps
	mkdir structurals
	echo directories created
	cd /Volumes/TDS/clean_nii/fMRI/subjects/$s/fmaps
	cp fieldmap.nii $RootDir/$s/fmaps/
	cp fieldmap_01.nii $RootDir/$s/fmaps/
	echo raw fmaps copied
	cd /Users/ralph/Documents/tds/fMRI/subjects/$s/fmaps
	cp fpm_scfieldmap.nii.gz $RootDir/$s/fmaps/
	echo processed fmap copied
	cd /Volumes/TDS/clean_nii/fMRI/subjects/$s/structurals
	cp mprage.nii $RootDir/$s/structurals/
	echo mprage copied
	echo $s finished
done