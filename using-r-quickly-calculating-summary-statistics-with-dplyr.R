#Using R: quickly calculating summary statistics (with dplyr)

## http://martinsbioblogg.wordpress.com/2014/03/26/using-r-quickly-calculating-summary-statistics-with-dplyr/

## I know I’m on about Hadley Wickham‘s packages a lot. I’m not the president of his fanclub, but if there is one I’d certainly like to be a member. dplyr is going to be a new and improved ddply: a package that applies functions to, and does other things to, data frames. It is also faster and will work with other ways of storing data, such as R’s relational database connectors. I use plyr all the time, and obviously I want to start playing with dplyr, so I’m going to repeat yesterday’s little exercise with dplyr. Readers should be warned: this is really just me playing with dplyr, so the example will not be particularly profound. The post at the Rstudio blog that I just linked contains much more information.

## So, here comes the code to do the thing we did yesterday but with dplyr:

# The code for the toy data is exactly the 
samedata <- data.frame(sex = c(rep(1, 1000), rep(2, 1000)),
                       treatment = rep(c(1, 2), 1000),
                       response1 = rnorm(2000, 0, 1),
                       response2 = rnorm(2000, 0, 1))
head(samedata)
# reshape2 still does its thing:
library(plyr)
library(reshape2)
melted <- melt(samedata, id.vars=c("sex", "treatment"))
head(melted)
# This part is new:
library(dplyr)
grouped <- group_by(melted, sex, treatment, variable)
summarise(grouped, mean=mean(value), sd=sd(value)) 

## When we used plyr yesterday all was done with one function call. Today it is two: dplyr has a separate function for splitting the data frame into groups. It is called group_by and returns the grouped data. Note that no quotation marks or concatenation were used when passing the column names. This is what it looks like if we print it:

print(grouped)

## The grouped data is still a data frame, but it contains a bunch of attributes that contain information about grouping.

## The next function is a call to the summarise function. This is a new version of a summarise function similar to one in plyr. It will summarise the grouped data in columns given by the expressions you feed it. Here, we calculate mean and standard deviation of the values.

print(summarise(grouped, mean=mean(value), sd=sd(value)))

## Maybe the new syntax is slightly clearer. Of course, there are alternative ways of expressing it, one of which is pretty interesting. Here are two equivalent versions of the dplyr calls:

summarise(group_by(melted, sex, treatment, variable),          
          mean=mean(value), sd=sd(value)) 
melted %.% group_by(sex, treatment, variable) %.%       
           summarise(mean=mean(value), sd=sd(value)) 

## The first one is nothing special: we’ve just put the group_by call into summarise. The second version, though, is a strange creature. dplyr uses the operator %.% to denote taking what is on the left and putting it into the function on the right. Reading from the beginning of the expression we take the data (melted), push it through group_by and pass it to summarise. The other arguments to the functions are given as usual. This may seem very alien if you’re used to R syntax, or you might recognize it from shell pipes. This is not the only attempt make R code less nested and full of parentheses. There doesn’t seem to be any consensus yet, but I’m looking forward to a future where we can write points-free R.
