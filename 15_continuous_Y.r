# http://biostat.mc.vanderbilt.edu/wiki/Main/RmS

## ----echo=FALSE----------------------------------------------------------
require(Hmisc)
knitrSet('continuousY', cache=TRUE)
read_chunk('~/doc/rms/continuousY/shared.R')

## ----lmassump,h=3.25,w=7,mfrow=c(1,2),ps=10,mgp=c(.5, .365, 0),left=1,cap='Assumptions of the linear model (left panel) and semiparametric ordinal probit or logit (proportional odds) models (right panel).  Ordinal models do not assume any shape for the distribution of $Y$ for a given $X$; they only assume parallelism.  The linear model can relax the parallelism assumption if $\\sigma$ is allowed to vary, but in practice it is difficult to know how to vary it except for the unequal variance two-sample $t$-test.',scap='Assumptions of linear vs.\\ semiparametric models',echo=FALSE----

## ----desc,results='asis',cache=FALSE-------------------------------------

## ----lookdist,w=5.5,h=5.5,cap='Examination of normality and constant variance assumption, and assumptions for various ordinal models',scap='Examining normality and ordinal model assumptions'----

## ----comparemany,cache=TRUE,h=6.5,w=6.75,cap='Three estimated quantiles and estimated mean using 6 methods, compared against caliper-matched sample quantiles/means (circles).  Numbers are mean absolute differences between predicted and sample quantities using overlapping intervals of age and caliper matching\\index{caliper matching}.  QR:quantile regression.',scap='Six methods for estimating quantiles or means.'----

## ----predobs,w=4.75,h=4,cap='Observed (dashed lines, open circles) and predicted (solid lines, closed circles) exceedance probability distributions from a model using 6-tiles of OLS-predicted \\hba.  Key shows quantile group intervals of predicted mean \\hba.',scap='Observed and predicted distributions'----

## ----lookprobit,w=3,h=2.5,bty='l',cap='Estimated intercepts from probit model.  Linearity would have indicated Gaussian residuals.',scap='Estimated intercepts from probit model'----

## ----htwtcoef,results='asis'---------------------------------------------

## ----aichtwt-------------------------------------------------------------

## ----coxhtwtcoef,results='asis'------------------------------------------

## ----redun,cap='Variable clustering for all potential predictors'--------

## ----htchange,fig.align='right',cap="Estimated median height as a smooth function of age, allowing age to interact with sex, from a proportional odds model",scap="Median height vs.\\ age"----

## ----allocadf,w=4,cap='Generalized squared rank correlations',top=1------

## ----fitfullcasewise,results='asis'--------------------------------------

## ----casewisemeanmed,h=4,w=5,cap='Estimated mean and 0.5 and 0.9 quantiles from the log-log ordinal model using casewise deletion, along with predictions of 0.5 and 0.9 quantiles from quantile regression (QR).  Age is varied and other predictors are held constant to medians/modes.',scap='Estimated mean and quantiles from casewise deletion model.'----

## ----prbw----------------------------------------------------------------

## ----valbworm,cache=TRUE-------------------------------------------------

## ----prval,results='asis'------------------------------------------------

## ----sanova,cache=TRUE,results='asis',cap='ANOVA for reduced model, after multiple imputation, with addition of a combined effect for four size variables',scap='ANOVA for reduced model'----

## ----peffects,cache=TRUE,results='asis',cap='Partial effects (log hazard or log-log cumulative probability scale) of all predictors in reduced model, after multiple imputation',scap='Partial effects after multiple imputation',w=6.75,h=4.5,cache=TRUE----

## ----cfmissmeth,cache=TRUE-----------------------------------------------

## ----peffects2,cap='Partial effect for age from multiple imputation (center red line) and casewise deletion (center blue line) with symmetric Wald 0.95 confidence bands using casewise deletion (gray shaded area), basic bootstrap confidence bands using casewise deletion (blue lines), percentile bootstrap confidence bands using casewise deletion (dashed blue lines), and symmetric Wald confidence bands accounting for multiple imputation (red lines).',scap='Partial effect for age with bootstrap and Wald confidence bands',w=5,h=4,bot=1----

## ----meanvs,cap='Predicted mean \\hba vs.\\ predicted median and 0.9 quantile along with their marginal distributions',scap='Predicted mean, median, and 0.9 quantile of \\hba',w=4.5,h=3.5----

## ----nomogram,cap='Nomogram for predicting median, mean, and 0.9 quantile of glycohemoglobin, along with the estimated probability that \\hba $\\ge 6.5, 7$, or $7.5$, all from the log-log ordinal model',scap='Nomogram of log-log ordinal model for \\hba',w=6.75,h=5.75,ps=9----

