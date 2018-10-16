# Correlate parcellated ACC ROIs to RSQ
# T Cheng | August 30, 2018

library(dplyr)
library(tidyr)
library(ggplot2)
rsq_scores <- read.csv("/Volumes/psy-ctn/psy-ctn/TDS/behavior/CyberBall/tds2_rsq_raw.csv")
get_sid_here <- read.csv("/Volumes/psy-ctn/psy-ctn/TDS/behavior/CyberBall/TDS2_N69_rsq.csv")
get_sid_here <- get_sid_here[1:138, ]
get_sid_here$SID <- as.character(get_sid_here$SID)
subject_ids <- unique(get_sid_here$SID)

# if the sum of the row is zero, that means that all of the scores were NAs
rsq_scores <- filter(rsq_scores, rowSums(rsq_scores[, -1], na.rm=TRUE) != 0) 

# create a variable "exp" that is the 
rsq_exp <- rsq_scores %>% 
  filter(rsq_scores$SID %in% subject_ids) %>% 
  mutate(exp = rowMeans(select(., ends_with("B")), na.rm=TRUE))

# it looks like subjects 160 and 174 have missing data, so let's mean impute
#subject_ids[which(!subject_ids %in% rsq_exp$SID)]
mean_exp <- round(mean(rsq_exp$exp), 2)
rsq_exp[68, ] <-c("160", rep(NA, 30), mean_exp) 
rsq_exp[69, ] <-c("174", rep(NA, 30), mean_exp) 

# put in SID order and then double them to match the flexi factorial structure
rsq_exp = rsq_exp[, c("SID", "exp")] %>% 
  arrange(SID)
temp <- as.data.frame(cbind(rep(rsq_exp$SID, each = 2), rep(rsq_exp$exp, each = 2)))
temp$V2 <- as.numeric.factor(temp$V2)
temp$mean_centered <- round((temp$V2 -mean_exp), 2)

write.csv(temp, '/Volumes/psy-ctn/psy-ctn/TDS/behavior/CyberBall/tds2_rsq_imputed_centered.csv')

# read acc_rois
acc_rois <- read.csv("/Volumes/psy-ctn/psy-ctn/TDS/nonbids_data/derivatives/fMRI/parcellations/cyb/tds2_N69/summary_F_conj_pmod_flexi_craddock.csv", header = FALSE)
acc_rois$pmod <- rep(c("inc", "exc"), 69)
acc_rois$SID <- rsq_exp$SID
roi_names <- c("ROI1", "ROI2", "ROI3", "ROI4", "ROI5", "ROI6", "ROI7", "ROI8")
colnames(acc_rois) <- c(roi_names, "pmod", "SID")

# join with rsq scores
acc_rois <- merge(acc_rois, rsq_exp, by = "SID")
acc_rois$exp <- as.numeric(acc_rois$exp)

# tidy dataframe
acc_rois <- gather(acc_rois, "roi", "param", -pmod, -SID, -exp) # -anger, -anxious

regress_roi_on_rsq <- function(df, roi_name, pmod_name) {
   temp <- filter(df, roi == roi_name, pmod == pmod_name)
   
   model_exp <- stats::lm(param ~ exp, data = temp)
   print(summary(model_exp))
}

for (i in 1:length(roi_names)){
   where_am_i <- paste("Running models on", roi_names[i])
   print(where_am_i)
   regress_roi_on_rsq(acc_rois, roi_names[i], pmod_name = "inc")
   regress_roi_on_rsq(acc_rois, roi_names[i], pmod_name = "exc")
}
 
inc_pmod = acc_rois %>% 
   filter(pmod == "inc")

exc_pmod = acc_rois %>% 
   filter(pmod == "exc")
 
ggplot(exc_pmod, (aes(x = roi, y = param))) + 
   geom_boxplot(na.rm = TRUE)
 
 ggplot(filter(inc_pmod, roi == "ROI1"), aes(x = exp, y = param)) + 
   geom_point() +
   geom_smooth()



 
#####################
# # anger anxious
# regress_roi_on_rsq <- function(df, roi_name, pmod_name) {
#   temp <- filter(df, roi == roi_name, pmod == pmod_name)
#   
#   model_anger <- stats::lm(param ~ anger, data = temp)
#   print(summary(model_anger))
#   
#   model_anxious <- stats::lm(param ~ anxious, data = temp)
#   print(summary(model_anxious))
# }
# 
# for (i in 1:length(roi_names)){
#   where_am_i <- paste("Running models on", roi_names[i])
#   print(where_am_i)
#   regress_roi_on_rsq(acc_rois, roi_names[i], pmod_name = "inc")
#   regress_roi_on_rsq(acc_rois, roi_names[i], pmod_name = "exc")
# }
# 
# acc_rois <- filter(acc_rois, roi != "X")
# 
# inc_pmod = acc_rois %>% 
#   filter(pmod == "inc")
# 
# ggplot(inc_pmod, (aes(x = roi, y = param))) + 
#   geom_boxplot(na.rm = TRUE)
# 
# exc_pmod = acc_rois %>% 
#   filter(pmod == "exc")
# 
# ggplot(exc_pmod, (aes(x = roi, y = param))) + 
#   geom_boxplot(na.rm = TRUE)
# 
# ggplot(filter(inc_pmod, roi == "ROI1"), aes(x = anger, y = param)) + 
#   geom_point() +
#   geom_smooth()
# 
# # those with higher expectations of angry rejection had greater inc_pmod parameter estimates in ROI1  
