# The process_qualtrics_data.r script calls on this script. To extract qualtrics data for TDS-2 and TDS-3,
# change the module to 'TDS2'. To extract qualtrics data for TDS-1, change the module to 'TDS1' and
# specify which surveys you want to download: pre- or post-approval.

### CHANGE ME ###
module <- 'TDS1-Post'
#################

if (module == 'TDS2 and TDS3'){
  survey_name_filter <- 'TDS2.*' # survey name filter as a regular expression
  survey_name_dont_match <- '.*(Session 3).*|.*SHORTENED.*'
  sid <- 'SID' # subject ID variable name as a regular expression
  age_var <- 'Age' # age variable name. If NA, we skip these steps below
  gender_var <- 'Gender' # gender variable name. If NA, we skip these steps below
  gender_female <- 1 # value for female
  gender_male <- 0 # value for male
  pdss_gender_code <- c(m=gender_male, f=gender_female)
  gender_mix <- 'mf' #'mf' for both M and F, 'm' for M only, 'f' for F only
  exclude_SID <- c('', '999') # subject IDs to exclude
  identifiableData <- '(DOB|Ethnicity|Work|Grade|School|TEXT|Addl_Probs|Reasons|Decribe|Concerns|BestThings|Describe|Started|Ended)' # exclude when printing duplicates
  hasCBCL <- 1 # does the survey include CBCL?
  hasRPI <- 1 # does this survey include RPI?
  hasPDSS <- 1 # does this survey include PDSS?
  csv_files <- c('/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/CARE_Social_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/RPI_scoring_rubric_1.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/BFNE_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/CBCL_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/PAL2_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/ACE_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/RPI_scoring_rubric_2.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/RSQ_scoring_rubric_2.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/CARE-R_WE_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/PDS_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/CARE-R_EI_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/B-SSS_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/CES-DC_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/SPSRQS_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/RSQ_scoring_rubric_1.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/SCARED_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/BIS_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/PEQ_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/NTS_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/UPPSP_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/SES_scoring_rubric.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds2/YRBS_scoring_rubric.csv')
 
  csv_wide_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-2-auto_scored_scales_wide.csv"
  csv_long_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-2-auto_scored_scales_long.csv"
  csv_longRaw_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-2-auto_raw_qualtrics_long.csv"
  csv_wideRaw_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-2-auto_raw_qualtrics-"
}

if (module == 'TDS1-Pre'){
  survey_name_filter <- 'TDS1.*Pre' # survey name filter as a regular expression
  survey_name_dont_match <- '.*Session 3.*|.*SHORTENED.*'
  sid <- 'SID' # subject ID variable name as a regular expression
  age_var <- 'Age' # age variable name. If NA, we skip these steps below
  gender_var <- 'Gender' # gender variable name. If NA, we skip these steps below
  gender_female <- 1 # value for female
  gender_male <- 0 # value for male
  pdss_gender_code <- c(m=gender_male, f=gender_female)
  gender_mix <- 'mf' #'mf' for both M and F, 'm' for M only, 'f' for F only
  exclude_SID <- c('', '999') # subject IDs to exclude
  identifiableData <- '(DOB|Ethnicity|Work|Grade|School|TEXT|Addl_Probs|Reasons|Decribe|Concerns|BestThings|Describe|Started|Ended)' # exclude when printing duplicates
  hasCBCL <- 1 # does the survey include CBCL?
  hasRPI <- 1 # does this survey include RPI?
  hasPDSS <- 0 # does this survey include PDSS?
  csv_files <- c('/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/ACE_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/B-SSS_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/BFNE_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/BIS_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/CARE-R_EI_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/CARE-R_WE_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/CBCL_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/NTS_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/PAL2_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/PEQ_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/RPI_scoring_rubric_1_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/RPI_scoring_rubric_2_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/SPSRQS_scoring_rubric_TDS1_PRE.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/pre/UPPSP_scoring_rubric_TDS1_PRE.csv')
  
  csv_wide_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-PRE-auto_scored_scales_wide.csv"
  csv_long_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-PRE-auto_scored_scales_long.csv"
  csv_longRaw_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-PRE-auto_raw_qualtrics_long.csv"
  csv_wideRaw_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-PRE-auto_raw_qualtrics-"
}

if (module == 'TDS1-Post'){
  survey_name_filter <- 'TDS1.*Post' # survey name filter as a regular expression
  survey_name_dont_match <- '.*Session 3.*|.*SHORTENED.*'
  sid <- 'SID' # subject ID variable name as a regular expression
  age_var <- 'Age' # age variable name. If NA, we skip these steps below
  gender_var <- 'Gender' # gender variable name. If NA, we skip these steps below
  gender_female <- 1 # value for female
  gender_male <- 0 # value for male
  pdss_gender_code <- c(m=gender_male, f=gender_female)
  gender_mix <- 'mf' #'mf' for both M and F, 'm' for M only, 'f' for F only
  exclude_SID <- c('', '999') # subject IDs to exclude
  identifiableData <- '(DOB|Ethnicity|Work|Grade|School|TEXT|Addl_Probs|Reasons|Decribe|Concerns|BestThings|Describe|Started|Ended)' # exclude when printing duplicates
  hasCBCL <- 1 # does the survey include CBCL?
  hasRPI <- 1 # does this survey include RPI?
  hasPDSS <- 1 # does this survey include PDSS?
  csv_files <- c('/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/CARE_Social_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/RPI_scoring_rubric_1_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/BFNE_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/CBCL_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/PAL2_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/ACE_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/RPI_scoring_rubric_2_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/RSQ_scoring_rubric_2_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/CARE-R_WE_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/PDS_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/CARE-R_EI_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/B-SSS_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/CES-DC_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/SPSRQS_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/RSQ_scoring_rubric_1_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/SCARED_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/BIS_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/PEQ_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/NTS_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/UPPSP_scoring_rubric_TDS1_POST.csv',
                 '/Volumes/TDS/behavior/Qualtrics/rubrics/tds1/post/YRBS_scoring_rubric_TDS1_POST.csv')
  
  csv_wide_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-POST-auto_scored_scales_wide.csv"
  csv_long_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-POST-auto_scored_scales_long.csv"
  csv_longRaw_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-POST-auto_raw_qualtrics_long.csv"
  csv_wideRaw_path <- "/Volumes/TDS/behavior/Qualtrics/TDS-1-POST-auto_raw_qualtrics-"
}