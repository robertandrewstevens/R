plot.Mass.Income <- function() {
  xyplot(Income ~ Mass | ProdGrp, data = engine, panel = function(x, y)
  {
    panel.xyplot(x, y)
    panel.loess(x, y, span = 2)
  }
  , layout = c(1, 3, 1))
}