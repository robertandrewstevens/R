library(ggplot2)

############
# homicides data

# load data
hc <- read.csv("http://www.public.iastate.edu/~hofmann/looking-at-data/data/homicides.csv")

dim(hc)
names(hc)

summary(hc)
str(hc)

########
# something interesting to start with

qplot(OFFENDER.AGE, VICTIM.AGE, geom="jitter", facets=~OFFENDER.RELATIONSHIP, colour=OFFENDER.RELATIONSHIP, data=hc) + opts(legend.position="none")

########
summary(hc$MONTH.OF.OFFENSE)

hc$MONTH.OF.OFFENSE <- factor(hc$MONTH.OF.OFFENSE)
summary(hc$MONTH.OF.OFFENSE)

########

# how are homicides distributed across states?

qplot(STATE.NAME, xlab="STATE.NAME", geom="bar", data=hc)
# rotate by 90 degrees to make labels readable
qplot(STATE.NAME, xlab="STATE.NAME", geom="bar", data=hc) + coord_flip()

# sort STATE.NAME by number of offenses
qplot(reorder(STATE.NAME, STATE.NAME, length), xlab="STATE.NAME", geom="bar", data=hc) + coord_flip()

# OFFENDER.AGE is only known for solved cases.
# which states have the highest number of solved homicides?

hc$SOLVED <- !is.na(hc$OFFENDER.AGE)
qplot(reorder(STATE.NAME, STATE.NAME, length), xlab="STATE.NAME", geom="bar", fill=SOLVED, data=hc) + coord_flip()

qplot(reorder(STATE.NAME, STATE.NAME, length), xlab="STATE.NAME", geom="bar", fill=!SOLVED, position="fill", data=hc) + coord_flip()


########

# use of weapon
qplot(OFFENDER.WEAPON, geom="bar", data=hc)
hc$OFFENDER.WEAPON <- factor(hc$OFFENDER.WEAPON)
qplot(OFFENDER.WEAPON, geom="bar", data=hc)
# look into the code book for an explanation of the numbers

# does sex make a difference in choice of weapon?
qplot(OFFENDER.WEAPON, geom="bar", fill=OFFENDER.SEX, data=hc)


# get rid of unsolved homicides:
qplot(OFFENDER.WEAPON, geom="bar", fill=OFFENDER.SEX, data=subset(hc, OFFENDER.SEX != 'U'))

# look at percentages rather than absolute numbers:
qplot(OFFENDER.WEAPON, geom="bar", position="fill", fill=OFFENDER.SEX, data=subset(hc, OFFENDER.SEX != 'U'))

################
# 2d relationships
table(hc$VICTIM.RACE, hc$OFFENDER.RACE)
ggfluctuation(table(hc$VICTIM.RACE, hc$OFFENDER.RACE))

ggfluctuation(xtabs(~factor(VICTIM.RACE)+factor(OFFENDER.RACE), 
	subset(hc, (VICTIM.RACE %in% c("B","W")) & 
	           (OFFENDER.RACE %in% c("B","W")))))

# 
table(hc$VICTIM.SEX, hc$OFFENDER.SEX)
# concentrate on solved crimes only

solved <- subset(hc, (OFFENDER.SEX != 'U') & (VICTIM.SEX != 'U'))
table(solved$VICTIM.SEX, solved$OFFENDER.SEX)

# get rid of the 'U' level:

solved$VICTIM.SEX <- factor(solved$VICTIM.SEX)
solved$OFFENDER.SEX <- factor(solved$OFFENDER.SEX)
table(solved$VICTIM.SEX, solved$OFFENDER.SEX)
table(solved$VICTIM.SEX, solved$OFFENDER.SEX)/nrow(solved)*100

ggfluctuation(table(solved$VICTIM.SEX, solved$OFFENDER.SEX))

(vs <- table(solved$VICTIM.SEX)/nrow(solved))
(os <- table(solved$OFFENDER.SEX)/nrow(solved))

# compute values expected under independence:
exp <- (vs %o% os)*nrow(solved)
obs <- table(solved$VICTIM.SEX, solved$OFFENDER.SEX)
sum((exp-obs)^2/exp)
#

chisq.test(solved$VICTIM.SEX, solved$OFFENDER.SEX)

#####################

# another relationship
hc$VICTIM.BABY <- hc$VICTIM.AGE <= 1

qplot(VICTIM.SEX, binwidth=5, geom="bar", fill=VICTIM.BABY, facets=~OFFENDER.SEX, position="dodge", data=subset(hc, (OFFENDER.RELATIONSHIP %in% c("DA", "SO", "SD","SS")) & (VICTIM.SEX != 'U') & (!is.na(VICTIM.BABY))))



