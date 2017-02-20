plot.Mass.Cost <- function() {
  xyplot(Cost^0.25 ~ Mass^0.25, data = engine, panel = function(x, y)
  {
    panel.xyplot(x, y)
    panel.loess(x, y, span = 2)
  }
  )
}