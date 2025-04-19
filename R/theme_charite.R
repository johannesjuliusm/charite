#' Custom ggplot2 theme for Charite - Universitaetsmedizin Berlin by Johannes Julius Mohn
#'
#' This function creates a custom ggplot2 theme with customizable options for font, line thickness, and grid.
#' You can optionally choose to plot text in Calibri font if available on your OS.
#' Calibri is the standard font on Windows and recommended by Charite. On macOS and Linux you may need to
#' manually install the font first.
#'
#' @param base_size Base font size in points, i.e., same as in your text editor.
#' @param thickness Line thickness for axes. Default ggplot2 setting is 0.5.
#' @param grid Logical; if TRUE, grid lines are added.
#' @param use_calibri Use Calibri font? Defaults to FALSE.
#'
#' @return A ggplot2 theme by Johannes Julius Mohn for Charite - Universitaetsmedizin Berlin.
#' @import ggplot2
#' @importFrom ggplot2 %+replace%
#' @importFrom ggplot2 theme_classic theme element_text rel margin
#' @importFrom ggplot2 element_line element_blank
#' @importFrom grid unit
#' @export
theme_charite <- function(base_size = 10, thickness = 0.5, grid = FALSE, use_calibri = FALSE) {
  
  font_family <- if (use_calibri) "Calibri" else "Arial"
  
  base_theme <- theme_classic(base_size = base_size, base_family = font_family) %+replace%
    theme(
      plot.title = element_text(
        color = "#004d9b",
        size = rel(1.4),
        hjust = 0.5,
        margin = margin(t = 0, b = (2 + base_size + base_size / 2))
      ),
      plot.subtitle = element_text(
        color = "#5e676c",
        size = rel(1),
        hjust = 0.5,
        margin = margin(t = -(2 + base_size), b = (2 + base_size + base_size / 2))
      ),
      plot.caption = element_text(
        color = "#5e676c",
        size = rel(1),
        hjust = 1,
        margin = margin(t = base_size / 2, unit = "pt")
      ),
      axis.title.x = element_text(
        color = "#5e676c",
        size = rel(1),
        margin = margin(t = base_size / 2, unit = "pt")
      ),
      axis.title.y = element_text(
        angle = 90,
        color = "#5e676c",
        size = rel(1),
        margin = margin(r = base_size / 2, unit = "pt")
      ),
      axis.text = element_text(
        size = rel(1)
      ),
      axis.text.x = element_text(
        color = "#5e676c",
        margin = margin(t = 2, b = 0, unit = "pt")
      ),
      axis.text.y = element_text(
        color = "#5e676c",
        margin = margin(r = 2, l = 0, unit = "pt")
      ),
      axis.ticks = element_line(
        color = "black",
        linewidth = thickness
      ),
      axis.ticks.length = unit(2, "pt"),
      axis.line = element_line(
        color = "black",
        linewidth = thickness,
        lineend = "square"
      ),
      plot.margin = margin(t = 5, r = 35, b = 5, l = 5)
    )
  
  # add grid lines conditionally
  if (grid) {
    base_theme <- base_theme + theme(
      panel.grid.major = element_line(color = "#cbcfd2"),
      panel.grid.minor = element_line(color = "#e6e8ea")
    )
  } else {
    base_theme <- base_theme + theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
  }
  
  return(base_theme)
}