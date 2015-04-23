# http://www.mail-archive.com/r-help@r-project.org/msg72758.html

library(ggplot2)

month  <-  rep(month.abb[1:12], each=30)
days  <- rep(1:30, 12)
temps  <-  rnorm(length(month), mean=25,sd=8)
duration  <- 1:length(month)

timedata <- data.frame(month, days, temps, duration)
head(timedata)

mbs  <- c(1,seq(30, 360,by=30))
namposts <- mbs[1:12]
mlabs <- month.name[1:12]
trange <- range(timedata$temps)
drange <- range(duration)


p  <- ggplot(timedata, aes(duration, temps, colour=month)) + geom_line() +
  opts(legend.position = "none", title="Yearly temperatures",
       axis.text.x = theme_blank(), axis.ticks = theme_blank())  


p  <- p + geom_vline(xintercept= mbs) + 
  ylab("Temperature (C)") + xlab("Daily Temperatures") +
  geom_text(aes(x = namposts+2.5, y = trange[2], label = mlabs),
            data = timedata, size = 2.5, colour='black', hjust = 0, vjust = 0)
p
