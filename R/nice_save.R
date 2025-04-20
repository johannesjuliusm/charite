#' High-resolution (300dpi) figure export using defaults that are great
#' for slides and publications
#'
#' A wrapper around [ggplot2::ggsave()] that saves plots with recommended
#' dimensions, resolution, and format for slides and publications. By default,
#' saves as 3.5 inch figure, which is the standard size of one column in a
#' scientific publication ("full width figure"). Also consider "half width",
#' which measures 1.8 inch.
#' 
#' @details
#' If saving to `.svg`, this function requires the `svglite` package to be installed.
#' You can install it with `install.packages("svglite")`.
#'
#' @param filename Name of the file to save. Should end in `.png`, `.svg`, etc.
#' @param plot A ggplot object. If omitted, uses the last plot.
#' @param width Width in inches. Default is 3.5 (ideal for slides).
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
    width = 3.5,
    ...
) {
  
  # check for .svg output
  if (grepl("\\.svg$", filename, ignore.case = TRUE)) {
    if (!requireNamespace("svglite", quietly = TRUE)) {
      stop("Saving as .svg requires the 'svglite' package. Please install it with install.packages('svglite')")
    }
  }
  
  # estimate aspect ratio from the ggplot object
  g <- ggplot2::ggplotGrob(plot)
  w_cm <- sum(grid::convertWidth(g$widths, "cm", valueOnly = TRUE))
  h_cm <- sum(grid::convertHeight(g$heights, "cm", valueOnly = TRUE))
  aspect_ratio <- h_cm / w_cm
  height <- width * aspect_ratio
  
  ggplot2::ggsave(
    filename = filename,
    plot = plot,
    width = width,
    height = height,
    dpi = 300,
    units = "in",
    ...
  )
  invisible(filename)
}