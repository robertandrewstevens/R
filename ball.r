library(ggplot2)

# read data in form of Excel spreadsheet
library(xlsx)

# download file http://www.public.iastate.edu/~hofmann/looking-at-data/data/nba-data-clean.xlsx
salaries <- read.xlsx("nba-data-clean.xlsx", sheetIndex=1)
player <- read.xlsx("nba-data-clean.xlsx", sheetIndex=2)
career <- read.xlsx("nba-data-clean.xlsx", sheetIndex=3)

# alternative, Excel import is a bit slow
load("nba.rdata")

names(salaries) <- tolower(names(salaries))
qplot(data=salaries, season, salary, colour=position, geom="jitter") + geom_smooth(method="lm")

qplot(season, salary, data=salaries, geom="line", group=player, colour=position) + geom_text(aes(label=player), hjust=-0.1,  data=subset(salaries, salary > 2.75*10^7))

##################
# how does a player's age affect salary?

# join salaries and player data
# re-name 

names(player)
names(player)[1] <- "player"

salaries_player <- join(salaries, player, by="player")
dim(salaries_player)
dim(salaries) # we have duplicate names (e.g. Bobby Jones, )

# first remove all players who retired before 2001:
salaries_player <- join(salaries, subset(player, lastseason > 2000), by="player")
dim(salaries_player) # looks better, but we still have duplicates 
dim(salaries) 

########

head(player$birthdate)
idx <- which(is.na(player$birthdate))
player$birthdate[idx] <- 0

library(lubridate)
date <- as.Date("01/01/1904", format="%m/%d/%Y")
date + days(head(player$birthdate))

player$birthdate <- date + days(player$birthdate)
player$birthdate[idx] <- NA
# join again, then work with date
salaries_player <- join(salaries, subset(player, lastseason > 2000), by="player")
dim(salaries_player)

qplot(season-year(birthdate), salary, data=salaries_player,  geom="line", group=player) + xlab("Age")

qplot(season-year(birthdate), salary, data=subset(salaries_player, player =="Kobe Bryant"),  geom="line", group=player) + xlim(c(17,42)) + xlab("Age") + opts(title= "Kobe Bryant")
qplot(season-year(birthdate), salary, data=subset(salaries_player, player =="Andre Iguodala"),  geom="line", group=player) + xlim(c(17,42)) + xlab("Age") + opts(title= "Andre Iguodala")
qplot(season-year(birthdate), salary, data=subset(salaries_player, player =="Adonal Foyle"),  geom="line", group=player) + xlim(c(17,42)) + xlab("Age")  + opts(title= "Adonal Foyle") 
qplot(season-year(birthdate), salary, data=subset(salaries_player, player =="Dirk Nowitzki"),  geom="line", group=player) + xlim(c(17,42)) + xlab("Age") + opts(title= "Dirk Nowitzki") 


# the above code is very repetitive - not a good idea: error-prone and hard to maintain!
#####################
# function writing
mean <- function(x) {
	return(sum(x)/length(x))
}

mean(1:15)
mean(c(1:15, NA))

mean <- function(x, na.rm=F) {
	if (na.rm) x <- na.omit(x)
	
	return(sum(x)/length(x))
}

mean(1:15)
mean(c(1:15, NA), na.rm=T)


#####################
# Your turn

profile <- function(name) {
	player_sub <- subset(salaries_player, player %in% name)
	if (nrow(player_sub) == 0) {
		message("Error: no data for this player")
		return()
	}
	p <- qplot(season-year(birthdate), salary, data=player_sub,  geom="line", group=player, colour=factor(player)) + xlim(c(17,42)) + xlab("Age")

	print(p)
}

profile("Dirk Nowotzki")
profile("Dirk Nowitzki")
profile(c("Dirk Nowitzki", "Kobe Bryant", "Kevin Garnett"))

# merge career and salaries
names(career)[1] <- "player"
names(career)[3] <- "season"
salaries_all <- join(salaries_player, subset(career, season > 2000), by=c("ilkid", "season"), match="first")
dim(salaries_all) # duplicates are still problematic

profile <- function(name, data=salaries_player, measure="salary") {
	player_sub <- subset(data, player %in% name)
	if (nrow(player_sub) == 0) {
		message("Error: no data for this player")
		return()
	}
	player_sub$y <- player_sub[,measure]
	p <- qplot(season-year(birthdate), y, data=player_sub,  geom="line", group=player, colour=factor(player)) + xlim(c(17,42)) + xlab("Age") + ylab(measure)

	print(p)
}
profile(c("Dirk Nowitzki"), data=salaries_all, measure="pts")
profile(c("Dirk Nowitzki", "Kobe Bryant", "Kevin Garnett"), data=salaries_all, measure="gp")
profile(c("Dirk Nowitzki", "Kobe Bryant", "Kevin Garnett"), data=salaries_all, measure="pts")
profile(c("Dirk Nowitzki", "Kobe Bryant", "Kevin Garnett"), data=salaries_all, measure="tpa")

##########################

# function to describe the shape of salary profile
# idea: fit polynomial of degree 2 (if there's at least 4 data points)


profile <- function(player_sub) {
	player_sub$age <- with(player_sub, season-year(birthdate))
	# get rid of missing values in age and salary
	player_sub <- na.omit(player_sub[,c("age", "salary")])
	
	if (nrow(player_sub) > 4) {
		fit <- lm(salary ~ poly(age, 2), data=player_sub)
		return(coef(fit))
	}
}

profile(subset(salaries_all, player == "Dirk Nowitzki"))


salary.stat <- ddply(salaries_player, .(player), profile)

summary(salary.stat)
names(salary.stat)[3:4] <- c("age","age2")
qplot(age, age2, data=salary.stat)


qplot(age, age2, data=salary.stat)+ geom_text(aes(label=player), subset(salary.stat, age < -10^7), hjust=-0.1)
players <- subset(salary.stat, age < -10^7)$player

qplot(age, age2, data=salary.stat)+ geom_text(aes(label=player), subset(salary.stat, age > 1.5*10^7), hjust=1.1)
players <- subset(salary.stat, age > 1.5*10^7)$player

qplot(age, age2, data=salary.stat)+ geom_text(aes(label=player), subset(salary.stat, (age2 < -7.5*10^6) & (age > -5*10^6)), hjust=1.1)
players <- subset(salary.stat, (age2 < -7.5*10^6) & (age > -5*10^6))$player

qplot(season-year(birthdate), salary, data=  subset(salaries_player, player %in% players), colour=factor(player), geom=c("line", "point")) +xlim(c(17,42))