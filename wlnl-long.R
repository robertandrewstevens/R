> wlnl.long
function(time, cens, shape, scale)
{
  cens * (log(shape) - shape * log(scale) + (shape - 1) * log(time)) - (time/scale)^shape
}

