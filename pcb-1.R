> pcb.1
function()
{
  pcb.data <- scan("c:/andy/splus/nonlin/pcb.dat", list(age = 0, pcb = 0))
  plot(pcb.data$age, pcb.data$pcb, main = "Figure 1.1  Plot of PCB concentration versus age for lake trout.",
       xlab = "Age (years)", ylab = "PCB concentration (ppm)")
}

