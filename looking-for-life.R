# http://aschinchon.wordpress.com/2014/09/04/looking-for-life/

library(ggplot2)
library(scales)
library(gridExtra)
library(reshape)

SumNeighbors <- function(m) {
  # Summarizes number of alive neighbors for each cell
  rbind(m[-1, ], 0) + 
    rbind(0, m[-nrow(m), ]) + 
    cbind(m[ , -1], 0) + 
    cbind(0, m[ , -ncol(m)]) +
    cbind(rbind(m[-1, ], 0)[ , -1], 0) + 
    cbind(0, rbind(0, m[-nrow(m), ])[ ,-nrow(m)]) +
    cbind(0, rbind(m[-1, ], 0)[ , -nrow(m)]) + 
    cbind(rbind(0, m[-nrow(m), ])[ , -1], 0)
}

NextNeighborhood <- function(m) {
  # Calculates next state for each cell according to Conway's rules
  (1 - (SumNeighbors(m) < 2 | SumNeighbors(m) > 3)*1) - (SumNeighbors(m) == 2 & m == 0)*1
}

splits <- 80 # Number of different populations to simulate. Each population s initialized randomly

# According a binomial with probability i/splits with i from 0 to splits
iter <- 150
results <- data.frame()
rm(list = ls(pattern = "conway")) # Remove previous solutions (don't worry!)
for (i in 0:splits) {
  z <- matrix(rbinom(size = 1, n = 8^2, prob = i/splits), nrow = 8)
  z0 <- z
  results <- rbind(results, c(i/splits, 0, sum(z)/(nrow(z)*ncol(z))))
  for(j in 1:iter) {
    z <- NextNeighborhood(z)
    results <- rbind(results, c(i/splits, j, sum(z)/(nrow(z)*ncol(z))))
  }
  # Save interesting solutions
  if(sum(z)/(nrow(z)*ncol(z)) > 0) assign(paste("Conway", format(i/splits, nsmall = 4), sep = ""), z)
}

colnames(results) <- c("start", "iter", "sparsity")

# Plot reults of simulation

opt1 <- theme(panel.background = element_rect(fill = "gray85"),
              panel.grid.minor = element_blank(),
              panel.grid.major.x = element_blank(),
              panel.grid.major.y = element_line(color = "white", size = 0.5, linetype = 2),
              plot.title = element_text(size = 45, color = "black"),
              axis.title = element_text(size = 24, color = "black"),
              axis.text = element_text(size = 20, color = "black"),
              axis.ticks = element_blank(),
              axis.line = element_line(colour = "black", size = 1))

ggplot(results, aes(iter, sparsity, group = start)) +
  geom_path(size = 0.8, alpha = 0.5, colour = "black") +
  scale_x_continuous("Iteration", expand = c(0, 0), limits = c(0, iter), breaks = seq(0, iter, 10)) +
  scale_y_continuous("Alive Cells", labels = percent, expand = c(0, 0), limits = c(0, 1), breaks = seq(0, 1, 0.1)) +
  labs(title = "Conway's Game Of Life Simulation") +
  opt1

# List of all interesting solutions
ls(pattern = "Conway", all.names = TRUE)

# Example to plot the evolution of an interesting solution (in this case "Conway0.5500")

opt <- theme(legend.position = "none",
             panel.background = element_blank(),
             panel.grid = element_blank(),
             axis.ticks = element_blank(),
             axis.title = element_blank(),
             axis.text = element_blank())

plotConway <- function(conwayData) {
  
  p1 <- ggplot(melt(conwayData), aes(x = X1, y = X2)) +
    geom_tile(aes(fill = value), colour = "white", lwd = 2) +
    scale_fill_gradientn(colours = c("gray85", "black")) +
    opt

  p2 <- ggplot(melt(NextNeighborhood(conwayData)), aes(x = X1, y = X2)) +
    geom_tile(aes(fill = value), colour = "white", lwd = 2) +
    scale_fill_gradientn(colours = c("gray85", "black")) +
    opt

  p3 <- ggplot(melt(NextNeighborhood(NextNeighborhood(conwayData))), aes(x = X1, y = X2)) +
    geom_tile(aes(fill = value), colour = "white", lwd = 2) +
    scale_fill_gradientn(colours = c("gray85", "black")) +
    opt

  p4 <- ggplot(melt(NextNeighborhood(NextNeighborhood(NextNeighborhood(conwayData)))), aes(x = X1, y = X2)) +
    geom_tile(aes(fill = value), colour = "white", lwd = 2) +
    scale_fill_gradientn(colours = c("gray85", "black")) +
    opt

  # Arrange four plots in a 2x2 grid
  grid.arrange(p1, p2, p3, p4, ncol = 2)
}

plotConway(Conway0.6000)
