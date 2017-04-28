# This script generates graphs of the parameter estimates for an ROI with parametric modulators 

# LOAD PACKAGES
```{r, echo=FALSE}
osuRepo<-'http://ftp.osuosl.org/pub/cran/'

#Check if the packages we need are installed, and if not, install them
if(!require(plyr)){
  install.packages('plyr',repos=osuRepo)
}
library(plyr)

if(!require(dplyr)){
  install.packages('dplyr',repos=osuRepo)
}
library(dplyr)

if(!require(tidyr)){
  install.packages('tidyr',repos=osuRepo)
}
library(tidyr)

if(!require(ggplot2)){
  install.packages('data.table',repos=osuRepo)
}
library(ggplot2)
```

# Feed me.(Change the parameters)
```{r}
rm(list=ls())

#### PARAMETERS ####
subjectList= c(
  "113",
  "114",
  "115",
  "116",
  "117",
  "119",
  "121",
  "125",
  "126",
  "127",
  "128",
  "129",
  "130",
  "131",
  "132",
  "133",
  "134",
  "135",
  "136",
  "137",
  "139",
  "140",
  "141",
  "142",
  "144",
  "145",
  "146",
  "150",
  "151",
  "152",
  "155",
  "156",
  "157",
  "158",
  "159",
  "160",
  "161",
  "162",
  "163",
  "164",
  "165",
  "167",
  "168",
  "169",
  "170",
  "171",
  "172",
  "173",
  "174",
  "175",
  "177",
  "179",
  "181",
  "182",
  "183",
  "184",
  "185",
  "186",
  "187",
  "188",
  "189",
  "190",
  "192",
  "193",
  "196"
)

# ROIs in the order they appear in the .csv file 
roiList=c(
  "craddock24_145",
  "craddock24_168",
  "craddock24_172",
  "craddock24_222",
  "craddock24_26",
  "craddock24_62",
  "craddock24_80",
  "craddock24_98")

# Set pmod_lowerlim:pmod_upperlim
pmodRange= 1:11

# If you tested more than 1 pmod, then all of the pmod parameters of one type should be listed, followed by all of the pmod parameters of another type. Change n to represent which pmod you'd like to change. e.g., in Cyberball, 1: inclusion pmod; 2: exclusion pmod.
totalPmods=2
pmodNames=c("Increasing_Inclusion", "Increasing_Exclusion")

#### LOAD DATA ####
# Set working directory to where marsbar ROI summary time course .csv files are kept
setwd("/Volumes/research/tds/fMRI/analysis/parcellations/cyb/ACC_ROIs/conj_pmod")

# Load file - NEED TO CREATE THE SUMMARY TIME COURSE FILE!
df.raw<-read.csv("craddock24_all.csv", header=FALSE)
```

# Organize data
```{r}
# Label the rows and columns
colnames(df.raw)=roiList # label each column with the ROI
df.raw$SID=subjectList # add the list of SIDs
df.raw=df.raw[,c("SID", roiList)] # rearrange with SIDs on the left

# Calculate parameter estimate averages per ROI per pmod
df.avg=data.frame(matrix(rep(NA, length(roiList)*totalPmods), nrow=totalPmods), row.names=pmodNames)
colnames(df.avg)=c(roiList)

for (i in 1:length(roiList)){
    df.avg[1,i]=mean(df.raw[1:65,i+1], na.rm=TRUE)
    df.avg[2,i]=mean(df.raw[66:130,i+1], na.rm=TRUE)
  }

```

# Graph pmods
```{r}

# Set up a null dataframe called df.graph for summarizing plot parameters
df.graph=as.data.frame(matrix(rep(NA, length(pmodRange)*(totalPmods+1)), nrow=length(pmodRange), ncol=(totalPmods+1)))
colnames(df.graph)=c("pmodRange",pmodNames)
df.graph$pmodRange=pmodRange


# Populate df.graph and graph each pmod for each ROI
for (i in 1:length(roiList)){
  for (j in 1:totalPmods) {
    df.graph[,j+1]=df.avg[j,i]*pmodRange}
    print(ggplot(data = df.graph, aes(x = pmodRange)) +
            geom_line(aes(y = Increasing_Inclusion, colour = "to participant (inclusion)"),size=2) +
            geom_line(aes(y=Increasing_Exclusion, colour = "not to participant (exclusion)"),size=2) + 
            scale_color_manual("", breaks = c("to participant (inclusion)","not to participant (exclusion)"),
                               values = c("to participant (inclusion)"="#9999CC","not to participant (exclusion)"="#66CC99")) +
            scale_x_continuous(name="Increasing Throws", breaks=seq(-4,12,2)) +
            scale_y_continuous(name="Activation", limit = c(-4,8)) + theme(axis.text=element_text(size=24), axis.title=element_text(size=28), legend.text=element_text(size=28), legend.position="bottom") +
            scale_size_manual(values=c(1,4)) +
            ggtitle(roiList[i]) +
            guides(colour = guide_legend(nrow=2,byrow=TRUE)))
}

            