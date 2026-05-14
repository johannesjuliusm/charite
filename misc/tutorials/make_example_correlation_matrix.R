# Package management -----------------------------------------------------------
library(MASS)     # for mvrnorm function to generate multivariate normal data
library(corrplot) # for visualizing the correlation matrix
library(Matrix)   # nearPD() to guarantee matrix is positive definite
library(ggplot2)
library(charite)

# Functions --------------------------------------------------------------------

# function to create a correlation matrix with latent factor structure
simulate_factor_cor_matrix <- function(n_features, n_factors = 3) {
  loadings <- matrix(runif(n_features * n_factors, -1, 1), nrow = n_features)
  cov_matrix <- loadings %*% t(loadings)
  
  # normalize to correlation matrix
  cor_matrix <- cov2cor(cov_matrix)
  return(cor_matrix)
}


# colour palette for correlation matrix
pal1 <- make_charite_palette(c(
  "#a1141e",
  charite_colors$KORALL,
  "#f7f7f7",
  charite_colors$SECOND_LBLUE,
  charite_colors$SECOND_DBLUE)
)(256)

pal2 <- make_charite_palette(c(
  charite_colors$ROT,
  charite_colors$RAPSGELB,
  "#f7f7f7",
  charite_colors$SECOND_LBLUE,
  charite_colors$SECOND_DBLUE)
)(256)

pal3 <- make_charite_palette(c(
  charite_colors$BROMBEERE,
  charite_colors$HIMBEER,
  "#f7f7f7",
  charite_colors$LIMETTE,
  charite_colors$GRASGRUEN)
)(256)

pal4 <- make_charite_palette(c(
  charite_colors$LILA,
  "#f7f7f7",
  charite_colors$MINT)
)(256)

# correlation matrix visualization
correlation_matrix <- function(coeffs, pvals, ...) {
  
  defaults <- list(
    corr        = coeffs,
    type        = "full",
    order       = "hclust",
    method      = "color",
    bg          = "white",
    tl.col      = "black",
    cl.pos      = "n",
    col         = pal,
    p.mat       = pvals,
    sig.level   = 0.05,
    insig       = "pch",
    addCoef.col = "black",
    tl.cex      = 0.5,
    number.cex  = 0.5
  )
  
  # overwrite defaults with any user-supplied arguments
  user_args <- list(...)
  defaults[names(user_args)] <- user_args
  
  # call corrplot with combined arguments
  do.call(corrplot::corrplot, defaults)
}


# Correlation matrix -----------------------------------------------------------

set.seed(1402)

# number of features
n_features <- 100

# simulate the matrix
cormat <- simulate_factor_cor_matrix(n_features)

# visualize the correlation matrix using corrplot
corrplot(
  cormat,
  method = "color",
  type = "full",
  order = "hclust",
  col = pal2,
  bg = "white",
  tl.pos = "n",
  cl.pos = "n",
  tl.cex = 0.5,
  number.cex = 0.5
)


# Export ------------------------------------------------------------------

tiff(paste0("example_corrmat", ".tiff"),
     width = 5, height = 5, units = "in", res = 300)

corrplot(
  cormat,
  method = "color",
  type = "full",
  order = "hclust",
  col = pal2,
  bg = "white",
  tl.pos = "n",
  cl.pos = "n",
  tl.cex = 0.5,
  number.cex = 0.5
)

dev.off()
