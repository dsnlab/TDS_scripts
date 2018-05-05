#!/bin/bash
export PATH=$PATH:/usr/lib/afni/bin/

datadir=/data/jflournoy/TDS/roi_extractions/
fxsubdir=/data/jflournoy/TDS/roi_extractions/raw/
maskfile=/data/jflournoy/TDS/roi_extractions/raw/bilat_NAcc_HO_p75.nii
for d in "${fxsubdir}"*/ ; do
    echo "$d"
    for f in ${d}/con_00*nii ; do
        echo $f
        filename=`basename ${f}`
        folder=`basename ${d}`
        3dmaskdump -mask ${maskfile} -noijk -o ${datadir}/${folder}_${filename}_extract.tsv $f
    done
done
