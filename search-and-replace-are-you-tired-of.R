# http://r-de-jeu.blogspot.com/2013/01/search-and-replace-are-you-tired-of.html
# Search and replace: Are you tired of nested `ifelse`?

# nested_ifelse.R

basket <- c("apple", "banana", "lemon", "orange", "orange", "pear", "cherry")
ifelse(basket == "banana", "apple",
       ifelse(basket == "orange", "pineapple",
              basket))   # or "fig"))

# decode.R

decode <- function(x, search, replace, default = NULL) {
  # build a nested ifelse function by recursion
  decode.fun <- function(search, replace, default = NULL)
    if (length(search) == 0L) {
      function(x) if (is.null(default)) x else rep(default, length(x))
    } else {
      function(x) ifelse(x == search[1L], replace[1L],
                         decode.fun(tail(search,  -1L),
                                    tail(replace, -1L),
                                    default)(x))
    }  
  return(decode.fun(search, replace, default)(x))
}

# decode_examples.R

decode(basket, search  = c("banana", "orange"),
       replace = c("apple", "pineapple"))

decode(basket, search  = c("banana", "orange"),
       replace = c("apple", "pineapple"),
       default = "fig")

# mpiktas:  You can use factors for that 

decode <- function(x,i,o) {
  x <- factor(x) 
  levels(x)[levels(x) %in% i] <- o
  as.character(x) 
}

# dinre:  Ignoring the StackOverflow question and addressing the problem you pose in this post (which is subtly different),
# there is a way to get around your nesting issue while still being easy to code/read.
# I have to do this every so often when recoding data, and I find using a transformation legend is a quick and straightforward 
# approach for 1:1 replacements. I coded up a quick example function for your case:
  
# Function to replace a data array by evaluating each item individually and in series.
# data_Array is expected to be a list or array with all of the data to be replaced.
# original_List is expected to be a list or array with a list of item values in data_Array.
# replacement_List is expected to be a list or array with
# a list of new item values that correspond in placement with original_List.
# For example, to transform "banana" into "pineapple", we would see:
# original_List[n] = "banana" and 
# replacement_List[n] = "pineapple"

# For this to work, you may have to use unlist(data_Array)
# if data_Array is using factors and replacement_List is
# introducing new values. Adding the new array into a
# data frame will then resolve the new factors automatically.

replace_By_Item <- function(data_Array, original_List, replacement_List) {
  for (i in 1:length(data_Array)) {
    data_Array[i] <- replacement_List[match(data_Array[i], original_List)]
  }
  return(data_Array)
}

# Demo of function.
# Makes a random list of "banana", "orange", and "fig"
# values, and replaces all "banana" with "apple" and
# all "orange" with "pineapple".

test_Basket <- sample(c("banana","orange","fig"), 100, rep=TRUE)
new_Test_Basket <- replace_By_Item(test_Basket, c("banana","orange","fig"), c("apple","pineapple","fig"))
table(test_Basket)
table(new_Test_Basket)

# Regarding your default value: I don't ever use default values
# when transforming my data. I find that it is too easy to
# overlook something a lose a bunch of data, but I've coded it
# up anyway as an example.

replace_By_Item <- function(data_Array, original_List, replacement_List, default_Value) {
  for (i in 1:length(data_Array)){
    if (data_Array[i] %in% original_List) {
      data_Array[i] <- replacement_List[match(data_Array[i], original_List)]
    } else {
      data_Array[i] <- default_Value
    }
  }
  return(data_Array)
}

test_Basket <- sample(c("banana","orange","fig"), 100, rep=TRUE)
new_Test_Basket <- replace_By_Item(test_Basket, c("banana","orange","fig"), c("apple","pineapple","fig"))
table(test_Basket)
table(new_Test_Basket)

# flodel:  match() is definitely another great tool for the task. 
# Note that it is a vectorized function so you can avoid iterating with a for() loop and your code will be much faster. 
# An implementation matching the usage of my decode() function would be:
  
decode <- function(x, search, replace, default = NULL) {    
    idx <- match(x, search)
    out <- ifelse(is.na(idx), if (is.null(default)) x else default, replace[idx])
    return(out)
  } 
basket <- c("apple", "banana", "lemon", "orange", "orange", "pear", "cherry")
decode(basket, c("banana", "orange"), c("apple", "pineapple"))

# dinre:  Match is designed to work the other way around (e.g. match(search, x)), 
# but inverting it is far more useful for replacements. 
# If we are doing integer replacements and trying to optimize CPU cycles over memory, 
# it would be even faster to use a null array for the search variable with the numbers to be replaced put in the 
# corresponding replacement index of the array.

decode <- function(x, search) {
  return(match(x, search))
}

decode(c(1,2,3,4), c(NA,1,NA,NA,2,3,NA,4))


# dinre:  If you really want to use a built-in function to replace your nested ifelse statements,
# you might want to consider using a switch. 
# Switches are essentially a series of nested ifelse statements simplified to a single command. 
# In R, switches work two different ways, and for your fruit basket, we would use the "character string" method. 
# In the following, we specify the switch values and what they should return. 
# The final unnamed value is the default switch. These could be expressions, but for our case, we're just using the fruit names.

data_Array <- c("apple", "banana", "lemon", "orange", "orange", "pear", "cherry")
for (i in 1:length(data_Array)) {
  data_Array[i] <- switch(data_Array[i], banana="apple", orange="pineapple", "fig")
}
data_Array 

# For the StackOverflow question, we would have to use the "integer" method for our switch. 
# Note that the "integer" method switch does not have a default. 
# I'm using plyr here purely for convenience, since ddply takes a data frame and returns a data frame automatically.

z <- data.frame(x=1:10, y=11:20, t=21:30)
library(plyr)
ddply(z, .(x), summarize, y=y, t=t, q=switch(x, 1, 2, 1, 4, 1, 1, 3, 1, 1, 1) * t)


# GoldGuy:  To do the same thing with the recode function of the car package

library(car)
recode(basket, "'banana' = 'apple', 'orange' = 'pineapple', else = 'fig'")
# didn't work:  Error

# Winston Chang:  There's a new function in plyr 1.8 called revalue:
revalue(basket, replace = c(banana="apple", orange="pineapple"))
# didn't work:  Error (need to update R?)

# It is implemented using the new mapvalues function, which you can use this way:
mapvalues(basket,
  from = c("banana", "orange"),
  to = c("apple", "pineapple"))
# didn't work:  Error (need to update R?)

# They both work with character vectors and, notably, factors. 
# If you have a numeric vector, you'll have to use mapvalues(), because revalue() uses a named vector for the replacements, 
# and the names are always strings, not numbers.

rm(list = ls())