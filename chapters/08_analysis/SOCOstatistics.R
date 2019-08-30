rm(list = ls()); 
ls();
mainDir <- "D:/FOI/Doktorski rad/phd-text/chapters"; 
setwd("D:/Rprojects/ReviewPlagiarsimDetection/")
source("createReviewGlobals.R",encoding = "UTF-8")
setwd(mainDir)


source("08_analysis/statisticsHeader.R", encoding = "UTF-8" )

SOCO_EXCEL <- loadSheetFromXMLFile("08_analysis/SOCOstatistics.xlsx","PrecantageBased3IRQ")  
names(SOCO_EXCEL)
SOCO_PREPARED <- initDF(SOCO_EXCEL)
names(SOCO_PREPARED)

DATESET = "D1"
METRIC = "F1"

graphBuilderHelp$xAxisTitle = "Preprocessing technique"
graphBuilderHelp$yAxisTitle = paste(METRIC," (%)")
graphBuilderHelp$graphTitle = paste(METRIC,"(%) in ",DATESET," dataset")
graphBuilderHelp$facetWrapVariable = ~Tool
graphBuilderHelp$xAxisLabelAngle = 90

names(SOCO)

SOCO <- getAllToolsSOCO(SOCO_PREPARED, DATESET, METRIC)
SOCO_java <- getJavaToolsSOCO(SOCO)
SOCO_text <- getTextToolsSOCO(SOCO)

#BoxPlot
graphBuilderHelp$showBoxPlot(SOCO,TECHNIQUE_VAR, DEPENDENT_VAR)

SOCO_working = SOCO
contrasts(SOCO_working$Technique)
contrasts(SOCO_working$Tool)
#Levene-test of Homogenity of variance
performLeveneTest(SOCO_working)

#t-test
compareTechniquesForToolwithTtest(SOCO_working,SIMtext,NoPPT,Allv3)

#Min correlation
printMinimumCorrelation(SOCO_working)

#ShapiroWilk test of normality of distribuion by groups
performShapiroWilkTest(SOCO_working,0.05)

SOCO_working[SOCO_working$Tool==SIMjava & SOCO_working$Precentage > 70,]
SOCO_working <- SOCO_working[!(SOCO_working$Assignment %in% c('D2-13','D2-14')),]
SOCO_working <- dfmHelp$removeUnusedFactorLevels(SOCO_working)
levels(SOCO_working$Assignment)

#Plot residuals for group
residuals <- getResidualsForTretement(SOCO_working,SIMjava,RC)
residuals <- getResidualsForTretement(SOCO_working,Sherlockjava,Allv3)
residuals <- scale(residuals)
plot(density(residuals))
qqnorm(residuals)
abline(0,1)#what is the difference?
qqline(residuals)#here and above?

#Plot residuals for all groups
#PrecBackup <- SOCO_working$Precentage
SOCO_working$Precentage <- PrecBackup
#SOCO_working$Precentage <- 1/SOCO_working$Precentage
#SOCO_working$Precentage <- sqrt(SOCO_working$Precentage)
#SOCO_working$Precentage <- log10(SOCO_working$Precentage)
residuals <- getResidualsForAllTreatments(SOCO_working,COMBO_VAR_PPT_TOOL,DEPENDENT_VAR)
standardizedResiduals <- scale(residuals$Residuals)
hist(standardizedResiduals)
#Linearity
qqnorm(residuals$Residuals)
qqline(residuals$Residuals)
abline(0,1)
qqnorm(standardizedResiduals)
qqline(standardizedResiduals)
#Normality
hist(standardizedResiduals)
qplot(residuals$Residuals,stat = "qq")
qplot(standardizedResiduals,stat="qq")
plot(density(standardizedResiduals))
shapiro.test(standardizedResiduals)
shapiro.test(residuals$Residuals)

#Homogenity/homoscedasticity
plot(SOCO_working$Precentage,residuals$Residuals)
plot(scale(SOCO_working$Precentage),standardizedResiduals)
#plot(mlmFittedStandardized,mlmResidualsStandardized)
#plot(mlmFitted,mlmResiduals$fixed)
#SOCO_working[SOCO_working$Tool==Sherlocktext & SOCO_working$Technique==Allv4 & SOCO_working$Assignment=="D4-9","Precentage"]
#plot(mlmFitted,mlmResiduals$fixed)
abline(0,0)
abline(v=0)

#ANOVA
anova <- performANOVA(SOCO_working)

#Post-hoc
pairwise.t.test(SOCO_working$Precentage,SOCO_working[,COMBO_VAR_PPT_TOOL],paired=TRUE,p.adjust.method = "bonferroni")

#Corelations
SOCO_working <- SOCO_working[SOCO_working$Technique!=Allv4 & SOCO_working$Technique!=RC,]
SOCO_working <- dfmHelp$removeUnusedFactorLevels(SOCO_working)
SOCO_wide = unstack(SOCO_working,SOCO_working[,DEPENDENT_VAR]~SOCO_working[,COMBO_VAR_PPT_TOOL])
symnum(cor(SOCO_wide,use = "pairwise.complete.obs"))
cor(SOCO_wide,use = "pairwise.complete.obs")

#https://www.youtube.com/watch?v=Y1J5SWOy_Ro
mahal = mahalanobis(SOCO_wide,
            colMeans(SOCO_wide, na.rm = T),
            cov(SOCO_wide),use = "pairwise.complete.obs")
cutoff = qchisq(1-.001, ncol(SOCO_wide))
cutoff ##cut off score
ncol(SOCO_wide) ##df
summary(mahal < cutoff) ##see how many outliers
noout = subset(SOCO_wide, mahal < cutoff) ##exclude outliers

#fake regression style assumptions check
random = rchisq(nrow(SOCO_wide),31)
fake = lm(random~.,data=SOCO_wide)
standardized = rstudent(fake)
fitted = scale(fake$fitted.values)
#Normality
hist(standardized)
#Linearity
qqnorm(standardized)
abline(0,1)
#Homogenity
plot(fitted,standardized)
abline(0,0)
abline(v=0)
#Shapiro on fake data
shapiro.test(fake$residuals)
shapiro.test(standardized)

#ANOVA as MLM
SOCO_working = SOCO_java
##SOCO_working$Precentage <- 1/SOCO_working$Precentage
#SOCO_working$Precentage <- sqrt(SOCO_working$Precentage)
#SOCO_working$Precentage <- log10(SOCO_working$Precentage)
anovalm <- perofrmANOVAasGLM(SOCO_working)
#logLik(anovalm)
getContrastsEffectSizes(anovalm)
mean(SOCO_working$Precentage)
qqnorm(anovalm, ~ranef(., level=3))

plot(residuals(c,type="pearson"))
plot(density(residuals(anovalm,type="normalized")))
hist(residuals(anovalm,type="normalized"))
hist(residuals(c,type="response"))
hist(residuals(c,type="pearson"))
qqnorm(scale(residuals(anovalm,type="normalized")))
qqline(residuals(anovalm,type="normalized"))
abline(0,1)
shapiro.test(scale(residuals(anovalm,type="normalized")))
shapiro.test(residuals(anovalm,type="response"))
shapiro.test(residuals(anovalm,type="pearson"))
#ranef(anovalm)

#Linearity
plot(anovalm)
plot.lme(anovalm)
plot(SOCO_working$Precentage,resid(anovalm))
plot(fitted.values(anovalm),resid(anovalm))
#https://www.youtube.com/watch?v=UvyxSqEXBwc

mlmResiduals <- as.data.frame(anovalm$residuals)
mlmResidualsStandardized <- scale(mlmResiduals$fixed)
mlmFittedStandardized <- scale(fitted.values(anovalm))
mlmFitted <- fitted.values(anovalm)

#Linearty
qqnorm(mlmResidualsStandardized)
qqline(mlmResidualsStandardized)
abline(0,1)
#Normality
plot(density(mlmResidualsStandardized))
hist(mlmResidualsStandardized)
shapiro.test(mlmResidualsStandardized)

#Homogenity/homoscedasticity
#plot(ml)
plot(mlmFittedStandardized,mlmResidualsStandardized)
plot(mlmFitted,mlmResiduals$fixed)
plot(mlmFitted,mlmResidualsStandardized)

abline(0,0)
abline(v=0)


baseline <- lm(Precentage ~ Tool + Technique + Tool:Technique, 
                         data=SOCO_3IRQ)

rstudent(c)
qqnorm(rstudent(interactionModel))
qqnorm(mlmResidualsStandardized)
qqnorm(resid(interactionModel))
qqnorm(rstudent(interactionModel))
qqline(rstudent(interactionModel))
plot(anovalm)


#https://ademos.people.uic.edu/Chapter18.html
#Levenetest from residuals in model
leveneDataFrame <- SOCO_working
leveneDataFrame$Model.F.Res<- residuals(anovalm) #extracts the residuals and places them in a new column in our original data table
leveneDataFrame$Abs.Model.F.Res <-abs(leveneDataFrame$Model.F.Res) #creates a new column with the absolute value of the residuals
leveneDataFrame$Model.F.Res2 <- leveneDataFrame$Abs.Model.F.Res^2 #squares the absolute values of the residuals to provide the more robust estimate
Levene.Model.F <- lm(Model.F.Res2 ~ Assignment, data=leveneDataFrame) #ANOVA of the squared residuals
anova(Levene.Model.F) #displays the results 
#if the p value is greater than 0.05, we can say that the variance of the residuals is equal and therefore the assumption of homoscedasticity is met


#Mean graphs
graphBuilderHelp$showMeanComparisonGraph(SOCO_working,xVarName = TECHNIQUE_VAR,yVarName = DEPENDENT_VAR,legendVarName = TOOL_VAR)
graphBuilderHelp$showMeanComparisonGraph(SOCO_C2,xVarName = TECHNIQUE_VAR,yVarName = DEPENDENT_VAR,legendVarName = TOOL_VAR)


meanComparisonGraph <- ggplot(SOCO_D2, aes(Tool, Precentage, colour = Technique))
meanComparisonGraph + stat_summary(fun.y = mean, geom = "point") + stat_summary(fun.y = mean, geom = "line", aes(group= Technique)) + stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + labs(x = "Techniques", y = METRIC, colour = "Tool") 

meanComparisonGraph <- ggplot(SOCO_D2, aes_string("Technique",DEPENDENT_VAR))
meanComparisonGraph + stat_summary(fun.y = mean, geom = "bar", fill = "White", colour = "Black") + stat_summary(fun.data = mean_cl_boot, geom = "pointrange") + labs(x = "Techniques", y = METRIC, colour = "Tool") 

meanComparisonGraph <- ggplot(SOCO_D2, aes_string("Tool",DEPENDENT_VAR))
meanComparisonGraph + stat_summary(fun.y = mean, geom = "bar", fill = "White", colour = "Black") + stat_summary(fun.data = mean_cl_boot, geom = "pointrange") + labs(x = "Tool", y = METRIC, colour = "Techniques") 

meanComparisonGraph <- ggplot(SOCO_D1, aes(ToolType, Precentage))
meanComparisonGraph + stat_summary(fun.y = mean, geom = "point") + stat_summary(fun.y = mean, geom = "line", aes(group= Technique)) + stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + labs(x = "Techniques", y = METRIC, colour = "Tool") 


#Friedman's ANOVA
options(digits=2)
SOCO_working2 <- SOCO_working[SOCO_working$Tool==SIMjava,]
ezANOVA(SOCO_working2,dv=.(Precentage),wid = .(Assignment), within=.(Technique),detailed = TRUE, return_aov = TRUE, type=3)
pairwise.t.test(SOCO_working2$Precentage,SOCO_working2[,COMBO_VAR_PPT_TOOL],paired=TRUE,p.adjust.method = "bonferroni")


SOCO_working = SOCO_java
SOCO_nonparametric <- SOCO_working[SOCO_working$Tool == SIMjava,c(DEPENDENT_VAR,TECHNIQUE_VAR)]
SOCO_nonparametric_wide <- unstack(SOCO_nonparametric, SOCO_nonparametric[,DEPENDENT_VAR]~SOCO_nonparametric[,TECHNIQUE_VAR])
friedman.test(as.matrix(SOCO_nonparametric_wide))
friedmanmc(as.matrix(SOCO_nonparametric_wide),probs = 0.01)
t1 = SOCO_nonparametric[SOCO_nonparametric$Technique == NoPPT,DEPENDENT_VAR]
t2 = SOCO_nonparametric[SOCO_nonparametric$Technique == CCR,DEPENDENT_VAR]
resultWilcox <- wilcox.test(t1,t2,paired=TRUE,correct = FALSE)
resultWilcox
rFromWilcox(resultWilcox,length(t1)+length(t2))^2


#Robust One-way repeated measures ANOVA 
#library(WRS)
SOCO_nonparametric_wide <- SOCO_nonparametric_wide[,!(names(SOCO_nonparametric_wide) %in% c(Allv3))]
rmanova(SOCO_nonparametric_wide,tr=.2)
rmanovab(SOCO_nonparametric_wide,tr=.2,alpha=.05, nboot=2000)
rmmcp(SOCO_nonparametric_wide)
pairdepb(SOCO_nonparametric_wide,tr=0.2,nboot=599)

#Bootstrap
#LMR p-value - https://datascienceplus.com/introduction-to-bootstrap-with-applications-to-mixed-effect-models/
#https://www.r-bloggers.com/introduction-to-bootstrap-with-applications-to-mixed-effect-models/
#http://www.real-statistics.com/one-way-analysis-of-variance-anova/resampling-anova/
#http://compdiag.molgen.mpg.de/ngfn/docs/HDmar/ANOVABoot_1.PDF
#https://gist.github.com/smancuso
#https://sammancuso.com/2017/09/02/free-step-down-re-sampling-adjustment-for-multiple-testing-in-linear-regression/
#https://sammancuso.com/category/bootstrapping/
#https://sammancuso.com/2017/11/01/model-based-bootstrapped-anova-and-ancova/
#http://dwoll.de/rexrepos/posts/anovaMixed.html#using-lmer-from-package-lme4-1
#dwoll.de/rexrepos/posts/resamplingBootALM.html#anova
#http://dwoll.de/rexrepos/posts/resamplingBootALM.html#anova
#http://rstudio-pubs-static.s3.amazonaws.com/38995_ffc3e0f4fba94f888d4cb4c8961f6bd6.html
#https://ademos.people.uic.edu/Chapter17.html
#https://ademos.people.uic.edu/Chapter18.html
#https://datascienceplus.com/introduction-to-bootstrap-with-applications-to-mixed-effect-models/
#www.rpubs.com/howelb/39050
#https://www.r-project.org/conferences/useR-2009/slides/SanchezEspigares+Ocana.pdf
#https://cran.r-project.org/doc/Rnews/Rnews_2002-3.pdf
#https://books.google.hr/books?id=ZxaRC4I2z6sC&printsec=frontcover&hl=hr&source=gbs_ge_summary_r&cad=0#v=onepage&q&f=false
#page 16 & 17
#

mean(SOCO_working[SOCO_working$Tool==JPlagjava & SOCO_working$Technique == NoPPT,"Precentage"])
model0 <- ezANOVA(SOCO_working,dv=.(Precentage),wid = .(Assignment), within=.(Technique,Tool),detailed = TRUE, 
        return_aov = TRUE, type=3)

Fovi <- c()
for(i in 1:10){
  rt <- ezBoot(SOCO_working,dv=Precentage, wid = .(Assignment), within=.(Technique,Tool),
               resample_within=FALSE, iterations=30, lmer = FALSE)
  model0 <- ezANOVA(rt$boots,dv=.(value),wid = .(iteration), within=.(Technique,Tool),detailed = TRUE, 
                    return_aov = TRUE, type=3)
  Fovi[i] <- model0$ANOVA$F[4]
}

hist(Fovi)

ezPerm(SOCO_working,dv=.(Precentage),wid = .(Assignment), within=.(Technique,Tool), perms=100, alarm=TRUE)
ezPlot2(
       preds = rt
       , x = Technique
       , split = Tool
   )

SOCO_working <- dfmHelp$replaceAllValuesInColumnWithValue(SOCO_working,"Tool",Sherlocktext,"Sherlock")
SOCO_working <- dfmHelp$replaceAllValuesInColumnWithValue(SOCO_working,"Tool",SIMtext,"SIM")
SOCO_working <- dfmHelp$replaceAllValuesInColumnWithValue(SOCO_working,"Tool",JPlagtext,"JPlag")
SOCO_working <- dfmHelp$replaceAllValuesInColumnWithValue(SOCO_working,"Tool",SIMjava,"SIM")
SOCO_working <- dfmHelp$replaceAllValuesInColumnWithValue(SOCO_working,"Tool",JPlagjava,"JPlag")
SOCO_working <- dfmHelp$replaceAllValuesInColumnWithValue(SOCO_working,"Tool",Sherlockjava,"Sherlock")
contrasts(SOCO_working$Tool) <- getContrastsToolTextOrJava()
TextvsJava <- c(-1,1)
contrasts(SOCO_working$ToolType) <- cbind(TextvsJava)
contrasts(SOCO_working$Technique) <- getContrastTechnique()

model1 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                  random = ~1|Assignment/Tool/Technique, 
                  data=SOCO_working, method="ML")

model3 <- lme(Precentage ~ Tool + Technique + ToolType +  ToolType:Technique + ToolType:Tool + Tool:Technique + ToolType:Tool:Technique, 
              random = ~1|Assignment/ToolType/Tool/Technique, 
              data=SOCO_working , method="ML")

anova(model1,model2)

summary(model1)
anova.lme(model1)
model2 <- lmer(Precentage ~ Tool + Technique + Tool:Technique + (1 | Assignment / Tool ), 
             data=SOCO_working , REML = FALSE)
summary(model2)
summary(lmer(Precentage ~ Tool + Technique + Tool:Technique 
             + (1 | Assignment) 
             + (1 | Tool:Assignment)
             + (1 | Technique:Assignment)
             + (1 | Tool:Technique:Assignment), 
             data=SOCO_working , REML = FALSE))
summary(gls(Precentage ~ 1, 
                        data = SOCO_working, 
                        method = "ML", na.action = "na.omit"))
options(digits = 20)
summary(lmer(Precentage ~ 1 + (1 | Assignment), data=SOCO_working , REML = FALSE))
summary(lme(Precentage ~ 1, random = ~1|Assignment, data=SOCO_working, method="ML"))
summary(lmer(Precentage ~ 1 + (1 | Assignment / Tool), data=SOCO_working , REML = FALSE))
summary(lmer(Precentage ~ 1 + (1 | Assignment) + (1 | Tool:Assignment), data=SOCO_working , REML = FALSE))
summary(lme(Precentage ~ 1, random = ~1|Assignment/Tool, data=SOCO_working, method="ML"))

summary(lmer(Precentage ~ 1 + (1 | Assignment / Tool / Technique), data=SOCO_working , REML = FALSE))
summary(lmer(Precentage ~ 1 + (1 | Assignment / Tool) + (1 | Assignment / Technique), data=SOCO_working , REML = FALSE))
summary(lmer(Precentage ~ 1 + (1 | Assignment) + (1 | Tool:Assignment) + (1 | Technique:Assignment), data=SOCO_working , REML = FALSE))
summary(lme(Precentage ~ 1,  random = ~1|Assignment/Tool/Technique,  data=SOCO_working, method="ML"))

resid(c)
cs <- summary(c)
cs$residuals

plot(fitted.values(c),resid(c))

a <- lmer(Precentage ~ 1 + (1 | Assignment) + (1 | Tool:Assignment), data=SOCO_working , REML = FALSE)
b <- lmer(Precentage ~ 1 + (1 | Assignment) + (1 | Tool:Assignment) + (1 | Technique:Assignment), data=SOCO_working , REML = FALSE)
c <- lmer(Precentage ~ Tool + Technique + Tool:Technique 
          + (1 | Assignment) 
          + (1 | Tool:Assignment)
          + (1 | Technique:Assignment), 
          data=SOCO_working , REML = FALSE)
full_model <- c
null_model <- lm(Precentage ~ 1, data=SOCO_working)
full_model <- lm(Precentage ~ Tool + Technique + Tool:Technique , data=SOCO_working)
null_model <- update(
  full_model, .~ + 1,
  data = model.frame(full_model)
)

#https://sammancuso.com/2017/11/01/model-based-bootstrapped-anova-and-ancova/
#https://gist.github.com/smancuso
nullboot.Anova(
  null.model = null_model,
  full.model = full_model,
  ci = FALSE
)

a <- lme(Precentage ~ 1, random = ~1|Assignment/Tool, data=SOCO_working, method="ML")
b <- lme(Precentage ~ 1,  random = ~1|Assignment/Tool/Technique,  data=SOCO_working, method="ML")
anova(a,b,c)
summary(c)
library(lmerTest)
anova(c)
as.numeric(anova(c)[,"F value"])

mySumm2 <- function(.) {
  c(f=anova(.)[,"F value"], beta=fixef(.),sigma=sigma(.), sig01=sqrt(unlist(VarCorr(.))))
}

mySumm3 <- function(data,indices){
  data$Precentage <- data[indices,"Precentage"]
  c <- lmer(Precentage ~ Tool + Technique + Tool:Technique 
            + (1 | Assignment) 
            + (1 | Tool:Assignment)
            + (1 | Technique:Assignment), 
            data=data , REML = FALSE)
  c(f=anova(c)[,"F value"], beta=fixef(c))
}


b_par<-bootMer(x=c,FUN=mySumm2,nsim=100, use.u = TRUE, .progress = "txt") #type = "semiparametric", use.u = TRUE,
b_par$t[,"beta.ToolTextvsJava"]
boot.ci(b_par,type="perc",index=4)
confint(c)
confint(model1,parm=c(1,2,3),method="boot",nsim=20,boot.type="perc")
plot(b_par, index=6)
index =3
sum(abs(b_par$t[,index]-1) > abs(b_par$t0[index]-1))/(1+b_par$R)
Fbase <- b_par$t0[index]
Fstar   <- b_par$t[,index]
(sum(Fstar >= Fbase) + 1) / (length(Fstar) + 1)

perofrmANOVAasGLM(SOCO_working)

library(pbkrtest)
c_0<-update(c,.~.-Tool)
c_0<-update(c_0,.~.-Tool:Technique)
c_0<-update(c_0,.~.-Technique)
c_0
anova(c,c_0)
res <- PBmodcomp(c,c_0,nsim=200)
summary(res)
library(boot)
library(pbapply)
library(dplyr)

tot_rep = 100


#bootResult <- boot(SOCO_working, getBootStatistics,  R=2, ran.gen = getBootstraps, sim="parametric", )
bootResult1000 <- bootResult
p <- progress_estimated(tot_rep+1) 
bootResult <- boot(SOCO_working, mySumm3,  R=tot_rep, stype = "i", parallel = "multicore", ncpus = 2)

FrequencyTableCreator$createFrequencyTable()
plot(bootResult$t[,1])
hist(bootResult$t[,1])
hist(bootResult$t[,4])
hist(bootResult$t[,6])

boot::
bootResult
bootResult$t0
bootResult$t
plot(bootResult, index = 1)
plot(bootResult, index = 2)
plot(bootResult, index = 3)
plot(bootResult, index = 4)
plot(bootResult, index = 5)
plot(bootResult, index = 6)
plot(bootResult, index = 7)
jack.after.boot(bootResult, index = 1)

bootCI
install.packages("overlap")
library(overlap)
bootCI(t0 = bootstraps$t0[35], bt = bootstraps$t[,35], conf=0.95)
boot.ci(bootResult, type=c("norm","basic", "stud", "perc"), index = 5, conf=0.95)

getOption("boot.ncpus", 1L)
index = 3
options(digits = 5)
sum(abs(bootResult$t[,index]-1) > abs(bootResult$t0[index]-1))/(1+bootResult$R)
Fbase <- bootResult$t0[index]
Fstar   <- bootResult$t[,index]
(sum(Fstar >= Fbase) + 1) / (length(Fstar) + 1)

getBootstraps <- function (SOCO_working){
  SOCO_working
}

glmModel = lm(Precentage ~ 1, 
               data = SOCO_working,  na.action = "na.omit")
glmModel = lmer(Precentage ~ (1 | Assignment) 
                + (1 | Tool:Assignment)
                + (1 | Technique:Assignment), 
              data = SOCO_working,  na.action = "na.omit")
glmModel = lmer(Precentage ~ Tool + Technique + Tool:Technique 
          + (1 | Assignment) 
          + (1 | Tool:Assignment)
          + (1 | Technique:Assignment), 
          data=SOCO_working , REML = FALSE)
fit0 <- glmModel
fit0 <- lm(Precentage ~ 1, data=SOCO_working)        ## fit 0-model
Er    <- residuals(fit0)               ## residuals
Er   <- Er / sqrt(1-hatvalues(fit0))   ## rescaled residuals
Yhat <- fitted(fit0)                  ## prediction

getAnova <- function(dat, idx) {
  dat$Precentage <- Yhat + Er[idx]
  #meanComparisonGraph <- ggplot(dat, aes(Technique, Precentage, colour = Tool))
  #gr <- meanComparisonGraph + stat_summary(fun.y = mean, geom = "point") + stat_summary(fun.y = mean, geom = "line", aes(group= Tool)) + stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + labs(x = "Techniques", y = METRIC, colour = "Tool") 
  #print(gr)
  c <- lmer(Precentage ~ Tool + Technique + Tool:Technique 
            + (1 | Assignment) 
            + (1 | Tool:Assignment)
            + (1 | Technique:Assignment), 
            data=dat , REML = FALSE)
  s <- summary(c)
  s$coefficients[1,"Estimate"]
  c(f=anova(c)[,"F value"],B=s$coefficients[1,"Estimate"])
}




(bsAnova <- boot(SOCO_working, statistic=getAnova, R=100))
index = 3
Fbase <- bsAnova$t0[index]
Fstar   <- bsAnova$t[,index]
(sum(Fstar >= Fbase) + 1) / (length(Fstar) + 1)
sum(abs(bsAnova$t[,index]-1) > abs(bsAnova$t0[index]-1))/(1+bsAnova$R)
plot(bsAnova,index = 3)
hist(bsAnova$t[,3])
boot.ci(bsAnova,type="perc", index=4)
confint(c_0)

getBootStatistics <- function (data, indices){
  data$Precentage <- data[indices,"Precentage"]
  p$tick()$print()  # update progress bar
  model1 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                random = ~1|Assignment/Tool/Technique, 
                data=data , method="ML")
  fStat <- anova.lme(model1)
  modelSummary <- summary(model1)
  tTable <- modelSummary$tTable
  c(fStat$`F-value`[2],fStat$`F-value`[3],fStat$`F-value`[4],tTable["ToolTextvsJava","t-value"]
    ,tTable["ToolTextvsJava","p-value"],tTable["ToolTextJPlagvsTextSIM:TechniqueAllv3vsAllv4","t-value"]
    ,tTable["ToolJavaSherlockvsJavaOther:TechniqueAllv3vsAllv4","t-value"])
  
}

getBootStatistics2 <- function(data, indices){
  data$Precentage <- data[indices,"Precentage"]
  p$tick()$print()  # update progress bar
  model0 <- ezANOVA(data,dv=.(Precentage),wid = .(Assignment), within=.(Technique,Tool),detailed = TRUE, 
          return_aov = TRUE, type=3)
  c(model0$ANOVA$F[4])
}

#AIC      BIC       logLik     deviance   df.resid 
#5504.5   5659.3   -2720.3      5440.5      898 
#5207.092 5371.488 -2569.546

####UNUSED STUFF####
require("lattice")
qqmath(anovalm, id=0.05)

library(DHARMa)
simulationOutput <- simulateResiduals(fittedModel = anovalm, n = 250)
plot(simulationOutput)
plotResiduals(YOURPREDICTOR, simulationOutput$scaledResiduals)
testUniformity(simulationOutput = simulationOutput)
testOverdispersion(simulationOutput = simulationOutput)
testZeroinflation(simulationOutput = simulationOutput)
testTemporalAutocorrelation(simulationOutput = simulationOutput)
testSpatialAutocorrelation(simulationOutput = simulationOutput)

#https://ademos.people.uic.edu/Chapter21.html
library(lsmeans)
library(afex)
Within.aov.1 <- aov_car(Precentage ~ Tool*Technique + Error(Assignment/Tool*Technique), data=SOCO_working)
Within.aov.5<-aov_car(Precentage ~ Tool*Technique + Error(Assignment/Tool*Technique), data=SOCO_working, return="univariate")
Within_Fitted_Interaction <- lsmeans(anova$aov, ~ Technique|Tool)
Within_Fitted_Interaction #call the object we created
pairs(Within_Fitted_Interaction, adjust="bon")
?lsmeans

#Only 10 Elements
SOCO_F1_D12 <- SOCO_F1_D11[SOCO_F1_D11$Assignment=="D1-1" | SOCO_F1_D11$Assignment=="D1-2"  | SOCO_F1_D11$Assignment=="D1-3" | SOCO_F1_D11$Assignment=="D1-4" | SOCO_F1_D11$Assignment=="D1-5" | SOCO_F1_D11$Assignment=="D1-6" | SOCO_F1_D11$Assignment=="D1-7" | SOCO_F1_D11$Assignment=="D1-8" | SOCO_F1_D11$Assignment=="D1-9" | SOCO_F1_D11$Assignment=="D1-10",]
SOCO_F1_D12 <- SOCO_F1_D11[SOCO_F1_D11$Assignment=="D1-1" | SOCO_F1_D11$Assignment=="D1-2"  | SOCO_F1_D11$Assignment=="D1-3" | SOCO_F1_D11$Assignment=="D1-4" | SOCO_F1_D11$Assignment=="D1-5" ,]

library(onewaytests)
welch.test(Precentage ~ Technique,data = SOCO)
welch.test(Precentage ~ Tool,data = SOCO) 
   
qplot(sample=Precentage,data=SOCO_working, color=ToolPPTCombo)