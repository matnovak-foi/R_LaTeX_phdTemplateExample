getSimpleEffectContrastsToolTechnique <- function(){
  TextvsJava <- c(1,1,1,1,1,-1,-1,-1,-1,-1,1,1,1,1,1,-1,-1,-1,-1,-1,1,1,1,1,1,-1,-1,-1,-1,-1)  
  TT.SHvsOthers <- c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,-2,-2,-2,-2,-2,0,0,0,0,0,1,1,1,1,1)
  
  TT.SH.NoNPPvsNPP <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0)
  TT.SH.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0)
  TT.SH.RCvsCCR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-1,0,0,0,0,0,0,0,0,0,0)
  TT.SH.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TT.SIMvsJPlag <- c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1) 
  
  TT.JPlag.NoNPPvsNPP <-    c(0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.SinglevsCombo <- c(0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.RCvsCCR <-       c(0,0,0,0,0,0,0,1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.AllnoNORvsAllNOR <- c(0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TT.SIM.NoNPPvsNPP <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1)
  TT.SIM.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1)
  TT.SIM.RCvsCCR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-1)
  TT.SIM.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0)
  
  TJ.SHvsOthers <- c(1,1,1,1,1,0,0,0,0,0,-2,-2,-2,-2,-2,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0)
  
  TJ.SH.NoNPPvsNPP <-    c(0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.RCvsCCR <-       c(0,0,0,0,0,0,0,0,0,0,0,0,1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TJ.SIMvsJPlag <- c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1,0,0,0,0,0)
  
  TJ.JPlag.NoNPPvsNPP <- c(1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.SinglevsCombo <- c(1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.RCvsCCR <- c(0,0,1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.AllnoNORvsAllNOR <- c(-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TJ.SIM.NoNPPvsNPP <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0)
  TJ.SIM.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0)
  TJ.SIM.RCvsCCR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-1,0,0,0,0,0)
  TJ.SIM.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0)
  
  simpleContrasts <- cbind(TextvsJava,TT.SHvsOthers,TT.SIMvsJPlag,TJ.SHvsOthers,TJ.SIMvsJPlag,
                           TT.SH.NoNPPvsNPP, TT.SH.SinglevsCombo, TT.SH.RCvsCCR, TT.SH.AllnoNORvsAllNOR,
                           TT.JPlag.NoNPPvsNPP,TT.JPlag.SinglevsCombo, TT.JPlag.RCvsCCR, TT.JPlag.AllnoNORvsAllNOR,
                           TT.SIM.NoNPPvsNPP, TT.SIM.SinglevsCombo, TT.SIM.RCvsCCR, TT.SIM.AllnoNORvsAllNOR,
                           TJ.SH.NoNPPvsNPP, TJ.SH.SinglevsCombo, TJ.SH.RCvsCCR, TJ.SH.AllnoNORvsAllNOR,
                           TJ.JPlag.NoNPPvsNPP,TJ.JPlag.SinglevsCombo, TJ.JPlag.RCvsCCR, TJ.JPlag.AllnoNORvsAllNOR,
                           TJ.SIM.NoNPPvsNPP, TJ.SIM.SinglevsCombo, TJ.SIM.RCvsCCR, TJ.SIM.AllnoNORvsAllNOR
                           )
  return(simpleContrasts)
}

getSimpleEffectContrastsToolTechniqueWithTE <- function(){
  TextvsJava <- c(1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1)  
  TT.SHvsOthers <- c(0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,-2,-2,-2,-2,-2,-2,0,0,0,0,0,0,1,1,1,1,1,1)
  
  TT.SH.NoNPPvsNPP <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-5,1,1,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.SH.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.5,1.5,-1,0,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.SH.RCvsCCRandTE <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-2,1,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.SH.CCRvsTE <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.SH.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TT.SIMvsJPlag <- c(0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1,-1) 
  
  TT.JPlag.NoNPPvsNPP <-       c(0,0,0,0,0,0,1,1,1,-5,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.SinglevsCombo <-    c(0,0,0,0,0,0,1.5,1.5,-1,0,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.RCvsCCRandTE <-     c(0,0,0,0,0,0,  0,  0, 1,0,-2, 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.CCRvsTE <-          c(0,0,0,0,0,0,  0,  0,-1,0, 0, 1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.AllnoNORvsAllNOR <- c(0,0,0,0,0,0, -1,  1, 0,0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TT.SIM.NoNPPvsNPP <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-5,1,1)
  TT.SIM.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.5,1.5,-1,0,-1,-1)
  TT.SIM.RCvsCCRandTE <-  c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-2,1)
  TT.SIM.CCRvsTE <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,1)
  TT.SIM.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0)
  
  TJ.SHvsOthers <- c(1,1,1,1,1,1,0,0,0,0,0,0,-2,-2,-2,-2,-2,-2,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0)
  
  TJ.SH.NoNPPvsNPP <-    c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-5,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,1.5,1.5,-1,0,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.RCvsCCRandTE <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.CCRvsTE <-     c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TJ.SIMvsJPlag <- c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0)
  
  TJ.JPlag.NoNPPvsNPP <- c(1,1,1,-5,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.SinglevsCombo <- c(1.5,1.5,-1,0,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.RCvsCCRandTE <-  c(0,0,1,0,-2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.CCRvsTE <-      c(0,0,-1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.AllnoNORvsAllNOR <- c(-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TJ.SIM.NoNPPvsNPP <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-5,1,1,0,0,0,0,0,0)
  TJ.SIM.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1.5,1.5,-1,0,-1,-1,0,0,0,0,0,0)
  TJ.SIM.RCvsCCRandTE <-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-2,1,0,0,0,0,0,0)
  TJ.SIM.CCRvsTE <-    c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,1,0,0,0,0,0,0)
  TJ.SIM.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0)
  
  simpleContrasts <- cbind(TextvsJava,TT.SHvsOthers,TT.SIMvsJPlag,TJ.SHvsOthers,TJ.SIMvsJPlag,
                           TT.SH.NoNPPvsNPP,   TT.SH.SinglevsCombo,    TT.SH.RCvsCCRandTE,    TT.SH.CCRvsTE,    TT.SH.AllnoNORvsAllNOR,
                           TT.JPlag.NoNPPvsNPP,TT.JPlag.SinglevsCombo, TT.JPlag.RCvsCCRandTE, TT.JPlag.CCRvsTE, TT.JPlag.AllnoNORvsAllNOR,
                           TT.SIM.NoNPPvsNPP,  TT.SIM.SinglevsCombo,   TT.SIM.RCvsCCRandTE,   TT.SIM.CCRvsTE,   TT.SIM.AllnoNORvsAllNOR,
                           TJ.SH.NoNPPvsNPP,   TJ.SH.SinglevsCombo,    TJ.SH.RCvsCCRandTE,    TJ.SH.CCRvsTE,    TJ.SH.AllnoNORvsAllNOR,
                           TJ.JPlag.NoNPPvsNPP,TJ.JPlag.SinglevsCombo, TJ.JPlag.RCvsCCRandTE, TJ.JPlag.CCRvsTE, TJ.JPlag.AllnoNORvsAllNOR,
                           TJ.SIM.NoNPPvsNPP,  TJ.SIM.SinglevsCombo,   TJ.SIM.RCvsCCRandTE,   TJ.SIM.CCRvsTE,   TJ.SIM.AllnoNORvsAllNOR
  )
  
  return(simpleContrasts)
}

getSimpleEffectContrastsToolTechniqueWithTEnoRC <- function(){
  TextvsJava <- c(1,1,1,1,1,-1,-1,-1,-1,-1,1,1,1,1,1,-1,-1,-1,-1,-1,1,1,1,1,1,-1,-1,-1,-1,-1)  
  TT.SHvsOthers <- c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,-2,-2,-2,-2,-2,0,0,0,0,0,1,1,1,1,1)
  
  TT.SH.NoNPPvsNPP <-       c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0)
  TT.SH.SinglevsCombo <-    c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0)
  TT.SH.CCRvsTE <-          c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,1,0,0,0,0,0,0,0,0,0,0)
  TT.SH.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TT.SIMvsJPlag <- c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1) 
  
  TT.JPlag.NoNPPvsNPP <-       c(0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.SinglevsCombo <-    c(0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.CCRvsTE <-          c(0,0,0,0,0,0,0,-1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.AllnoNORvsAllNOR <- c(0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TT.SIM.NoNPPvsNPP <-       c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1)
  TT.SIM.SinglevsCombo <-    c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1)
  TT.SIM.CCRvsTE <-          c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,1)
  TT.SIM.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0)
  
  TJ.SHvsOthers <- c(1,1,1,1,1,0,0,0,0,0,-2,-2,-2,-2,-2,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0)
  
  TJ.SH.NoNPPvsNPP <-       c(0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.SinglevsCombo <-    c(0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.CCRvsTE <-          c(0,0,0,0,0,0,0,0,0,0,0,0,-1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.SH.AllnoNORvsAllNOR <- c(0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TJ.SIMvsJPlag <- c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1,0,0,0,0,0)
  
  TJ.JPlag.NoNPPvsNPP <-       c(1,1,1,-4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.SinglevsCombo <-    c(1,1,-1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.CCRvsTE <-          c(0,0,-1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.AllnoNORvsAllNOR <- c(-1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TJ.SIM.NoNPPvsNPP <-         c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,-4,1,0,0,0,0,0)
  TJ.SIM.SinglevsCombo <-      c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,-1,0,-1,0,0,0,0,0)
  TJ.SIM.CCRvsTE <-            c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,1,0,0,0,0,0)
  TJ.SIM.AllnoNORvsAllNOR <-   c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,1,0,0,0,0,0,0,0,0)
  
  simpleContrasts <- cbind(TextvsJava,TT.SHvsOthers,TT.SIMvsJPlag,TJ.SHvsOthers,TJ.SIMvsJPlag,
                           TT.SH.NoNPPvsNPP,   TT.SH.SinglevsCombo,    TT.SH.CCRvsTE,    TT.SH.AllnoNORvsAllNOR,
                           TT.JPlag.NoNPPvsNPP,TT.JPlag.SinglevsCombo, TT.JPlag.CCRvsTE, TT.JPlag.AllnoNORvsAllNOR,
                           TT.SIM.NoNPPvsNPP,  TT.SIM.SinglevsCombo,   TT.SIM.CCRvsTE,   TT.SIM.AllnoNORvsAllNOR,
                           TJ.SH.NoNPPvsNPP,   TJ.SH.SinglevsCombo,    TJ.SH.CCRvsTE,    TJ.SH.AllnoNORvsAllNOR,
                           TJ.JPlag.NoNPPvsNPP,TJ.JPlag.SinglevsCombo, TJ.JPlag.CCRvsTE, TJ.JPlag.AllnoNORvsAllNOR,
                           TJ.SIM.NoNPPvsNPP,  TJ.SIM.SinglevsCombo,   TJ.SIM.CCRvsTE,   TJ.SIM.AllnoNORvsAllNOR
  )
  
  return(simpleContrasts)
}


getSimpleEffectContrastsToolTechniqueWithTENoRCnoCCRnoAllv3 <- function(){
  TextvsJava <-          c(1,1,1,-1,-1,-1,1,1,1,-1,-1,-1,1,1,1,-1,-1,-1)  
  TT.SHvsOthers <-       c(0,0,0,1,1,1,0,0,0,-2,-2,-2,0,0,0,1,1,1)
  
  TT.SH.NoNPPvsNPP <-    c(0,0,0,0,0,0,0,0,0,1,-2,1,0,0,0,0,0,0)
  TT.SH.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,1,0,-1,0,0,0,0,0,0)

  TT.SIMvsJPlag <-       c(0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,-1,-1,-1) 
  
  TT.JPlag.NoNPPvsNPP <-       c(0,0,0,1,-2,1,0,0,0,0,0,0,0,0,0,0,0,0)
  TT.JPlag.SinglevsCombo <-    c(0,0,0,1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TT.SIM.NoNPPvsNPP <-    c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,-2,1)
  TT.SIM.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,-1)
  
  TJ.SHvsOthers <- c(1,1,1,0,0,0,-2,-2,-2,0,0,0,1,1,1,0,0,0)
  
  TJ.SH.NoNPPvsNPP <-    c(0,0,0,0,0,0,1,-2,1,0,0,0,0,0,0,0,0,0)
  TJ.SH.SinglevsCombo <- c(0,0,0,0,0,0,1,0,-1,0,0,0,0,0,0,0,0,0)
  
  TJ.SIMvsJPlag <- c(1,1,1,0,0,0,0,0,0,0,0,0,-1,-1,-1,0,0,0)
  
  TJ.JPlag.NoNPPvsNPP <-    c(1,-2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  TJ.JPlag.SinglevsCombo <- c(1,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
  
  TJ.SIM.NoNPPvsNPP <-    c(0,0,0,0,0,0,0,0,0,0,0,0,1,-2,1,0,0,0)
  TJ.SIM.SinglevsCombo <- c(0,0,0,0,0,0,0,0,0,0,0,0,1,0,-1,0,0,0)
  
  simpleContrasts <- cbind(TextvsJava,TT.SHvsOthers,TT.SIMvsJPlag,TJ.SHvsOthers,TJ.SIMvsJPlag,
                           TT.SH.NoNPPvsNPP,   TT.SH.SinglevsCombo,   
                           TT.JPlag.NoNPPvsNPP,TT.JPlag.SinglevsCombo, 
                           TT.SIM.NoNPPvsNPP,  TT.SIM.SinglevsCombo,   
                           TJ.SH.NoNPPvsNPP,   TJ.SH.SinglevsCombo,   
                           TJ.JPlag.NoNPPvsNPP,TJ.JPlag.SinglevsCombo, 
                           TJ.SIM.NoNPPvsNPP,  TJ.SIM.SinglevsCombo
  )
  
  return(simpleContrasts)
}

getContrastTechnique <- function(){
  NoPPTvsPPT<-c(-4,1,1,1,1)
  SinglevsCombo<-c(0,-1,-1,1,1)
  RCvsCCR<-c(0,-1,1,0,0)
  AllnoNORvsAllNOR<-c(0,0,0,-1,1)
  contrastTechnique<-cbind(NoPPTvsPPT,SinglevsCombo,RCvsCCR,AllnoNORvsAllNOR)
  return(contrastTechnique)
}

getContrastTechniqueWithTE <- function(){
  NoPPTvsPPT<-c(-5,1,1,1,1,1)
  SinglevsCombo<-c(0,-1,-1,-1,1.5,1.5)
  RCvsCCRandTE<-c(0,-2,1,1,0,0)
  CCRvsTE<-c(0,0,-1,1,0,0)
  AllnoNORvsAllNOR<-c(0,0,0,0,-1,1)
  contrastTechnique<-cbind(NoPPTvsPPT,SinglevsCombo,RCvsCCRandTE,CCRvsTE,AllnoNORvsAllNOR)
  return(contrastTechnique)
}

getContrastTechniqueWithTENoRC <- function(){
  NoPPTvsPPT<-c(-4,1,1,1,1)
  SinglevsCombo<-c(0,-1,-1,1,1)
  CCRvsTE<-c(0,-1,1,0,0)
  AllnoNORvsAllNOR<-c(0,0,0,-1,1)
  contrastTechnique<-cbind(NoPPTvsPPT,SinglevsCombo,CCRvsTE,AllnoNORvsAllNOR)
  return(contrastTechnique)
}

getContrastTechniqueWithTENoRCnoCCRnoAllv3 <- function(){
  NoPPTvsPPT<-c(-2,1,1)
  SinglevsCombo<-c(0,-1,1)
  contrastTechnique<-cbind(NoPPTvsPPT,SinglevsCombo)
  return(contrastTechnique)
}

getContrastsToolTextOrJava <- function(){
  SherlockvsOther<-c(1,1,-2)
  JPlagvsSIM<-c(1,-1,0)
  contrastToolsOneType <-cbind(SherlockvsOther, JPlagvsSIM)
  return(contrastToolsOneType)
}

getContrastsAllTools <- function(){
  TextvsJava <- c(1,1,1,-1,-1,-1)
  Text.SherlockvsOthers <- c(0,0,0,1,1,-2)
  Java.SherlockvsOthers <- c(1,1,-2,0,0,0)
  Text.SIMvsJPlag <- c(0,0,0,1,-1,0)
  Java.SIMvsJPlag <- c(1,-1,0,0,0,0)
  contrastToolsAll <- cbind(TextvsJava, Text.SherlockvsOthers,Java.SherlockvsOthers,Text.SIMvsJPlag,Java.SIMvsJPlag)
  return(contrastToolsAll)
}

renameTechniques <- function(dataFrame) {
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Technique","RemoveComments",RC)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Technique","RemoveCommonCode",CCR)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Technique","NoPreprocessing",NoPPT)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Technique","TemplateExclusion",TE)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Technique","Allv3",Allv3)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Technique","Allv4",Allv4)
}
  
renameTools <- function(dataFrame) {
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Tool","SIMGruneText",SIMtext)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Tool","SIMGruneJava",SIMjava)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Tool","JPlagText",JPlagtext)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Tool","JPlagJava",JPlagjava)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Tool","SherlockText",Sherlocktext)
  dataFrame <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrame,"Tool","SherlockJava",Sherlockjava)
}

initSOCODF <- function(excelReadDF) {
  preparedDF <- excelReadDF[, c("Tool","ToolType","Technique","Assignment","Precision","Recall","F1","Group","FalsePositives")] 
  preparedDF <- dfmHelp$replaceAllNaValuesWithValue(preparedDF,0)
  
  preparedDF <- renameTechniques(preparedDF)
  preparedDF <- renameTools(preparedDF)
  
  preparedDF$Technique <- ordered(preparedDF$Technique,levels = c(NoPPT, RC,CCR,Allv3,Allv4))
  preparedDF$Tool <- ordered(preparedDF$Tool,levels = c(JPlagjava, SIMjava,Sherlockjava,JPlagtext,SIMtext,Sherlocktext))

  preparedDF[,COMBO_VAR_PPT_TOOL] <- paste(preparedDF$Tool,"and",preparedDF$Technique)
  preparedDF <- dfmHelp$orderDataFrameValuesByColumns(preparedDF, columnNames = c("Assignment","Technique","ToolType","Tool"))
  
  return(preparedDF)
}

initSTUDENTDF <- function(excelReadDF) {
  preparedDF <- excelReadDF[, c("Tool","ToolType","Technique","Assignment","Precision","Recall","F1","Group","FalsePositives","FalseNegatives")] 
  preparedDF <- dfmHelp$replaceAllNaValuesWithValue(preparedDF,0)
  
  preparedDF <- renameTechniques(preparedDF)
  preparedDF <- renameTools(preparedDF)
  
  preparedDF$Technique <- ordered(preparedDF$Technique,levels = c(NoPPT, RC,CCR, TE, Allv3,Allv4))
  preparedDF$Tool <- ordered(preparedDF$Tool,levels = c(JPlagjava, SIMjava,Sherlockjava,JPlagtext,SIMtext,Sherlocktext))
  
  preparedDF[,COMBO_VAR_PPT_TOOL] <- paste(preparedDF$Tool,"and",preparedDF$Technique)
  preparedDF <- dfmHelp$orderDataFrameValuesByColumns(preparedDF, columnNames = c("Assignment","Technique","ToolType","Tool"))
  
  return(preparedDF)  
}

getAllToolsStudent <- function(preparedDF,dataset,metric){
  STUDENT <- prepareSTUDENTForGroupWithMetric(preparedDF,dataset,metric)
  contrasts(STUDENT$Technique) <- getContrastTechniqueWithTE()
  contrasts(STUDENT$Tool) <- getContrastsAllTools()
  contrasts(STUDENT$ToolPPTCombo) <- getSimpleEffectContrastsToolTechniqueWithTE()
#  contrasts(STUDENT$Technique)
#  contrasts(STUDENT$Tool)
#  contrasts(STUDENT$ToolPPTCombo)
  return(STUDENT)
}

getAllToolsStudentNoRC <- function(preparedDF,dataset,metric){
  STUDENT <- prepareSTUDENTForGroupWithMetric(preparedDF,dataset,metric)
  contrasts(STUDENT$Technique) <- getContrastTechniqueWithTENoRC()
  contrasts(STUDENT$Tool) <- getContrastsAllTools()
  contrasts(STUDENT$ToolPPTCombo) <- getSimpleEffectContrastsToolTechniqueWithTEnoRC()
  #  contrasts(STUDENT$Technique)
  #  contrasts(STUDENT$Tool)
  #  contrasts(STUDENT$ToolPPTCombo)
  return(STUDENT)
}

getAllToolsStudentNoRCnoCCRnoAllv3 <- function(preparedDF,dataset,metric){
  STUDENT <- prepareSTUDENTForGroupWithMetric(preparedDF,dataset,metric)
  contrasts(STUDENT$Technique) <- getContrastTechniqueWithTENoRCnoCCRnoAllv3()
  contrasts(STUDENT$Tool) <- getContrastsAllTools()
  contrasts(STUDENT$ToolPPTCombo) <- getSimpleEffectContrastsToolTechniqueWithTENoRCnoCCRnoAllv3()
  #  contrasts(STUDENT$Technique)
  #  contrasts(STUDENT$Tool)
  #  contrasts(STUDENT$ToolPPTCombo)
  return(STUDENT)
}

getAllToolsSOCO <- function(preparedDF,dataset,metric){
  SOCO <- prepareSOCOForGroupWithMetric(preparedDF,dataset,metric)
  contrasts(SOCO$Technique) <- getContrastTechnique()
  contrasts(SOCO$Tool) <- getContrastsAllTools()
  contrasts(SOCO$ToolPPTCombo) <- getSimpleEffectContrastsToolTechnique()
#  contrasts(SOCO$Technique)
#  contrasts(SOCO$Tool)
#  contrasts(SOCO$ToolPPTCombo)
  return(SOCO)
}

getJavaToolsSOCO <- function(SOCO){
  SOCO_java <- dfmHelp$removeUnusedFactorLevels(SOCO[SOCO$ToolType == "Java",])
  contrasts(SOCO_java$Technique) <- getContrastTechnique()
  contrasts(SOCO_java$Tool) <- getContrastsToolTextOrJava()
  contrasts(SOCO_java$Technique)
  contrasts(SOCO_java$Tool)
  return(SOCO_java)
}


getTextToolsSOCO <- function(SOCO){
  SOCO_text <- dfmHelp$removeUnusedFactorLevels(SOCO[SOCO$ToolType == "Text",])
  contrasts(SOCO_text$Technique) <- getContrastTechnique()
  contrasts(SOCO_text$Tool) <- getContrastsToolTextOrJava()
  contrasts(SOCO_text$Technique)
  contrasts(SOCO_text$Tool)
  return(SOCO_text)
}

prepareSTUDENTForGroupWithMetric <- function(studentDF,group,metric){
  prepareForGroupWithMetric(studentDF,group,metric)  
}

prepareSOCOForGroupWithMetric <- function(socoDF, group, metric){
  prepareForGroupWithMetric(socoDF,group,metric)
}

prepareForGroupWithMetric <- function(df,group,metric){
  createPrecetnage <- function(dataFrame, columnName){
    dataFrame[,DEPENDENT_VAR] <- as.numeric(as.character(dataFrame[,columnName]));
    return(dataFrame) 
  }
  
  df <- df[df$Group == group,] 
  df <- createPrecetnage(df,metric)
  df[,DEPENDENT_VAR] <- round(df[,DEPENDENT_VAR], digits = 2)
  df <- dfmHelp$removeUnusedFactorLevels(df)
  
  return(df)  
}

compareTechniquesForToolwithTtest <- function(dataFrame,tool,technique1,technique2){
  toolDF <- unstack(dataFrame[dataFrame$Tool==tool,],Precentage~Technique)
  result <- with(toolDF,(t.test(toolDF[,technique1], toolDF[,technique2], alternative='two.sided', conf.level=.95, paired=TRUE)))
  return(result)
}

performLeveneTest <- function(dataFrame){
  lista<- list()
  result1 <- leveneTest(dataFrame[,DEPENDENT_VAR], dataFrame$Tool, center=median)
  result2 <- leveneTest(dataFrame[,DEPENDENT_VAR], dataFrame$Technique, center=median)
  result3 <- leveneTest(dataFrame[,DEPENDENT_VAR], interaction(dataFrame$Tool,dataFrame$Technique), center=median)

  lista <- listmHelp$addElementToList(lista,result1) 
  lista <- listmHelp$addElementToList(lista,result2) 
  lista <-listmHelp$addElementToList(lista,result3) 
  names(lista) <- c("Tool","Technique","ToolandTechnique")
  return(lista)
}

performShapiroWilkTest <- function(dataframe, pValueCriteria, PASSED_TEXT="Normal", FAILED_TEXT="Non-normal"){
  lista <- list()
  listNames <- c()
  failed <- c()
  passed <- c()
  for(toolName in levels(dataframe$Tool)){
    for(techniqueName in levels((dataframe$Technique))){
      pairname <- paste(toolName,"-",techniqueName)
      listNames <- union(listNames,pairname)
      #print(paste(toolName,"-",techniqueName))
      result <- shapiro.test(dataframe[dataframe$Tool == toolName & dataframe$Technique == techniqueName, DEPENDENT_VAR])
      lista <- listmHelp$addElementToList(lista,result)
      if(result$p.value < pValueCriteria){
        failed <- union(failed,paste0(pairname," with W=",format(result$statistic,3),", p=",format(result$p.value,2),";"))
      }else { 
        passed <- union(passed,paste0(pairname," with W=",format(result$statistic,3),", p=",format(result$p.value,2),";"))
      }
    }
  }
  
  lista <- listmHelp$addElementToList(lista,passed)
  lista <- listmHelp$addElementToList(lista,failed)
  listNames <- union(listNames,PASSED_TEXT)
  listNames <- union(listNames,FAILED_TEXT)
  names(lista)<-listNames
  
  return(lista)
}

getResidualsForTretement <- function(dataFrame, tool, technique){
  tretementData <- dataFrame[dataFrame$Tool == tool & dataFrame$Technique == technique,]
  tretementData$residuals <- tretementData[,DEPENDENT_VAR]- mean(tretementData[,DEPENDENT_VAR])
  return(tretementData$residuals)
}

getResidualsForAllTreatments <- function(dataFrame, factorVariable, dependentVariable){
  dfList <- list()
  i=0
  for(variableLevel in levels(dataFrame[,factorVariable])){
    levelData <- dataFrame[dataFrame[,factorVariable] == variableLevel,dependentVariable]
    residuals <-  levelData-mean(levelData)
    df <- data.frame(VariableLevel=variableLevel,Residuals=residuals)
    dfList<-listmHelp$addElementToList(dfList,df)
  }
  return(dfmHelp$joinListOfDataFrames(dfList,"VariableLevel"))
}

calculateResidualsFromModel <- function(dataFrame, fixedEffectsModel){
  dataFrame$residStudentized <- rstudent(fixedEffectsModel)
  dataFrame$residualsStandardized <- scale(resid(fixedEffectsModel))
  dataFrame$fittedValues <- fitted.values(fixedEffectsModel)  
  return(dataFrame)
}

showResidualHistogram <- function(dataFrame){
  graphBuilderHelp$xAxisTitle = "Density"
  graphBuilderHelp$yAxisTitle = "Studentized Residual"
  graphBuilderHelp$graphTitle = "Histogram of the residuals" 
  graphBuilderHelp$facetWrapVariable = NULL
  graphBuilderHelp$xAxisLabelAngle = 0
  graphBuilderHelp$showHistogram(dataFrame,"residStudentized",binwidth = 0.1)
}

showResidualScatterPlot<- function(dataFrame){
  graphBuilderHelp$xAxisTitle = "Fitted Values"
  graphBuilderHelp$yAxisTitle = "Studentized Residual"
  graphBuilderHelp$graphTitle = "Scatterplot of the residuals" 
  graphBuilderHelp$facetWrapVariable = NULL
  graphBuilderHelp$xAxisLabelAngle = 0
  graphBuilderHelp$showScatterPlot(dataFrame,"fittedValues","residStudentized")
}

showResidualQQPlot <- function(dataFrame) {
  graphBuilderHelp$xAxisTitle = "Theoretical Values"
  graphBuilderHelp$yAxisTitle = "Observed Values"
  graphBuilderHelp$graphTitle = "Q-Q plot of the residuals" 
  graphBuilderHelp$facetWrapVariable = NULL
  graphBuilderHelp$xAxisLabelAngle = 0
  graphBuilderHelp$showQQPlot(dataFrame,"residStudentized",qqLine = TRUE)
}

recodeByContrast <- function(dataFrame, varName, contrastIndex){
  contrastTable <- contrasts(dataFrame[,varName])
  dataFrameNew <- dataFrame
  contrastNames <- colnames(contrastTable)
  contrastName <- contrastNames[contrastIndex]
  newNames <- unlist(strsplit(contrastName,"vs"))
  newNames[1]
  newNames[2]
  
  for(rowname in rownames(contrastTable)){
    value <- contrastTable[rowname,contrastName]
    if(value < 0){
      dataFrameNew <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrameNew,varName,rowname,newNames[1]) 
    }   else if(value > 0){ 
      dataFrameNew <- dfmHelp$replaceAllValuesInColumnWithValue(dataFrameNew,varName,rowname,newNames[2]) 
    } else {
      dataFrameNew <- dataFrameNew[dataFrameNew[,varName] != rowname,]
    }
  }
  dataFrameNew <- dfmHelp$removeUnusedFactorLevels(dataFrameNew)
  return(dataFrameNew)
}

getContrastInteractionGraphs <- function(dataFrame, var1, var2, showMeanComparisonGraphFunction){
  var1contrastCount <- ncol(contrasts(dataFrame[,var1]))
  var2contrastCount <- ncol(contrasts(dataFrame[,var2]))
  listInteractionGraphs <- list()
  for(i in 1:var1contrastCount){
    for(j in 1:var2contrastCount){
      newDF <- recodeByContrast(dataFrame, var1, i)
      contrasts(newDF[,var2]) <- contrasts(dataFrame[,var2])
      newDF <- recodeByContrast(newDF, var2, j)
      listInteractionGraphs <- listmHelp$addElementToList(listInteractionGraphs,showMeanComparisonGraphFunction(newDF))
    }
  }
  return(listInteractionGraphs)
}

rcontrast<-function(t, df)
{
  r<-sqrt(t^2/(t^2 + df))
  return(r)
}

getContrastsEffectSizes <- function(mlmModel){
  modelSummary <- summary(mlmModel)
  lista <- list()
  tTable <- NULL
  tValueName <- NULL
  dfValueName <- NULL
  
  if(class(mlmModel)=="lme"){
    tTable <- modelSummary$tTable
    tValueName <- "t-value"
    dfValueName <- "DF"
  } else if(class(mlmModel)=="lmerMod" || class(mlmModel)=="lmerModLmerTest") {
    tTable <- modelSummary$coefficients
    tValueName <- "t value"
    dfValueName <- "df"
  }else{
    return(data.frame(ContrastName=row,EffectSize=round(r,2)))
  }
  
  for(row in rownames(tTable)){
    t=tTable[row,tValueName]
    df=tTable[row,dfValueName]
    r = rcontrast(t,df)
    df <- data.frame(ContrastName=row,EffectSize=round(r,2))
    lista <- listmHelp$addElementToList(lista,df)
  }
  df <- dfmHelp$joinListOfDataFrames(lista,c("ContrastName"))
  return(df)
}


performANOVA <- function(dataFrame){
  return(ezANOVA(dataFrame,dv=.(Precentage),wid = .(Assignment), within=.(Tool,Technique),detailed = TRUE, return_aov = TRUE, type=3))
}

performBootstrapANOVA <- function(dataFrame,repetitions,getFullModelFunction){
  
  performBootstrap <- function(dataFrame,repetitions,nullModel){
    
    getANOVABootStatistics <- function(dataFrame, idx) {
        bootstrapDF <- dataFrame
        bootstrapDF$Precentage <- Yhat + Error[idx]
        fullModel <- getFullModelFunction(bootstrapDF)
        
        progressBar$tick()$print()  # update progress bar
        
        s <- summary(fullModel)
        
        c(anovaF=anova(fullModel)[,"F value"],
       #  anovaSS=anova(fullModel)[,"Sum Sq"],
       #  anovaMS=anova(fullModel)[,"Mean Sq"],
       #  betaEstimate=s$coefficients[,"Estimate"],
       #  betaSTD=s$coefficients[,"Std. Error"],
          betaTvalue=s$coefficients[,"t value"],
          effectSizes=getContrastsEffectSizes(fullModel)[,"EffectSize"]
        )
    }
    
    progressBar <- progress_estimated(repetitions+1) 
    
    Error <- residuals(nullModel)            
    Error <- Error / sqrt(1-hatvalues(nullModel))  
    Yhat <- fitted(nullModel)   
    
    boot(dataFrame, statistic=getANOVABootStatistics, R=repetitions)
  }
  
  createAnovaResult <- function(orgFullModel, bootstraps){
    startIndex = 1 
    
    orgFullModelAnova <- anova(orgFullModel)
    
    addBootstrapValuesToDF(orgFullModelAnova,bootstraps,startIndex)
  }
  
  createCoeffiecientsResult <- function(orgFullModel, bootstraps){
    startIndex = nrow(anova(orgFullModel))+1
    
    summaryOrg <- summary(orgFullModel)
    coeffiecients <- summaryOrg$coefficients
    
    addBootstrapValuesToDF(coeffiecients,bootstraps,startIndex)
  }
  
  addBootstrapValuesToDF <- function(dataFrame,bootstraps,bootstrapStartIndex){
    
    calculateAproximatePvalue <- function(bootstraps,index){
      (sum(abs(bootstraps$t[,index]-1) > abs(bootstraps$t0[index]-1)) + 1)/(1+bootstraps$R)
    }
    
    dataFrame <- cbind(dataFrame, data.frame(p.boot = rep(NA, nrow(dataFrame))))
    
    for(index in 1:nrow(dataFrame)){
      p.boot <- calculateAproximatePvalue(bootstraps,index+bootstrapStartIndex-1)
      dataFrame[index,"p.boot"] <- p.boot
    }
    
    return(dataFrame)  
  }
  
  createEffectSizeResult <- function(orgFullModel, bootstraps){
    startIndex = nrow(anova(orgFullModel))+nrow(summary(orgFullModel)$coefficients)+1
    effectSizes = getContrastsEffectSizes(orgFullModel)
    effectSizes <- cbind(effectSizes, 
                         data.frame(CI.LB = rep(NA, nrow(effectSizes)),
                                    CI.UB = rep(NA, nrow(effectSizes))#,
                                  #  bootLowBCA = rep(NA, nrow(effectSizes)),
                                  #  bootHighBCA = rep(NA, nrow(effectSizes))
                                    ))
    for(index in 1:nrow(effectSizes)){
      intervals <- boot.ci(bootstraps,type="perc",index=index+startIndex-1)
      if(!is.null(intervals)){
        effectSizes[index,"CI.LB"] <- intervals$percent[4]
        effectSizes[index,"CI.UB"] <- intervals$percent[5]
      }
      #intervals <- boot.ci(bootstraps,type="bca",index=index+startIndex-1)
      #if(!is.null(intervals)){
      #  effectSizes[index,"bootLowBCA"] <- intervals$bca[4]
      #  effectSizes[index,"bootHighBCA"] <- intervals$bca[5]
      #}
    }
    
    return(effectSizes)  
  }
  
  results <- list()

  bootstraps <- performBootstrap(dataFrame,repetitions,getNullModelWithRandomIntercepts(dataFrame))
  orgFullModel <- getFullModelFunction(dataFrame)

  results <- listmHelp$addElementToList(results,bootstraps)
  results <- listmHelp$addElementToList(results,createAnovaResult(orgFullModel, bootstraps))
  results <- listmHelp$addElementToList(results,summary(orgFullModel))
  results <- listmHelp$addElementToList(results,createCoeffiecientsResult(orgFullModel,bootstraps))
  
  bootstrapsFull <- performBootstrap(dataFrame,repetitions,getFullModelFunction(dataFrame))
  results <- listmHelp$addElementToList(results,createEffectSizeResult(orgFullModel,bootstrapsFull))
  results <- listmHelp$addElementToList(results,bootstrapsFull)
  names(results) <- c("Bootstrap Info","ANOVA", "SummaryFullModel", "Coeficients","EffectSize - fullmodel","Bootstrap Info - full")
  return(results)
}

compareModelsWithBootstrapLRT <- function(dataFrame,rep){
  a <- PBmodcomp(getToolOnlyModelWithRandomIntercepts(dataFrame),
                 getNullModelWithRandomIntercepts(dataFrame),nsim=rep)
  b <- PBmodcomp(getToolAndTechniqueNoInteractionModelWithRandomIntercepts((dataFrame)),
                 getToolOnlyModelWithRandomIntercepts(dataFrame),nsim=rep)
  c <- PBmodcomp(getFullModel(dataFrame),
                 getToolAndTechniqueNoInteractionModelWithRandomIntercepts((dataFrame)),nsim=rep)
  
  all <- anova(getNullModelWithRandomIntercepts(dataFrame),
               getToolOnlyModelWithRandomIntercepts(dataFrame),
               getToolAndTechniqueNoInteractionModelWithRandomIntercepts((dataFrame)),
               getFullModel(dataFrame))
  
  all$p.boot = c("",a$test["PBtest","p.value"],b$test["PBtest","p.value"],c$test["PBtest","p.value"])
  
  return(all)
}


getFixedEffectsModel <- function(dataFrame){
  lm(Precentage ~ Tool + Technique + Tool:Technique, data=dataFrame)  
}

getNullModel <- function(dataFrame){
  lmer(Precentage ~ 1, 
       data = dataFrame, REML = FALSE)
}

getTechniqueOnlyModel <- function(dataFrame){
  lmer(Precentage ~ Technique, 
       data = dataFrame, REML = FALSE)
}

getToolOnlyModel <- function(dataFrame){
  lmer(Precentage ~ Tool, 
       data = dataFrame, REML = FALSE)
}

getNullModelWithRandomIntercepts <- function(dataFrame){
  lmer(Precentage ~ (1 | Assignment) 
                  + (1 | Tool:Assignment)
                  + (1 | Technique:Assignment), 
                  data = dataFrame, REML = FALSE)
}

getTechniqueOnlyModelWithRandomIntercepts <- function(dataFrame){
  lmer(Precentage ~ Technique
       + (1 | Assignment) 
       + (1 | Tool:Assignment)
       + (1 | Technique:Assignment), 
       data = dataFrame, REML = FALSE)
}

getToolOnlyModelWithRandomIntercepts <- function(dataFrame){
  lmer(Precentage ~ Tool
       + (1 | Assignment) 
       + (1 | Tool:Assignment)
       + (1 | Technique:Assignment), 
       data = dataFrame, REML = FALSE)
}

getToolAndTechniqueNoInteractionModelWithRandomIntercepts <- function(dataFrame){
  lmer(Precentage ~ Tool + Technique
       + (1 | Assignment) 
       + (1 | Tool:Assignment)
       + (1 | Technique:Assignment), 
       data = dataFrame, REML = FALSE)
}


getFullModel <- function(dataFrame){
  lmer(Precentage ~ Tool + Technique + Tool:Technique 
       + (1 | Assignment) 
       + (1 | Tool:Assignment)
       + (1 | Technique:Assignment), 
       data=dataFrame, REML = FALSE)
}

getFullModelForSimpleEffect <- function(dataFrame){
  lmer(Precentage ~ ToolPPTCombo
       + (1 | Assignment) 
       + (1 | Tool:Assignment)
       + (1 | Technique:Assignment), 
       data=dataFrame, REML = FALSE)
}

perofrmANOVAasGLM <- function(dataFrame){
  glmModel = gls(Precentage ~ 1, 
             data = dataFrame, 
             method = "ML", na.action = "na.omit")
  baseline1 <- lme(Precentage ~ 1, 
                  random = ~1|Assignment, 
                  data=dataFrame, method="ML")
  baseline2 <- lme(Precentage ~ 1, 
                  random = ~1|Assignment/Tool, 
                  data=dataFrame, method="ML")
  baseline3 <- lme(Precentage ~ 1, 
                  random = ~1|Assignment/Tool/Technique, 
                  data=dataFrame, method="ML")
  toolModel <- update(baseline3, .~. + Tool)
  techniqueModel <- update(toolModel, .~. + Technique)
  interactionModel <- update(techniqueModel, .~. + Tool:Technique)
  postModel1 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                   random = ~1|Assignment/Tool, 
                   data=dataFrame, method="ML")
  postModel2 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                    random = ~1|Assignment, 
                    data=dataFrame, method="ML")
  postModel3 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                    random = ~1|Assignment/Technique, 
                    data=dataFrame, method="ML")
  postModel4 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                    random = ~1|Tool/Technique, 
                    data=dataFrame, method="ML")
  postModel5 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                    random = ~1|Technique, 
                    data=dataFrame, method="ML")
  postModel6 <- lme(Precentage ~ Tool + Technique + Tool:Technique, 
                    random = ~1|Tool, 
                    data=dataFrame, method="ML")
  print(summary(interactionModel))
  print(anova(glmModel,baseline1,baseline2,baseline3,toolModel,techniqueModel,interactionModel,postModel1,postModel2,postModel3,postModel4,postModel5,postModel6))
  return(interactionModel)
}

printMinimumCorrelation <- function(dataFrame){
  #dataFrameUnstacked <- unstack(dataFrame,dataFrame[,DEPENDENT_VAR]~dataFrame[,COMBO_VAR_PPT_TOOL])
  dataFrameUnstacked <- unstack(dataFrame,Precentage~ToolPPTCombo)
  min(abs(cor(dataFrameUnstacked)))  
}

rFromWilcox<-function(wilcoxModel, N){
  z<- qnorm(wilcoxModel$p.value/2)
  r<- z/ sqrt(N)
  cat(wilcoxModel$data.name, "Effect Size, r = ", r)
  return(r)
}

getRowForSignificanceAnalysis <- function(bsSimpleEffectsAnalsys, simpleEffectContrast, p.value=0.01){
  significantDatasets <- ""
  nonsingificantDatasets <- ""
  for(rowname in rownames(renameSimpleEffectSizeCoeficientNames(bsSimpleEffectsAnalsys[[1]]))){
    for(analysisName in names(bsSimpleEffectsAnalsys)){
      if(str_count(rowname,simpleEffectContrast)==1){
        analysis <- bsSimpleEffectsAnalsys[[analysisName]]
        analysis <- renameSimpleEffectSizeCoeficientNames(analysis)
       
        if(analysis[rowname,"p.boot"]<p.value)
          significantDatasets=paste(significantDatasets,analysisName) 
        else
          nonsingificantDatasets=paste(nonsingificantDatasets,analysisName) 
      }
    }
  }
  return(list(significantDatasets,nonsingificantDatasets))
}

markRowFroSignificanceAnalysis <- function(datasetsNames, datasets, dependentVariable, contrastVariable, contrastName){
  getContrastIdByContrastName<-function(dataset,contrastVariable,contrastName) {
    allContrasts <- colnames(contrasts(dataset[,contrastVariable]))  
    contrastId=1
    for(contrast in allContrasts){
      if(contrast==contrastName)
        break
      else
        contrastId=contrastId+1
    }
    return(contrastId)
  }
  contrastId = getContrastIdByContrastName(datasets[[1]],contrastVariable,contrastName)
  contrastParts <- strsplit(contrastName,"vs")[[1]]
  result = ""
  for(datasetName in datasetsNames){
    if(datasetName!=""){
      dataFrameRecoded <- recodeByContrast(datasets[[datasetName]],contrastVariable,contrastId)
      dataFramePrepared <- as.data.frame(unstack(dataFrameRecoded,as.formula(paste0(dependentVariable,"~",contrastVariable))))
      part1Mean <- mean(dataFramePrepared[,contrastParts[1]])
      part2Mean <- mean(dataFramePrepared[,contrastParts[2]])
      if(part1Mean < part2Mean){
        result = paste(result,paste0("+",datasetName))  
      } else {
        result = paste(result,paste0("-",datasetName)) 
      }
    }
  }
  return(result)
}
