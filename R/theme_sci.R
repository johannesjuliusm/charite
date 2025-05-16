#' A custom ggplot2 theme for scientific publications by Johannes Julius Mohn
#'
#' This function creates a custom ggplot2 theme with customizable options for font, line thickness, grid,
#' plot panel aspect ratio, and margins.
#' 
#' @details
#' To use a specific font, it must be installed on your operating system.
#'
#' @param font_size Base font size in points like in your favourite text editor.
#' @param thickness Line thickness for axes. Default ggplot2 setting is 0.5.
#' @param font Character string for font family. Defaults to "sans".
#' @param grid Logical; if TRUE, grid lines are added.
#' @param aspect_ratio Aspect ratio of the plot panel (y:x axis). Default is 1:1.
#' @param tiny_margins Logical; if TRUE, margins for all objects around the plot panel are minimized.
#' Font rendering may depend on your system and the output format (PDF, PNG, SVG).
#' @param legend_key_size Size of the legend keys. Scales with font_size by default.
#' @param debug_area Visualize the plot margins for plot size debugging. Defaults to FALSE.
#'
#' @return A ggplot2 theme
#' 
#' @import ggplot2
#' @importFrom ggplot2 %+replace%
#' @importFrom ggplot2 theme_classic theme element_text rel margin
#' @importFrom ggplot2 element_line element_blank
#' @importFrom grid unit
#' @importFrom systemfonts system_fonts
#' 
#' @export
#' 
#' @examples
#' library(ggplot2)
#' p <- ggplot(ChickWeight, aes(x = Time, y = weight)) +
#'        geom_point() + theme_sci()
theme_sci <- function(font_size = 8, thickness = 0.5, font = "sans",
                      grid = FALSE, aspect_ratio = 1, tiny_margins = FALSE,
                      legend_key_size = NULL, debug_area = FALSE) {
  
  # fonts check
  if(font != "sans" & !font %in% systemfonts::system_fonts()$family) {
    font = "sans"
    warning("The specified font is not installed on your OS. Using the default font 'sans' instead.")
  }
  
  # set global size and margin parameters
  margin_size_title = if(tiny_margins) 4 else 8
  margin_size = if(tiny_margins) 2 else 4
  legend_size = round(font_size * 0.8)
  legend_key_size = if(is.null(legend_key_size)) legend_size/10 else legend_key_size
  
  base_theme <- theme_classic(base_size = font_size, base_family = font) %+replace%
    theme(
      # titles
      plot.title = element_text(
        color = "black",
        size = rel(1),
        hjust = 0.5,
        margin = margin(t = 0, b = margin_size_title)
      ),
      plot.subtitle = element_text(
        color = "black",
        size = rel(1),
        hjust = 0.5,
        margin = margin(t = -margin_size_title/2, b = margin_size_title)
      ),
      plot.caption = element_text(
        color = "black",
        size = rel(1),
        hjust = 1,
        margin = margin(t = margin_size, unit = "pt")
      ),
      
      # axes
      axis.title.x = element_text(
        color = "black",
        size = rel(1),
        margin = margin(t = margin_size, unit = "pt")
      ),
      axis.title.y = element_text(
        angle = 90,
        color = "black",
        size = rel(1),
        margin = margin(r = margin_size+2, unit = "pt")
      ),
      axis.text = element_text(
        size = rel(1)
      ),
      axis.text.x = element_text(
        color = "black",
        margin = margin(t = 2, b = 0, unit = "pt")
      ),
      axis.text.y = element_text(
        color = "black",
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
      
      # legend
      legend.title = element_blank(),
      legend.text = element_text(
        color = "black",
        size = legend_size
      ),
      legend.key.size = unit(legend_key_size, "lines"),
      legend.background = element_rect(fill = "transparent", color = NA),
      legend.key = element_rect(fill = "transparent", color = NA),
      
      # facet
      strip.text = element_text(
        color = "white",
        size = rel(1),
        margin = margin(t = margin_size, b = margin_size)
      ),
      strip.background = element_rect(
        fill = "black",
        color = "black"
      ),
      panel.spacing = unit(if(tiny_margins) 0.4 else 0.8, "lines"),
      
      # plot settings
      plot.margin = margin(t = margin_size, r = margin_size, b = margin_size, l = margin_size),
      plot.background = element_rect(fill = "transparent", color = NA),
      panel.background = element_rect(fill = "transparent", color = NA),
      aspect.ratio = aspect_ratio
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