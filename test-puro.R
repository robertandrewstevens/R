> test.puro
function()
{
  Pur.full <- nls(formula = vel ~ ((Vm + delV * (state == "treated")) * conc)/(K + conc), data = Puromycin,
                  start = list(Vm = 160, delV = 40, K = 0.05))
  print(Pur.full)
  parameters(Pur.full)	#Pur.pro <- profile(Pur.full)
}