# https://www.datacamp.com/community/blog/a-free-interactive-plotly-r-tutorial

library(colorspace)
library(scales)
library(ggplot2)
library(plotly) # Load the 'plotly' library

str(volcano) # volcano data

plot_ly(z = ~volcano, type = "heatmap") # heatmap

plot_ly(z = ~volcano, type = "surface") # 3d surface map
