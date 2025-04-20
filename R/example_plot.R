utils::globalVariables("curves")

#' Generate an example plot with the ggplot2 Charite theme
#'
#' Creates a stylized ggplot2 plot using the built-in [charite::curves] dataset to demonstrate the
#' ggplot2 Charite theme and color palette.
#'
#' This function is meant to provide a quick visual example of how the custom
#' [charite::theme_charite()] and [charite::charite_colors] can be applied to typical time series
#' data with shaded standard error ribbons.
#'
#' @return A ggplot object.
#' @export
#'
#' @examples
#' # generate and print the example plot
#' example_plot()
example_plot <- function() {
  
  data <- curves
  
  p <- ggplot(data, aes(x = .data$time, y = .data$mean, color = .data$condition, fill = .data$condition)) +
    geom_ribbon(aes(ymin = .data$mean - .data$se, ymax = .data$mean + .data$se), alpha = 0.4, linewidth = 0.2, color = NA) +
    geom_line(linewidth = 1, show.legend = FALSE) +
    scale_x_continuous(
      expand = c(0,0),
      limits = c(0, max(data$time))
    ) +
    scale_y_continuous(
      expand = c(0,0),
      limits = c(0, ceiling(max(data$mean)))
    ) +
    scale_color_manual(values = c(
      "C1" = charite_colors$KORALL,
      "C2" = charite_colors$PRIME_BLUE,
      "C3" = charite_colors$BLACK
    )) +
    scale_fill_manual(values = c(
      "C1" = charite_colors$KORALL,
      "C2" = charite_colors$PRIME_BLUE,
      "C3" = charite_colors$PRIME_DGREY
    )) +
    labs(
      title = "Charit\u00e9",
      subtitle = "ggplot2 Theme",
      x = "Time",
      y = "Signal",
      color = "Condition",
      fill = "Condition"
    ) +
    theme_charite(base_size = 12) +
    theme(
      aspect.ratio = 1,
      legend.position = "right",
      plot.margin = margin(t = 5, r = 5, b = 5, l = 5)
    )
  return(p)
}