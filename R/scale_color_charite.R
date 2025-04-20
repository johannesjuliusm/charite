#' Charite color scale for ggplot2
#'
#' Applies a ggplot2 color scale using one of the custom Charite color palettes from [charite::charite_palettes]
#'
#' @inheritParams scale_fill_charite
#'
#' @return A ggplot2 scale object
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(mpg, cyl, color = mpg)) +
#'   geom_point(size = 3) +
#'   scale_color_charite("buch", discrete = FALSE) +
#'   theme_charite()
#'
#' ggplot(mtcars, aes(factor(cyl), color = factor(cyl))) +
#'   geom_point(size = 5, stat = "count") +
#'   scale_color_charite("buch") +
#'   theme_charite()
scale_color_charite <- function(palette = "primary", discrete = TRUE, reverse = FALSE, ...) {
  pal <- make_charite_palette(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale("colour", paste0("charite_", palette), palette = pal, ...)
  } else {
    ggplot2::scale_color_gradientn(colours = pal(256), ...)
  }
}