#' Charite fill scale for ggplot2
#'
#' Applies a ggplot2 fill scale using one of the custom color palettes from [charite::charite_palettes]
#'
#' @param palette Character name of a palette in [charite::charite_palettes]
#' @param discrete Logical. Should the palette use discrete color steps?
#' @param reverse Logical. Should the palette be reversed?
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()]
#'
#' @return A ggplot2 scale object
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(factor(cyl), fill = factor(cyl))) +
#'   geom_bar() +
#'   scale_fill_charite("goldelse") +
#'   theme_charite()
scale_fill_charite <- function(palette = "primary", discrete = TRUE, reverse = FALSE, ...) {
  pal <- make_charite_palette(palette = palette, reverse = reverse)
  
  if (discrete) {
    ggplot2::discrete_scale("fill", paste0("charite_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_fill_gradientn(colours = pal(256), ...)
  }
}