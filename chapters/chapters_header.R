#https://yihui.name/knitr/options/
  rm(list = ls()); 
  ls();
  
  library(xtable); 
  library(knitr);
  library(stringr);
  library(kableExtra);#https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html
  mainDir <- getwd(); 
  #mainDir <- paste0(mainDir,"/chapters")
  #setwd("D:/Rprojects/ReviewPlagiarsimDetection/");
  setwd("/media/matnovak/HomeData/Rprojects/ReviewPlagiarsimDetection/")
  source("createReviewGlobals.R",encoding = "UTF-8");
  setwd(mainDir)
  source("08_analysis/statisticsHeader.R", encoding = "UTF-8" )
  
  citeCoulumnValuesToString <- function (citeDateFrame,columnName) {
      as.String(citeDateFrame[citeDateFrame[,"Name"]==columnName,"Values"]) 
  } 
  
  linebreak <- function(x, align = c("l", "c", "r")){
	  dfm <- DataFrameMaipulator$new();
	  align <- match.arg(align, c("l", "c", "r"))
	  for (row in 1:nrow(x)) {
	    for(columnName in colnames(x)){
	      if(!is.numeric(x[row, columnName]) && str_detect(x[row, columnName], "\n")){
	        el <- x[row,columnName]
	        el <- paste0("\\makecell[", align,"]{", str_replace_all(el, "(\r\n)|(\n)", "\\\\\\\\"), "}");
	        x <- dfm$addNewFactorLevel(x,columnName,el);
	        x[row,columnName] <- el
	      }
	    }
	  }
	  return(x)
  }
  
  removeAnotationsForSameNameColumns <- function(latexText){
    latexText <- str_replace_all(latexText, "(([.][.])|(__))[0-9]{1,2} &", " &") %>% 
      structure(format = "latex", class = "knitr_kable")
    str_replace_all(latexText, "(([.][.])|(__))[0-9]{1,2}\\\\", " \\\\")  %>% structure(format = "latex", class = "knitr_kable")
  }
  
  presentTable <- function(mydata, align = c(), align_header = 'c', digits=1) { 
  	linebreak(mydata) %>% 
  	kable(format = "latex", booktabs = T, escape = F, digits = digits, align = align, linesep="") %>% 
    removeAnotationsForSameNameColumns() %>% 
  	row_spec(0, bold=TRUE, align = align_header) %>% 
  	kable_styling(mydata, latex_options = "striped", position = "left")
  }
  
  getBootstrapANOVAinfo <- function(dataFrame, fileName,repetitions=10000){
    fileName <- paste0("08_analysis/",fileName,"_bootstrap.RData")
    bsANOVA <- NULL
    if(file.exists(fileName)){
      load(fileName)
    } else {
      bsANOVA <- performBootstrapANOVA(dataFrame,repetitions,getFullModel)
      save(bsANOVA, file = fileName)
    }
    return(bsANOVA)
  }
  
  getBootstrapSimpleEffectsinfo <- function(dataFrame, fileName,repetitions=10000){
    fileName <- paste0("08_analysis/",fileName,"_simpleEffects_bootstrap.RData")
    bsANOVA <- NULL
    if(file.exists(fileName)){
      load(fileName)
    } else {
      bsANOVA <- performBootstrapANOVA(dataFrame,repetitions,getFullModelForSimpleEffect)
      save(bsANOVA, file = fileName)
    }
    return(bsANOVA)
  }
  
  renameCoeficientNames <- function(coeficients,useRowNamesInFirstColumn=FALSE){
    contrastNames <- rownames(coeficients) 
    if(useRowNamesInFirstColumn) contrastNames <- coeficients[,1]
    contrastNames <- str_replace_all(contrastNames,"ToolTextvsJava","Tool.TextvsJava")
    contrastNames <- str_replace_all(contrastNames, "ToolText", "TT")
    contrastNames <- str_replace_all(contrastNames, "ToolJava", "TJ")
    contrastNames <- str_replace_all(contrastNames, "Sherlock", "SH")
    #contrastNames <- str_replace_all(contrastNames, "Technique", "PPT.")
    contrastNames <- str_remove_all(contrastNames, "Technique")
    contrastNames <- str_replace_all(contrastNames, "AllNOR", "AN")
    contrastNames <- str_replace_all(contrastNames, "AllnoNOR", "AnoN")
    if(!useRowNamesInFirstColumn)
      rownames(coeficients) <- contrastNames
    else
      coeficients[,1]<-contrastNames
    
    
    varaibleNames <- colnames(coeficients)
    varaibleNames <- str_replace_all(varaibleNames, "Std. Error", "SE")
    varaibleNames <- str_replace_all(varaibleNames, "Std..Error", "SE")
    varaibleNames <- str_replace_all(varaibleNames, "Pr...t..", "Pr(>|t|)")
    colnames(coeficients) <- varaibleNames
    
    return(coeficients)
  }
  
  renameSimpleEffectSizeCoeficientNames <- function(coeficients, useRowNamesInFirstColumn=FALSE){
    contrastNames <- rownames(coeficients) 
    if(useRowNamesInFirstColumn)
      contrastNames <- coeficients[,1]
    
    contrastNames <- str_replace_all(contrastNames,"ToolPPTCombo","")
    contrastNames <- str_replace_all(contrastNames,"NoNPPvsNPP",NoPPTvsPPT)
    
    if(!useRowNamesInFirstColumn)
      rownames(coeficients) <- contrastNames
    else
      coeficients[,1]<-contrastNames
    
    varaibleNames <- colnames(coeficients)
    varaibleNames <- str_replace_all(varaibleNames, "Std. Error", "SE")
    varaibleNames <- str_replace_all(varaibleNames, "Std..Error", "SE")
    varaibleNames <- str_replace_all(varaibleNames, "Pr...t..", "Pr(>|t|)")
    colnames(coeficients) <- varaibleNames
    
    return(coeficients)
  }  
  
  SOCO_EXCEL_IRQ3 <- initSOCODF(loadSheetFromXMLFile("08_analysis/SOCOstatistics.xlsx","PrecantageBased3IRQ")) 
  SOCO_D1 <- getAllToolsSOCO(SOCO_EXCEL_IRQ3, "D1", "F1")
  
  bsANOVA_SOCO_D1 <- getBootstrapANOVAinfo(SOCO_D1, "SOCO_D1")
  
  bsSimpleEffects_SOCO_D1 <- getBootstrapSimpleEffectsinfo(SOCO_D1,"SOCO_D1")
  