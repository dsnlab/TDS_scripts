#!/bin/bash
#$ -cwd
#$ -j y
#$ -N FmapAvgFslPrep_TDS
#$ -o /Users/ralph/Documents/tds/fMRI/subjects/avg_fmap/logs
#$ -S /bin/bash
#$ -V
#
############################################################################
# Takes subject ID as input and prepares struct and fieldmap (standard Siemens double-echo) for group-averaging.
# KGB 12.01.2016 edited KJ 03.23.2017 re-edited ZO 04.17.2017
############################################################################
#
#Define variables and directories
subjects=(101 102 104 105 106 108 109 110 111 113 114 115 116 117 119 120 121 122 124 125 126 127 128 129 130 131 132 133 134 135 136 137 139 140 141 142 144 145 146 150 151 152 155 156 157 159 160 161 162 163 164 165 167 168 169 170 171 172 173 174 175 177 179 181 182 183 184 185 186 187 188 190 193 194 195 196 197)
# N = 77, subjects excluded: 
#189 (excessive head motion), 
#158 (excessive dropout), 
#178 (missing fmap), 
#192 (fmap in different space compared with stop3+stop4)
RootDir=/projects/dsnlab/tds/fMRI/subjects_tds2/avg_fmap

for s in ${subjects[@]};
do
	echo $s
	StrucDir=$RootDir/$s/structurals #Assign folder of structural for average
	FuncDir=$RootDir/$s/fmaps #Assign folder of fieldmaps for average
	#
	##
	# Put structural into standard orientation for FSL
	echo -------------------------------------
	echo Struct Orientation
	cd $StrucDir/
	fslreorient2std mprage mprage_oriented
	#
	##
	# Register structural to MNI standard space
	echo -------------------------------------
	echo Struct Registration
	cd $StrucDir/
	flirt -in mprage_oriented -ref /projects/dsnlab/SPM12/canonical/avg152T1 -omat highres2std.mat
	#
	##
	# Register fieldmap magnitude image to structural
	echo -------------------------------------
	echo Fmap Registration to Struct
	cd $FuncDir/
	flirt -in fieldmap_01 -ref $StrucDir/mprage_oriented -omat fm2highres.mat
	#
	# #
	# Combine transforms from the two registrations
	echo -------------------------------------
	echo Combine Transforms
	convert_xfm -omat $FuncDir/fm2std.mat -concat $StrucDir/highres2std.mat $FuncDir/fm2highres.mat
	# 
	# #
	# Apply transformation to fieldmaps (fpm_* is the output of the SPM12 Calculate VDM module that represents precalculated fieldmap in Hz)
	# See http://www.fil.ion.ucl.ac.uk/spm/download/toolbox/FieldMap2/FieldMap_Manual_280207.pdf
	echo -------------------------------------
	echo Apply Transform
	cd $FuncDir/
	flirt -in fpm_scfieldmap -ref /projects/dsnlab/SPM12/canonical/avg152T1 -out fieldmap_hz_standard -applyxfm -init fm2std.mat
	#
	# #
	# Copy standardized fieldmap to fmaps directory
	echo -------------------------------------
	echo Copy Standardized Fieldmaps
	cp $FuncDir/fieldmap_hz_standard.nii.gz $RootDir/standard_fmaps/ # this folder needs to be created manually
	cd $RootDir/standard_fmaps/
	mv fieldmap_hz_standard.nii.gz ${s}_fieldmap_hz_standard.nii.gz
	echo -------------------------------------
	echo $s Fmaps Prepped
	echo -------------------------------------
done