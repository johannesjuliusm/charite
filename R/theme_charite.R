#' A custom ggplot2 theme for Charite – Universitaetsmedizin Berlin by Johannes Julius Mohn
#'
#' This function creates a custom ggplot2 theme with customizable options for font, line thickness, and grid.
#' You can optionally choose to plot text in Calibri font if available on your OS.
#' 
#' @details
#' Calibri is the standard font on Windows and recommended by Charite. On macOS and Linux you may need to
#' manually install the font first.
#'
#' @param base_size Base font size in points like in your favourite text editor.
#' @param thickness Line thickness for axes. Default ggplot2 setting is 0.5.
#' @param grid Logical; if TRUE, grid lines are added.
#' @param use_calibri Use Calibri font? Defaults to FALSE.
#' @param debug_area Visualize the plot margins for plot size debugging. Defaults to FALSE.
#'
#' @return A ggplot2 theme
#' 
#' @import ggplot2
#' @importFrom ggplot2 %+replace%
#' @importFrom ggplot2 theme_classic theme element_text rel margin
#' @importFrom ggplot2 element_line element_blank
#' @importFrom grid unit
#' @importFrom systemfonts match_font
#' 
#' @export
#' 
#' @examples
#' library(ggplot2)
#' p <- ggplot(ChickWeight, aes(x = Time, y = weight, color = weight)) +
#'        geom_point(size = 3) +
#'        scale_color_charite("buch", discrete = FALSE) +
#'        theme_charite()
theme_charite <- function(base_size = 10, thickness = 0.5, grid = FALSE, use_calibri = FALSE, debug_area = FALSE) {
  
  # check if we are in RMD check or normal use case
  is_check <- Sys.getenv("_R_CHECK_PACKAGE_NAME_") != ""
  
  # fallback to "sans" during check, else use installed fonts
  if (is_check) {
    font_family <- "sans"
  } else {
    available_fonts <- systemfonts::system_fonts()$family
    
    if (use_calibri) {
      if ("Calibri" %in% available_fonts) {
        font_family <- "Calibri"
      } else if ("Arial" %in% available_fonts) {
        font_family <- "Arial"
        warning("Calibri font not found. Falling back to Arial.")
      } else {
        font_family <- "sans"
        warning("Neither Calibri nor Arial fonts are available. Falling back to sans.")
      }
    } else {
      if ("Arial" %in% available_fonts) {
        font_family <- "Arial"
      } else {
        font_family <- "sans"
        warning("Arial font not found. Falling back to sans.")
      }
    }
  }
  
  base_theme <- theme_classic(base_size = base_size, base_family = font_family) %+replace%
    theme(
      plot.title = element_text(
        color = "#004d9b",
        size = rel(1.4),
        hjust = 0.5,
        margin = margin(t = 0, b = base_size)
      ),
      plot.subtitle = element_text(
        color = "#5e676c",
        size = rel(1),
        hjust = 0.5,
        margin = margin(t = -base_size/2, b = base_size)
      ),
      plot.caption = element_text(
        color = "#5e676c",
        size = rel(1),
        hjust = 1,
        margin = margin(t = base_size/2, unit = "pt")
      ),
      axis.title.x = element_text(
        color = "#5e676c",
        size = rel(1),
        margin = margin(t = base_size/2, unit = "pt")
      ),
      axis.title.y = element_text(
        angle = 90,
        color = "#5e676c",
        size = rel(1),
        margin = margin(r = 2+base_size/2, unit = "pt")
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
      plot.margin = margin(t = 5, r = 35, b = 5, l = 5),
      legend.title = element_blank(),
      legend.text = element_text(
        color = "#5e676c",
        size = rel(0.8)
      ),
      legend.key.height = unit(0.8, "lines"),
      legend.key.width = unit(0.8, "lines")
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
  
  # debug the plot area
  if (debug_area) {
    base_theme <- base_theme + theme(
      plot.background = element_rect(color = "red")
    )
  }
  
  return(base_theme)
}