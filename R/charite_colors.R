#' Hex code color definitions of the official Charite visual identity color scheme
#'
#' A list of hex color codes with the primary, secondary, and accent colors for
#' the Charite brand as defined by the Charite [Markenportal](https://marke.charite.de/d/Y3FxSwD6Tz3a)
#' for use with [charite::theme_charite()]
#'
#' @return A hex color scheme of corporate identity colors
#' @export
#' 
#' @examples
#' library(ggplot2)
#' ggplot(as.data.frame(x = 2, y = 6), aes(x = 2, y = 6)) +
#'     geom_point(size = 16, color = charite_colors$LIMETTE) +
#'     theme_charite()
charite_colors <- list(
  # Primary colors
  WHITE         = "#ffffff",
  BLACK         = "#000000",
  TEXT_GREY     = "#5e676c",
  PRIME_BLUE    = "#004d9b",
  PRIME_LGREY   = "#cbcfd2",
  PRIME_DGREY   = "#7e898f",
  # Secondary colors
  SECOND_DBLUE  = "#002552",
  SECOND_LBLUE  = "#007bc3",
  KORALL        = "#ea5451",
  # Accents
  BRAUN         = "#89725b",
  MOCCA         = "#c8b8ad",
  GRASGRUEN     = "#a1ba0c",
  LIMETTE       = "#d1d811",
  GRUEN         = "#008939",
  MINT          = "#88c69a",
  MINERAL       = "#009aa9",
  AQUA          = "#61c3d7",
  LILA          = "#564091",
  LAVENDEL      = "#7876b6",
  BROMBEERE     = "#6f186d",
  PFLAUME       = "#944292",
  WEINROT       = "#89014c",
  HIMBEER       = "#d74b7f",
  ROT           = "#e31f2c",
  RAPSGELB      = "#fab600",
  ZITRONE       = "#ffdf43",
  # Special colors
  EMPLOYER_BRANDING_GREEN = "#ccefcb"
)