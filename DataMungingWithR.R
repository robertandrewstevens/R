## Data Munging With R (from "JimHoltman.pdf")
## Jim Holtman
## Kroger
## Data Munger Guru

## Topics Covered
## * What is “data munging”
## * Summarizing data with various tools
##   – EDA: exploratory data analysis
##   – Visualization of the data
## * Measuring performance
## * Reading in data & Time/Date classes
## * Debugging

##  Data Munging
##
## ￼Your desktop dictionary may not include it, but 'munging' is a
## common term in the programmer's world. Many computing tasks 
## require taking data from one computer system, manipulating it in 
## some way, and passing it to another. Munging can mean 
## manipulating raw data to achieve a final form. It can mean parsing 
## or filtering data, or the many steps required for data recognition.
##
## “R” is an open source software package directed at analyzing and 
## visualizing data, but with the power of the language, and available 
## packages, it also provides a powerful means of slicing/dicing the 
## data to get it into a form for analysis.

## Summarizing Data
## * Various ways of collecting information about relationships of data elements
## * I am going to use weekly shipments of products to stores
##   – Create the data since I cannot use actual (proprietary) information, but the
##     techniques are the same.
##   – 52 weeks of deliveries to 12 stores of 4000 products (~2.5M rows of data)
## * Tools used
##   – **tapply**:  part of the 'base' R
##   – **data.table**:  package that is fast for many of these summarization operations;
##     it has been one that I am using more and more.
##   – **sqldf**:  package that allows SQL access to dataframes; 
##     shortens the learning curve on some R activities if you already know SQL.
##   – **plyr**: package for slicing/dicing that is used by many users.

?tapply

## tapply(x$Count, x$Key, sum)

x <- data.frame(Key = c(1, 1, 2, 2, 3, 3, 3),
                Count = c(10, 23, 2, 89, 1, 2, 5))
tapply(x$Count, x$Key, sum)

?data.table

?sqldf

## plyr Package
## 
## plyr: Tools for splitting, applying and combining data
## plyr is a set of tools that solves a common set of problems: you
## need to break a big problem down into manageable pieces, 
## operate on each pieces and then put all the pieces back together. 
## For example, you might want to fit a model to each spatial 
## location or time point in your study, summarise data by panels or
## collapse high-dimensional arrays to simpler summary statistics.
￼
## Setup for Script

# here is an example of using 4 different ways of aggregatinng data:  tapply,
# data.table, plyr, and sqldf

# create sample data representing real data that I work with in analyzing how
# physical warehouse should be laid out.

# here I am looking at the weekly shipments froma wahrehouse which has about 4000
# unique products going to 12 different stores for the perior of a year (52 weeks)

x <- expand.grid(upc = 1:4000, # create the dataframe wiht all combinations
                 store = 1:12, # of these 3 values
                 week = 1:52,
                 KEEP.OUT.ATTRS = FALSE)
# add shipment
set.seed(1) # generate the same sequence each time
x$ship <- ceiling(rexp(4000 * 12 * 52, 1/5)) # average of 5 items
str(x)
my.func(x$ship)






