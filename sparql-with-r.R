# http://www.programmingr.com/content/sparql-with-r/
# SPARQL with R in less than 5 minutes
# In this article we’ll get up and running on the Semantic Web in less than 5 minutes using SPARQL with R.
# We’ll begin with a brief introduction to the Semantic Web then cover some simple steps for downloading and
# analyzing government data via a SPARQL query with the SPARQL R package.

# Removed explanations for
#   What is the Semantic Web?
#   The Semantic Web and R
#   Accessing Data.gov datasets with SPARQL
#   Summary
#   Additional Information (2 links on downloading government data)

# R code
# Data.gov provides a Virtuoso endpoint here, which we could use to submit manual queries. 
# But we want to automate this process, so we’ll use Willem Robert van Hage and Tomi Kauppinen’s SPARQL package to access the endpoint.

library(SPARQL) # SPARQL querying package
library(ggplot2)

# Step 1 - Set up preliminaries and define query
# Define the data.gov endpoint
endpoint <- "http://services.data.gov/sparql"

# create query statement
query <-
  "PREFIX  dgp1187: <http://data-gov.tw.rpi.edu/vocab/p/1187/>
  SELECT ?ye ?fi ?ac
  WHERE {
    ?s dgp1187:year ?ye .
    ?s dgp1187:fires ?fi .
    ?s dgp1187:acres ?ac .
  }"

# Step 2 - Use SPARQL package to submit query and save results to a data frame
qd <- SPARQL(endpoint,query)
df <- qd$results

# Step 3 - Prep for graphing

# Numbers are usually returned as characters, so convert to numeric and create a
# variable for "average acres burned per fire"
str(df)
df <- as.data.frame(apply(df, 2, as.numeric))
str(df)

df$avgperfire <- df$ac/df$fi

# Step 4 - Plot some data
ggplot(df, aes(x=ye, y=avgperfire, group=1)) +
  geom_point() +
  stat_smooth() +
  scale_x_continuous(breaks=seq(1960, 2008, 5)) +
  xlab("Year") +
  ylab("Average acres burned per fire")

ggplot(df, aes(x=ye, y=fi, group=1)) +
  geom_point() +
  stat_smooth() +
  scale_x_continuous(breaks=seq(1960, 2008, 5)) +
  xlab("Year") +
  ylab("Number of fires")

ggplot(df, aes(x=ye, y=ac, group=1)) +
  geom_point() +
  stat_smooth() +
  scale_x_continuous(breaks=seq(1960, 2008, 5)) +
  xlab("Year") +
  ylab("Acres burned")

# In less than 5 mins we have written code to download just the data we need and have an interesting result to explore!
