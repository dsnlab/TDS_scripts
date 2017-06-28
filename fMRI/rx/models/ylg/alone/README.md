outputDir=/Volumes/TDS/nonbids_data/derivatives/fMRI/rx/ylg/alone/tds2_n79/
inputDir=/Volumes/TDS/nonbids_data/derivatives/fMRI/fx/models/ylg/fx_ylg_alone/
scriptDir=/projects/dsnlab/tds/TDS_scripts/fMRI/rx/ylg/alone/tds2_n79/

decision contrasts=
con_0001.nii (decisions-baseline); decisions
con_0002.nii (go-stop decisions); go-stop
con_0003.nii (stop-go decisions); stop-go

outcome contrasts=
con_0004.nii (outcomes-baseline); outcomes
con_0005.nii (good outcomes-baseline); good
con_0006.nii (good go-good stop); good_go-stop
con_0007.nii (good stop-good go); good_stop-go
con_0008.nii (bad outcomes-baseline); bad
con_0009.nii (bad go-bad stop); bad_go-stop
con_0010.nii (bad stop-bad go); bad_stop-go
con_0011.nii (good-bad outcomes); good-bad
con_0012.nii (good go-stop > bad go-stop); good_go-stop_vs_bad_go-stop
con_0013.nii (bad go-stop > good go-stop); bad_go-stop_vs_good_go-stop

n=79,
for analyses that include puberty (i.e., PDS score) as a covariate, n=77 (160 and 174 were missing PDS),
for good_go-stop & good_stop-go pmods, n=77 (135 only went once and crashed; 137 went twice and crashed both times)

subjects=(101 102 104 105 106 108 109 110 111 113 114 115 116 117 119 120 121 122 124 125 126 127 128 129 130 131 132 133 134 135 136 137 139 140 141 142 144 145 146 150 151 152 155 156 157 159 160 161 162 163 164 165 167 168 169 170 171 172 173 174 175 177 178 179 181 182 183 184 185 186 187 188 190 192 193 194 195 196 197)
