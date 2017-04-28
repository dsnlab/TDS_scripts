FreeSurfer 5.3 estimates thickness, surface area and volume for the brain. Steps for analyzing data in FreeSurfer include:

Data processing:
1. Run recon-all to estract all morphological data
	a. Using job_autorecon.sh, batch_autorecon.sh, subject_list.txt and SetUpFreeSurfer.sh
2. Quality check data for motion and errors in FreeSurfer output
3. Re-run analyses if necessary to correct for motion and poor surface reconstructions.

Data analyses:
1. Extract data for vertex and/or parcellated regions for use in other statistical programs (i.e. can import into R and run your own analyses).  Can also create your own ROI (based on combining different parcellations, manually "drawing" regions in FreeSurfer, or importing functional ROIs)
2. Run vertex-wise analyses within FreeSurfer (using qdec) - basic general linear modelling, allows for correction using FDR and monte-carlo simulations. 
3. Run more complex (i.e. LMM) vertex-wise analyses using other toolboxes (i.e. SurfStat, LMM FreeSurfer toolbox for Matlab) 
	a. SurfStat runs mass univariate stats and provides FDR and RFT correction options
	b. FreeSurfer LMM toolbox runs both mass univariate and statiotemporal models (clusters based on similar covariance matrices in neighbouring vertices), but only correct using FDR 
