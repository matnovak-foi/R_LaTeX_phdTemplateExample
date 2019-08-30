library(dplyr)
library(pastecs)
library(car)
library(nlme)
library(ez)
library(multcomp)
library(reshape)
library(compute.es)
library(MASS)
library(pgirmess)
library(lme4)
library(lmerTest)
library(boot)
library(qqplotr)
library(pbkrtest)
#library(onewaytests)

attach(new.env(), name="WilcoxENV")
WilcoxENV <- as.environment("WilcoxENV")
source("08_analysis/WilcoxRallfun-v35.R", local = WilcoxENV,  encoding = "UTF-8" )
source("08_analysis/Model-based-bootstrapped-ANOVA.R", encoding = "UTF-8" )
source("08_analysis/statisticsFunctions.R", encoding = "UTF-8")

#Variable names
DEPENDENT_VAR <- "Precentage"
COMBO_VAR_PPT_TOOL <- "ToolPPTCombo"
TECHNIQUE_VAR  <- "Technique"
TOOL_VAR <- "Tool"

#Tool and PPT names

NoPPT = "NoPPT"
RC = "RC"
TE = "TE"
CCR = "CCR"
Allv3 = "AllnoNOR"
Allv4 = "AllNOR"
SIMtext = "SIM-text"
SIMjava = "SIM-java"
Sherlocktext = "Sherlock-text"
Sherlockjava = "Sherlock-java"
JPlagjava = "JPlag-java"
JPlagtext =  "JPlag-text"

#ContrastNames
NoPPTvsPPT= paste0(NoPPT,"vs","PPT")
SinglevsCombo= paste0("Single","vs","Combo")
RCvsCCR= paste0(RC,"vs",CCR)
Allv3vsAllv4= paste0(Allv3,"vs",Allv4)
