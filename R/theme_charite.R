#' A custom ggplot2 theme for Charite – Universitaetsmedizin Berlin by Johannes Julius Mohn
#'
#' This function creates a custom ggplot2 theme with customizable options for font, line thickness, grid,
#' plot panel aspect ratio, and margins.
#' 
#' @details
#' To use a specific font, it must be installed on your operating system.
#' Common fonts for figures include: "Arial" or "Helvetica" in publications and slides;
#' "Calibri" is suggested for the Charite corporate identity. "Times New Roman" for
#' contexts where legibility is aided by using a serif font.
#'
#' @param base_size Base font size in points like in your favourite text editor.
#' @param thickness Line thickness for axes. Default ggplot2 setting is 0.5.
#' @param font Character string for font family. Defaults to "sans" (ggplot2 default).
#' Common alternatives: "Arial" or "Helvetica" in publications; "Calibri" suggested for Charite
#' corporate identity; "Times New Roman", a timeless serif font.
#' Note that the fonts must be installed on your OS to be used.
#' @param grid Logical; if TRUE, grid lines are added.
#' @param aspect_ratio Aspect ratio of the plot panel (y:x axis). Default is 3:4.
#' @param tiny_margins Logical; if TRUE, margins for all objects around the plot panel are minimized.
#' Font rendering may depend on your system and the output format (PDF, PNG, SVG).
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
#' p <- ggplot(ChickWeight, aes(x = Time, y = weight, color = weight)) +
#'        geom_point(size = 3) +
#'        scale_color_charite("buch", discrete = FALSE) +
#'        theme_charite()
theme_charite <- function(base_size = 8, thickness = 0.5, font = "sans",
                          grid = FALSE, aspect_ratio = 3/4, tiny_margins = FALSE,
                          debug_area = FALSE) {
  
  # fonts check
  if(!font %in% systemfonts::system_fonts()$family) {
    font = "sans"
    warning("The specified font is not installed on your OS. Using sans instead.")
  }
  
  # set global margin parameters
  title_size = round(base_size * 1.2)
  legend_size = round(base_size * 0.8)
  margin_size_title = if(tiny_margins) 4 else 8
  margin_size = if(tiny_margins) 2 else 4
  
  base_theme <- theme_classic(base_size = base_size, base_family = font) %+replace%
    theme(
      # titles
      plot.title = element_text(
        color = charite_colors$PRIME_BLUE,
        size = title_size,
        hjust = 0.5,
        margin = margin(t = 0, b = margin_size_title)
      ),
      plot.subtitle = element_text(
        color = charite_colors$TEXT_GREY,
        size = rel(1),
        hjust = 0.5,
        margin = margin(t = -margin_size_title/2, b = margin_size_title)
      ),
      plot.caption = element_text(
        color = charite_colors$TEXT_GREY,
        size = rel(1),
        hjust = 1,
        margin = margin(t = margin_size, unit = "pt")
      ),
      
      # axes
      axis.title.x = element_text(
        color = charite_colors$TEXT_GREY,
        size = rel(1),
        margin = margin(t = margin_size, unit = "pt")
      ),
      axis.title.y = element_text(
        angle = 90,
        color = charite_colors$TEXT_GREY,
        size = rel(1),
        margin = margin(r = margin_size+2, unit = "pt")
      ),
      axis.text = element_text(
        size = rel(1)
      ),
      axis.text.x = element_text(
        color = charite_colors$TEXT_GREY,
        margin = margin(t = 2, b = 0, unit = "pt")
      ),
      axis.text.y = element_text(
        color = charite_colors$TEXT_GREY,
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
        color = charite_colors$TEXT_GREY,
        size = legend_size
      ),
      legend.key.height = unit(0.8, "lines"),
      legend.key.width = unit(0.8, "lines"),
      
      # facet
      strip.text = element_text(
        color = "white",
        size = rel(1),
        margin = margin(t = margin_size, b = margin_size)
      ),
      strip.background = element_rect(
        fill = charite_colors$PRIME_BLUE,
        color = charite_colors$PRIME_BLUE
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
      panel.grid.major = element_line(color = charite_colors$PRIME_LGREY),
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