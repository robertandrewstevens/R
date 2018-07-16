> pcb
function()
{
  pcb.data <- scan("c:/andy/splus/nonlin/pcb.dat", list(age = 0, pcb = 0))
  plot(pcb.data$age, pcb.data$pcb, main = "Figure 1.1  Plot of PCB concentration versus age for lake trout.",
       xlab = "Age (years)", ylab = "PCB concentration (ppm)")
  o.par <- par(mfrow = c(1, 2), oma = c(0, 0, 5, 0))
  on.exit(o.par)
  par(mfrow = c(1, 2))
  plot(pcb.data$age, pcb.data$pcb, sub = "(a)", xlab = "Age (years)", log = "y", ylab = "PCB concentration (ppm)")
  plot((pcb.data$age)^(1/3), pcb.data$pcb, sub = "(b)", xlab = "Cube root of age", log = "y",
       ylab = "PCB concentration (ppm)")
  mtext("Figure 1.2  Plot of PCB concentration versus age for lake trout.", side = 3, outer = T, cex = 1)
}
