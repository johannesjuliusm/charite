#' High-resolution (300dpi) figure export for publications and slides
#'
#' A wrapper around [ggplot2::ggsave()] that saves plots with layout profiles
#' optimized for slides and publications.
#' 
#' @details
#' Supported layouts:
#' - `"full col"` (3.5 in): Standard full-column publication figure
#' - `"half col"` (1.8 in): Half-width column figure
#' - `"tiny"`     (1 in): For compact sub-figures or thumbnails
#' - `"full page"` (7 in): Full-page width figure
#' - `"slides"`   (4.5 in height): For presentation slides
#' 
#' For optimal rendering, adjust `font_size` in `theme_charite()` and control sizes and margins in your plot.
#' Recommended sizes: 6 or 8 pt for most plots, 6 pt or smaller for "tiny" plots; 10 or 12 pt for "slides".
#' 
#' Plots rendered with `theme_charite()` have transparent backgrounds. You may override with `bg = "white"`.
#' Saving to `.svg` requires the `svglite` package.
#'
#' @param filename Name of the file to save. Should end in `.png`, `.tiff`, `.svg`, etc.
#' @param plot A ggplot object. If omitted, uses the last plot.
#' @param layout One of: "full col", "half col", "tiny", "full page", "slides".
#' @param custom A vector of width and height in inches. If specified, will override `layout`
#' @param ... Additional arguments passed to [ggplot2::ggsave()].
#'
#' @return Saves the plot and returns the filename (invisibly).
#' 
#' @importFrom ggplot2 ggsave last_plot ggplotGrob
#' @importFrom grid convertWidth convertHeight
#' @export
#'
#' @examples
#' \dontrun{
#' nice_save("example.png", example_plot())
#' }
nice_save <- function(
    filename,
    plot = ggplot2::last_plot(),
    layout = c("full col", "half col", "tiny", "full page", "slides"),
    custom = NULL,
    ...
) {
  layout <- match.arg(layout)
  
  dpi_set = 300
  
  # handle SVG dependency
  if (grepl("\\.svg$", filename, ignore.case = TRUE)) {
    if (!requireNamespace("svglite", quietly = TRUE)) {
      stop("Saving as .svg requires the 'svglite' package. Please install it with install.packages('svglite')")
    }
  }
  
  # get sizes of text elements in width and height of the plot
  # .. note:: this is the space in inches that will be occupied by elements
  #           outside the plot panel
  g <- ggplot2::ggplotGrob(plot)
  w_in <- sum(grid::convertWidth(g$widths, "in", valueOnly = TRUE))
  h_in <- sum(grid::convertHeight(g$heights, "in", valueOnly = TRUE))
  
  # get the aspect ratio of panel if one was specified by user
  if(!is.null(plot$theme$aspect.ratio)) {
    panel_ar <- plot$theme$aspect.ratio
    message("Plot panel aspect ratio is ", panel_ar, ".")
  } else {
    panel_ar <- 1
    message("No aspect ratio was specified in your plot theme. Assuming 1:1 ratio.")
  }
  
  # define dimensions based on layout
  if (!is.null(custom)) {
    dims <- list(width = custom[1], height = custom[2])
  } else {
    dims <- switch(layout,
                   "full col"  = list(width = 3.5, height = (((3.5 - w_in) * panel_ar) + h_in)),
                   "half col"  = list(width = 1.8, height = (((1.8 - w_in) * panel_ar) + h_in)),
                   "tiny"      = list(width = 1, height = (((1 - w_in) * panel_ar) + h_in)),
                   "full page" = list(width = 7, height = (((7 - w_in) * panel_ar) + h_in)),
                   "slides"    = list(width = (((4.5 - h_in) * 1/panel_ar) + w_in), height = 4.5),
                   stop("Unknown layout '", layout, "'. Choose from: full col, half col, tiny, full page, slides.")
    )
  }
  
  # notify user
  message("Saving a ", round(dims$width, 2), "in x ", round(dims$height, 2), "in figure to: ", filename)
  
  # save the plot
  ggplot2::ggsave(
    filename = filename,
    plot = plot,
    width = dims$width,
    height = dims$height,
    dpi = dpi_set,
    units = "in",
    ...
  )
  invisible(filename)
}