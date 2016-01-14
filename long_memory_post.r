
# CODE FOR NILE DATA TIME SERIES

library(ggplot2)            # for plotting functions
library(car)                # for the recode function, rc
library(reshape2)           # for melt function to build long form data frame
library(pracma)             # for hurst and hurstexp to compute the Hurst Exponent

# FETCH THE DATA
url <- "https://raw.githubusercontent.com/LCAV/SignalsOfTheDay/master/Day%203/FloodsOfTheNile_data.txt"
nile <- read.table(url,header=FALSE,sep=",")
head(nile)

write.csv(nile,"Nile_data.csv")                       # Save to disk
#nile <- read.csv("Nile_data.csv")

names(nile) <- c("Year",month.abb,"Avg.Flow")
head(nile)

nile_dat <- nile[,-14]                               # Remove avg flow
rc <- function(x){recode(x,"-9999=NA")}

nile_dat <- sapply(nile_dat,rc)
nile_dat <- as.data.frame(nile_dat)
head(nile_dat)

# RESHAPE THE DATA INTO LONG FORM
nile_dat_l <- melt(nile_dat,idvar="Year",measure.vars=month.abb,variable.name="Month",value.name="Obs")
nile_dat_long <- nile_dat_l[with(nile_dat_l,order(Year,Month)),]         # sort
head(nile_dat_long,100)
dim(nile_dat_long)

# Make a date variable
nile_dat_long$Date <- paste(with(nile_dat_long,Date<- paste(Month,"-","15","-",as.character(Year),sep="")))
nile_dat_long$Date <- as.Date(nile_dat_long$Date,format="%b-%d-%Y")

# Plot the time series
p <- ggplot(nile_dat_long[100:300,],aes(x=Date,y=Obs))
p + geom_line() + geom_point(shape=1,col="red") + 
  ylab("Flow in cubic meters / second") + 
  ggtitle("Monthly Flow of Nile River at Dongola Station")

# Boxplots of monthly flows
b <- ggplot(nile_dat_long,aes(factor(Month),Obs))
b + geom_boxplot() +
  xlab("Month") +
  ylab("Flow in cubic meters / second") + 
  ggtitle("Variation of Flow at Dongola Station by Month")

# Extract a time series 
nileDf <- nile_dat_long[-(1:24),]                 # Remove first two years with the NAs
nile.ts <- ts(nileDf$Obs,frequency=12,start=c(1871,1))

# COMPUTE THE ACF and PLOT WITH ggplot2 (just because)
# Got the code from:
#http://stackoverflow.com/questions/17788859/acf-plot-with-ggplot2-setting-width-of-geom-bar
bacf <- acf(nile.ts, plot = FALSE)
bacfdf <- with(bacf, data.frame(lag, acf))

cline <- qnorm((1 - 0.95)/2)/sqrt(length(nile.ts))
ac <- ggplot(data = bacfdf, mapping = aes(x = lag, y = acf)) +
  geom_hline(aes(yintercept = 0)) +
  xlab("Lag") +
  ylab("ACF") +
  ggtitle("Autocorrelation of Monthly Nile Time series") +
  geom_segment(mapping = aes(xend = lag, yend = 0)) +
  geom_abline(aes(intercept=cline,slope=0,data=bacfdf),col="red",linetype="dotted") +
  geom_abline(aes(intercept=-cline,slope=0,data=bacfdf),col="red",linetype="dotted")
ac

#-----------------------------------------------------------------------
# CREATE A TIME SERIES OF TOTAL YEARLY FLOW
nile_dat2 <- nile_dat[-c(1,2),]
nile_dat2$Total.Flow <- rowSums(nile_dat2[,-1])
head(nile_dat2)

nile_dat2$Date <- paste(with(nile_dat2,Date<- paste("Dec","-","31","-",as.character(Year),sep="")))
nile_dat2$Date <- as.Date(nile_dat2$Date,format="%b-%d-%Y")

nile.yr.ts <- ts(nile_dat2$Total.Flow,frequency=1,start=c(1871))
head(nile.yr.ts)

# PLOT THE YEARLY TIME SERIES
pyr <- ggplot(nile_dat2,aes(x=Date,y=Total.Flow))
pyr + geom_line() + geom_point(shape=1,col="red") + 
  ylab("Flow in cubic meters / second") + 
  ggtitle("Total Yearly Flow of Nile River at the Dongola Station")

# PLOT THE ACF
bacf <- acf(nile.yr.ts, plot = FALSE)
bacfdf <- with(bacf, data.frame(lag, acf))

cline <- qnorm((1 - 0.95)/2)/sqrt(length(nile.yr.ts))
ac <- ggplot(data = bacfdf, mapping = aes(x = lag, y = acf)) +
  geom_hline(aes(yintercept = 0)) +
  xlab("Lag") +
  ylab("ACF") +
  ggtitle("Autocorrelation of Yearly Nile Time series") +
  geom_segment(mapping = aes(xend = lag, yend = 0)) +
  geom_abline(aes(intercept=cline,slope=0,data=bacfdf),col="red",linetype="dotted") +
  geom_abline(aes(intercept=-cline,slope=0,data=bacfdf),col="red",linetype="dotted")
ac
#-------------------------------------------------
# COMPUTE THE HURST EXPONENT
# Simple calculation 

simpleHurst <- function(y){
      sd.y <- sd(y)
      m <- mean(y)
      y <- y - m
      max.y <- max(cumsum(y))
      min.y <- min(cumsum(y))
      RS <- (max.y - min.y)/sd.y
      H <- log(RS) / log(length(y))
      return(H)
}
simpleHurst(x)

# Alternate calculation
hurst(nile.yr.ts)
hurstexp(nile.yr.ts)

