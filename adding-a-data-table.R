# http://learnr.wordpress.com/2009/04/29/ggplot2-labelling-data-series-and-adding-a-data-table/

library(ggplot2)
library(grid) # Needed for 'label' on 'annotate'
library(reshape) # also needed for 'label' on 'annotate'

df <- structure(list(City = structure(c(2L, 3L, 1L),
                     .Label = c("Minneapolis", "Phoenix", "Raleigh"), 
                      class = "factor"),
                January = c(52.1, 40.5, 12.2), 
                February = c(55.1, 42.2, 16.5),
                March = c(59.7, 49.2, 28.3), 
                April = c(67.7, 59.5, 45.1), 
                May = c(76.3, 67.4, 57.1),
                June = c(84.6, 74.4, 66.9), 
                July = c(91.2, 77.5, 71.9), 
                August = c(89.1, 76.5, 70.2), 
                September = c(83.8, 70.6, 60),
                October = c(72.2, 60.2, 50), 
                November = c(59.8, 50, 32.4), 
                December = c(52.5, 41.2, 18.6)), 
                .Names = c("City", "January", "February", "March", "April", "May", "June",
                            "July", "August", "September", "October", "November", "December"), 
                class = "data.frame",
                row.names = c(NA, -3L))

dfm <- melt(df, variable_name = "month")
levels(dfm$month) <- month.abb

p <- ggplot(dfm, aes(month, value, group = City, colour = City))
(p1 <- p + geom_line(size = 1))

dgr_fmt <- function(x, ...) {
  parse(text = paste(x, "*degree", sep = ""))
}

none <- theme_blank()

p2 <- p1 + 
      theme_bw() + 
      scale_y_continuous(formatter = dgr_fmt, limits = c(0, 100), expand = c(0, 0), ) +
      opts(title = expression("Average Monthly Temperatures (" * degree * "F)")) + 
      opts(panel.grid.major = none, panel.grid.minor = none) + 
      opts(legend.position = "none") +
      opts(panel.background = none) + opts(panel.border = none) +
      opts(axis.line = theme_segment(colour = "grey50")) +
      xlab(NULL) + ylab(NULL)

(p3 <- p2 + 
       geom_vline(xintercept = c(2.9, 5.9, 8.9, 11.9), colour = "grey85", alpha = 0.5) +
       geom_hline(yintercept = 32, colour = "grey80", alpha = 0.5) + 
       annotate("text", x = 1.2, y = 35, label = "Freezing", colour = "grey80", size = 4) + 
       annotate("text", x = c(1.5, 4.5, 7.5, 10.5), y = 97, 
                label = c("Winter", "Spring", "Summer", "Autumn"), colour = "grey70", size = 4))

(p4 <- p3 + geom_text(data = dfm[dfm$month == "Dec", ], aes(label = City), hjust = 0.7, vjust = 1))

> data_table <- ggplot(dfm, aes(x = month, y = factor(City),
                                label = format(value, nsmall = 1), colour = City)) +
                                  geom_text(size = 3.5) + theme_bw() + scale_y_discrete(formatter = abbreviate,
                                                                                        limits = c("Minneapolis", "Raleigh", "Phoenix")) +
                                                                                          opts(panel.grid.major = none, legend.position = "none",
                                                                                               panel.border = none, axis.text.x = none,
                                                                                               axis.ticks = none) + opts(plot.margin = unit(c(-0.5,
                                                                                                                                              1, 0, 0.5), "lines")) + xlab(NULL) + ylab(NULL)

> Layout <- grid.layout(nrow = 2, ncol = 1, heights = unit(c(2,
                                                             0.25), c("null", "null")))
> grid.show.layout(Layout)
> vplayout <- function(...) {
  grid.newpage()
  pushViewport(viewport(layout = Layout))
}
> subplot <- function(x, y) viewport(layout.pos.row = x,
                                     layout.pos.col = y)
> mmplot <- function(a, b) {
  vplayout()
  print(a, vp = subplot(1, 1))
  print(b, vp = subplot(2, 1))
}
> mmplot(p4, data_table)


