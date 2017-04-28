## use fslmerge and fslmaths to merge all standardized fieldmaps into one file and then average them to use with subjects who are missing a fieldmap 
## paste the following into the terminal:
#load fsl module (if running on the grid)
#module load fsl
#
#go to fmaps directory
cd /Users/ralph/Documents/tds/fMRI/subjects/avg_fmap/fmaps
#
# Merge field maps
echo merging fmaps
fslmerge -t merged_field_maps_TDS 101_fieldmap_hz_standard 102_fieldmap_hz_standard 104_fieldmap_hz_standard 105_fieldmap_hz_standard 106_fieldmap_hz_standard 108_fieldmap_hz_standard 109_fieldmap_hz_standard 110_fieldmap_hz_standard 111_fieldmap_hz_standard 113_fieldmap_hz_standard 114_fieldmap_hz_standard 115_fieldmap_hz_standard 116_fieldmap_hz_standard 117_fieldmap_hz_standard 119_fieldmap_hz_standard 120_fieldmap_hz_standard 121_fieldmap_hz_standard 122_fieldmap_hz_standard 124_fieldmap_hz_standard 125_fieldmap_hz_standard 126_fieldmap_hz_standard 127_fieldmap_hz_standard 128_fieldmap_hz_standard 129_fieldmap_hz_standard 130_fieldmap_hz_standard 131_fieldmap_hz_standard 132_fieldmap_hz_standard 133_fieldmap_hz_standard 134_fieldmap_hz_standard 135_fieldmap_hz_standard 136_fieldmap_hz_standard 137_fieldmap_hz_standard 139_fieldmap_hz_standard 140_fieldmap_hz_standard 141_fieldmap_hz_standard 142_fieldmap_hz_standard 144_fieldmap_hz_standard 145_fieldmap_hz_standard 146_fieldmap_hz_standard 150_fieldmap_hz_standard 151_fieldmap_hz_standard 152_fieldmap_hz_standard 155_fieldmap_hz_standard 156_fieldmap_hz_standard 157_fieldmap_hz_standard 158_fieldmap_hz_standard 159_fieldmap_hz_standard 160_fieldmap_hz_standard 161_fieldmap_hz_standard 162_fieldmap_hz_standard 163_fieldmap_hz_standard 164_fieldmap_hz_standard 165_fieldmap_hz_standard 167_fieldmap_hz_standard 168_fieldmap_hz_standard 169_fieldmap_hz_standard 170_fieldmap_hz_standard 171_fieldmap_hz_standard 172_fieldmap_hz_standard 173_fieldmap_hz_standard 174_fieldmap_hz_standard 175_fieldmap_hz_standard 177_fieldmap_hz_standard 179_fieldmap_hz_standard 181_fieldmap_hz_standard 182_fieldmap_hz_standard 183_fieldmap_hz_standard 184_fieldmap_hz_standard 185_fieldmap_hz_standard 186_fieldmap_hz_standard 187_fieldmap_hz_standard 188_fieldmap_hz_standard 190_fieldmap_hz_standard 192_fieldmap_hz_standard 193_fieldmap_hz_standard 194_fieldmap_hz_standard 195_fieldmap_hz_standard 196_fieldmap_hz_standard 197_fieldmap_hz_standard 
#
# Do not include participant with missing field map

# Average field maps
echo creating average fmap
fslmaths merged_field_maps_TDS -Tmean average_field_map_TDS
echo finished