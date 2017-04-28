### This script takes in a covariate and multiplies it by X times in order 
### to create an input vector for flexible factorial analysis

# Assumes that SIDs populate column 1, and the variable of interest populates column 2

rm(list=ls()) #clear environment

# Change these parameters
inputDirectory="/Volumes/research/tds/behavioral/raw/cyberball" #working directory
outputDirectory="/Volumes/research/tds/behavioral/raw/cyberball" 

inputFilename="subjectList_flexifactorialorder.csv" #file name 
outputFilename="subjectList_flexifactorialorder_2x_quad.csv"

X=2 #number of repetitions

# Load dataframe
setwd(inputDirectory)
df=read.csv(inputFilename, head=FALSE)

# Mean Center
meanV2=mean(df$V2)
df$V2=df$V2-meanV2

# Take the quadratic
df$V3=df$V2^2

# Repeat each item 
df_mult=as.data.frame(cbind(rep(df$V1, each=X), rep(df$V2, each=X), rep(df$V3, each=X)))

# Save the item
setwd(outputDirectory)
write.csv(df_mult, outputFilename)

