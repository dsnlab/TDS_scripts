#!/bin/bash

# ========================== auto block: outcount ==========================
# data check: compute outlier fraction for each volume
touch out.pre_ss_warn.txt
foreach run ( $runs )
	3dToutcount -automask -fraction -polort 2 -legendre                     \
		pb00.$subj.r$run.tcat+orig > outcount.r$run.1D

	# outliers at TR 0 might suggest pre-steady state TRs
	if ( `1deval -a outcount.r$run.1D"{0}" -expr "step(a-0.4)"` ) then
		echo "** TR #0 outliers: possible pre-steady state TRs in run $run" \
			>> out.pre_ss_warn.txt
	endif
end

# catenate outlier counts into a single time series
cat outcount.r*.1D > outcount_rall.1D

# get run number and TR index for minimum outlier volume
set minindex = `3dTstat -argmin -prefix - outcount_rall.1D\'`
set ovals = ( `1d_tool.py -set_run_lengths $tr_counts                       \
	-index_to_run_tr $minindex` )
# save run and TR indices for extraction of min_outlier_volume
set minoutrun = $ovals[1]
set minouttr  = $ovals[2]
echo "min outlier: run $minoutrun, TR $minouttr" | tee out.min_outlier.txt

