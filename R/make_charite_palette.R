#' Interpolation or reversion of a Charite color palette
#' 
#' Internal function for the use of color palettes for continuous data or as many
#' categories as required.
#'
#' @param palette Character name of palette in `[charite::charite_palettes]
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to [grDevices::colorRampPalette()]
#'
#' @return A function that takes an integer `n` and returns `n` interpolated colors
#'
#' @importFrom grDevices colorRampPalette
#'
#' @export
#' 
#' @examples
#' pal <- make_charite_palette("buch")
#' pal(5)
#' pal_rev <- make_charite_palette("mitte", reverse = TRUE)
#' pal_rev(10)
make_charite_palette <- function(palette = "primary", reverse = FALSE, ...) {
  pal <- charite_palettes[[palette]]
  
  if (is.null(pal)) {
    stop("Palette not found. Available palettes: ",
         paste(names(charite_palettes), collapse = ", "))
  }
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}