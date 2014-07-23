# Using R: quickly calculating summary statistics from a data frame
## http://martinsbioblogg.wordpress.com/2014/03/25/using-r-quickly-calculating-summary-statistics-from-a-data-frame/

## A colleague asked: I have a lot of data in a table and I’d like to pull out some summary statistics for different subgroups. Can R do this for me quickly?

## Yes, there are several pretty convenient ways. I wrote about this in the recent post on the barplot, but as this is an important part of quickly getting something useful out of R, just like importing data, I’ll break it out into a post of its own. I will present a solution that uses the plyr and reshape2 packages. You can do the same with base R, and there’s nothing wrong with base R, but I find that plyr and reshape2 makes things convenient and easy to remember. The apply family of functions in base R does the same job as plyr, but with a slightly different interface. I strongly recommend beginners to begin with plyr or the apply functions, and not what I did initially, which was nested for loops and hard bracket indexing.

## We’ll go through and see what the different parts do. First, simulate some data. Again, when you do this, you usually have a table already, and you can ignore the simulation code. Usually a well formed data frame will look something this: a table where each observation is a unit such as an individual, and each column gives the data about the individual. Here, we imagine two binary predictors (sex and treatment) and two continuous response variables.

data <- data.frame(sex = c(rep(1, 1000), rep(2, 1000)),
                   treatment = rep(c(1, 2), 1000),
                   response1 = rnorm(2000, 0, 1),
                   response2 = rnorm(2000, 0, 1))
head(data) 

## Now, calculating a function of the response in some group is straightforward. Most R functions are vectorised by default and will accept a vector (that is, a column of a data frame). The subset function lets us pull out rows from the data frame based on a logical expression using the column names. Say that we want mean, standard deviation and a simple standard error of the mean. I will assume that we have no missing values. If you have, you can add na.rm=T to the function calls. And again, if you’ve got a more sophisticated model, these might not be the standard errors you want. Then pull them from the fitted model instead.

mean(subset(data, sex == 1 & treatment == 1)$response1) 
sd(subset(data, sex == 1 & treatment == 1)$response1) 
sd(subset(data, sex == 1 & treatment == 1)$response1) /  
   sqrt(nrow(subset(data, sex == 1 & treatment == 1))) 

## Okay, but doing this for each combination of the predictors and responses is no fun and requires a lot of copying and pasting. Also, the above function calls are pretty messy with lots of repetition. There is a better way, and that’s where plyr and reshape2 come in. We load the packages. The first time you’ll have to run install.packages, as usual.

library(plyr)
library(reshape2) 

## First out, the melt function from rehape2. Look at the table above. It’s reasonable in many situations, but right now, it would be better if we put both the response variables in the same column. If it doesn’t seem so useful, trust me and see below. Melt will take all the columns except the ones we single out as id variables and put them in the same column. It makes sense to label each row with the sex and treatment of the individual. If we had an actual unit id column, it would go here as well:

melted <- melt(data, id.vars=c("sex", "treatment")) 

## The resulting ”melted” table looks like this. Instead of the response variables separately we get a column of values and a column indicating which variable the value comes from.

head(melted)

## Now it’s time to calculate the summary statistics again. We will use the same functions as above to do the actual calculations, but we’ll use plyr to automatically apply them to all the subsets we’re interested in. This is sometimes called the split-apply-combine approach: plyr will split the data frame into subsets, apply the function of our choice, and then collect the results for us. The first thing to notice is the function name. All the main plyr functions are called something with -ply. The letters stand for the input and return data type: ddply works on a data frame and returns a data frame. It’s probably the most important member of the family.

## The arguments to ddply are the data frame to work on (melted), a vector of the column names to split on, and a function. The arguments after the function name are passed on to the function. Here we want to split in subsets for each sex, treatment and response variable. The function we apply is summarise, which makes a new data frame with named columns based on formulas, allowing us to use the column names of the input data frame in formulas. In effect it does exactly what the name says, summarises a data frame. And in this instance, we want to calculate the mean, standard deviation and standard error of the mean, so we use the above function calls, using value as the input. Run the ddply call, and we’re done!

ddply(melted, c("sex", "treatment", "variable"), summarise,
      mean = mean(value), sd = sd(value),      
      sem = sd(value)/sqrt(length(value))) 
