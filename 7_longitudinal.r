# http://biostat.mc.vanderbilt.edu/wiki/Main/RmS

## ----echo=FALSE----------------------------------------------------------
require(Hmisc)
knitrSet('longit')
read_chunk('~/doc/rms/Longitudinal/shared.R')

## ----spaghetti,h=5,w=7,ps=7,cap='Time profiles for individual subjects, stratified by study site and dose'----

## ----quartiles,cap='Quartiles of \\co{TWSTRS} stratified by dose',w=5,h=4----

## ----e-------------------------------------------------------------------

## ----k-------------------------------------------------------------------

## ----l,results='asis'----------------------------------------------------

## ----variogram,cap='Variogram, with assumed correlation pattern superimposed'----

## ----resid,h=6,w=7.5,cap='Three residual plots to check for absence of trends in central tendency and in variability.  Upper right panel shows the baseline score on the $x$-axis.  Bottom left panel shows the mean $\\pm 2\\times$SD.  Bottom right  panel is the QQ plot for checking normality of residuals from the GLS fit.',scap='Residual plots for GLS model'----

## ----anova,results='asis',w=3.25,h=2.25,cap='Results of \\fu{anova} from generalized least squares fit with continuous time AR1 correlation structure.  As expected, the baseline version of $Y$ dominates.',scap='ANOVA for GLS model'----

## ----pleffects,h=5,w=7,cap='Estimated effects of time, baseline TWSTRS, age, and sex'----

## ----o,results='asis'----------------------------------------------------

## ----p-------------------------------------------------------------------

## ----q-------------------------------------------------------------------

## ----contrasts,h=3,w=5.5,cap='Contrasts and 0.95 confidence limits from GLS fit'----

## ----nomogram,h=5,w=6,cap='Nomogram from GLS fit.  Second axis is the baseline score.',scap='Nomomgram from GLS fit.'----

