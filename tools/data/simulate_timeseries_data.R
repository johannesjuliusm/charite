# simulate time series data for plotting demonstrations
set.seed(42)
n_time <- 100
time <- seq(0, 1, length.out = n_time)

# wiggly normal
c1_core <- dnorm(time, mean = 0.5, sd = 0.15)
c1 <- c1_core +
  0.1 * sin(25 * time) +
  0.05 * cos(40 * time) +
  rnorm(n_time, 0, 0.005)

# 3rd-order polynomial
c2 <- 3.9 * time^3 - 6 * time^2 + 3 * time + rnorm(n_time, 0, 0.01)

# power function (square root shape)
c3 <- time^0.5 + rnorm(n_time, 0, 0.005)

# as data frame
curves <- data.frame(
  time = rep(seq(1, n_time), 3),
  condition = factor(rep(c("C1", "C2", "C3"), each = n_time),
                     levels = c("C1", "C2", "C3")),
  mean = c(
    scale(c1)[, 1] + 2.2,
    scale(c2)[, 1] + 2.8,
    scale(c3)[, 1] + 2.8
  ),
  se = runif(n_time * 3, min = 0.4, max = 0.6)
)

# save the data as .rda for use in the package
usethis::use_data(curves, overwrite = TRUE)