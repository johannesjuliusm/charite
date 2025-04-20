#' Simulated example time series data
#'
#' A simulated dataset containing three time series conditions ("C1", "C2", "C3")
#' with different shapes and associated standard errors, suitable for
#' demonstrating ggplot2 plots with shaded ribbons.
#'
#' @format A data frame with 300 rows and 4 variables:
#' \describe{
#'   \item{time}{Normalized time points from 1 to 100}
#'   \item{condition}{Factor with three levels: "C1", "C2", "C3"}
#'   \item{mean}{Simulated mean signal values}
#'   \item{se}{Simulated standard error}
#' }
#'
#' @usage data(curves)
"curves"