##### This code is part of the Finance with R project @ http://www.finance-r.com/
##### (c)2012-2013 Ronald Hochreiter <ron@hochreiter.net>

##### R for Finance - Webinar 1301

### Data Management

# load a package for time series management
require("xts")

# load a package for importing Excel data sheets
require("xlsx")

# load hedge fund data from an excel sheet
edhec_input_xlsx <- read.xlsx("edhec-nov12.xlsx", 1)

# convert raw data to an xts time series object
edhec <- as.xts(edhec_input_xlsx[,2:14], order.by=as.Date(edhec_input_xlsx$Date, "%Y-%m-%d"))

# convert to returns
edhec <- edhec / 100 # convert percentage to return

# check the dataset manually
edhec
head(edhec)
tail(edhec)
summary(edhec)

mean(edhec)

apply(edhec, 2, mean) # 2=column-wise
apply(edhec, 2, sd)
apply(edhec, 2, quantile, probs=0.05)

risk <- data.frame()
risk <- rbind(risk, apply(edhec, 2, mean))
risk <- rbind(risk, apply(edhec, 2, sd))
risk <- rbind(risk, apply(edhec, 2, quantile, probs=0.05))
names(risk) <- names(edhec)
row.names(risk) <- c("Mean", "SD", "VaR(0.05)")

cor(edhec)
correlation<- cor(edhec)

# write an Excel sheet 
write.xlsx(edhec, file="edhec_report.xlsx", sheetName="Data")
write.xlsx(risk, file="edhec_report.xlsx", sheetName="Summary", append=TRUE)
write.xlsx(correlation, file="edhec_report.xlsx", sheetName="Correlation", append=TRUE)

# select a time frame
data <- edhec['2005'] # 2005
data <- edhec['2005/2006'] # beginning 2005 to end 2006
data <- edhec['2005-07/2006-06'] # beginning Q3/2005 to end Q2/2006

# plot all strategies
strategies = dim(edhec)[2]
for (s in 1:strategies) {
  plot(edhec[,s], main=names(edhec)[s])
}

# scale y-axis
max_ret <- max(edhec)
min_ret <- min(edhec)
for (s in 1:strategies) {
  plot(edhec[,s], main=names(edhec)[s], ylim=c(min_ret, max_ret))
}

##### Simple Portfolio Optimization

# load a library which provides portfolio optimization
library("tseries")

# portfolio information
upper_investment_limit <- 0.4

# select asset data
data <- edhec['2003/2006']
result1 <- portfolio.optim(data, reshigh=rep(upper_investment_limit, strategies))
portfolio1 <- result1$pw

data <- edhec['2007/2010']
result2 <- portfolio.optim(data, reshigh=rep(upper_investment_limit, strategies))
portfolio2 <- result2$pw

# choose one of the two portfolios
portfolio <- portfolio2

# normalize portfolio (numerical instabilities)
eps <- 0.02
portfolio[which(portfolio<eps)] <- 0
portfolio <- portfolio/sum(portfolio)

# barplot
ylim_max <- max(ceiling(portfolio*10)/10)+0.1
portfolio_bar <- barplot(portfolio, names.arg=1:strategies, ylim=c(0, ylim_max),col="#6699cc")
text(x=portfolio_bar, y=portfolio+par("cxy")[2], round(portfolio,4)*100, xpd=TRUE)
legend(0, ylim_max, legend=paste(1:13, "... ", names(edhec), sep=""), cex=0.65)

# pie chart
pie_labels <- names(data)
pie_labels[which(portfolio <= 0)] <- NA
pie(portfolio, labels=pie_labels)

# 3d pie chart
library(plotrix)
pie3D(portfolio, main="Optimal Portfolio", labels=pie_labels[which(portfolio > 0)], labelcex=0.8)

##### Portfolio Optimization - Part II

library("fPortfolio")
constraints <- c('LongOnly')
data <- as.timeSeries(edhec)

# constraints <- c('minW[1:strategies]=0', 'maxW[1:strategies]=0.5')

# now the optimization specs
spec <- portfolioSpec()
setNFrontierPoints(spec) <- 25
setSolver(spec) <- "solveRquadprog"

# check the constraints
portfolioConstraints(data, spec, constraints)

# do the optimization
frontier <- portfolioFrontier(data, spec, constraints)
print(frontier)

# plot frontier
tailoredFrontierPlot(object = frontier)

# plot weights
weightsPlot(frontier)
weightsPlot(frontier, col=rainbow(strategies))
weightsPlot(frontier, col=heat.colors(strategies))

##### Portfolio Optimization - Data from the Web

# Dow Jones Industrial Average (December 2012)
stocks <- c("AA","AXP","BA","BAC","CAT","CSCO","CVX","DD","DIS","GE","HD","HPQ","IBM","INTC","JNJ","JPM","KO","MCD","MMM","MRK","MSFT","PFE","PG","T","TRV","UNH","UTX","VZ","WMT","XOM")

# get data from the last year
today <- Sys.Date()

# working with dates is fun thanks to lubridate
require("lubridate")
yesterday <- Sys.Date() - days(1)
one_year_ago <- Sys.Date() - years(1)

require("quantmod")
tickers <- getSymbols(stocks, from=one_year_ago, to=yesterday)

# combine the adjusted close values in one (xts) data.frame
dataset <- Ad(get(tickers[1]))
for (i in 2:length(tickers)) { dataset <- merge(dataset, Ad(get(tickers[i]))) }

# handle missing values
data_omit <- na.omit(dataset) # omit values with NA values
data_locf <- na.locf(dataset) # last observation carried forward
data_approx <- na.approx(dataset) # linear approximation
data_spline <- na.spline(dataset) # cubic spline interpolation

# calculate returns using quantmod function ROC
return_lag = 5 # (crude) weekly returns
data = na.omit(ROC(data_spline, n=return_lag, type="discrete"))
names(data) <- stocks

# Portfolio Optimization
dataTS <- as.timeSeries(data)
constraints <- c('LongOnly')
spec <- portfolioSpec()
setNFrontierPoints(spec) <- 25
setSolver(spec) <- "solveRquadprog"
frontier <- portfolioFrontier(dataTS, spec, constraints)
tailoredFrontierPlot(object = frontier)
weightsPlot(frontier)