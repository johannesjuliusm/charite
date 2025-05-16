#' Interpolation or reversion of a Charite color palette
#' 
#' Internal function for the use of color palettes for continuous data or as many
#' categories as required. This function can be used to create your own custom
#' color palette.
#'
#' @param palette Character name of palette in `[charite::charite_palettes] or a custom vector of hex codes
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
#' pal <- make_charite_palette("goldelse")
#' pal(5)
#' pal_rev <- make_charite_palette("mono", reverse = TRUE)
#' pal_rev(10)
make_charite_palette <- function(palette = "primary", reverse = FALSE, ...) {
  if (is.character(palette) && length(palette) == 1) {
    pal <- charite_palettes[[palette]]
    
    if (is.null(pal)) {
      stop("Palette not found. Available palettes: ",
           paste(names(charite_palettes), collapse = ", "))
    }
  } else if (is.character(palette) && length(palette) > 1) {
    pal <- palette # treat as custom vector of hex colors
  } else {
    stop("`palette` must be a palette name or a vector of color hex codes.")
  }
  
  if (reverse) pal <- rev(pal)
  
  grDevices::colorRampPalette(pal, ...)
}