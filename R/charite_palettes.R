#' Charite color palettes
#'
#' A named list of color palettes conforming to the Charite visual identity.
#' These palettes can be used with [charite::make_charite_palette()] and
#' ggplot2 scale helpers.
#'
#' @export
charite_palettes <- list(
  primary = c(
    PRIME_BLUE    = charite_colors$PRIME_BLUE,
    PRIME_DGREY   = charite_colors$PRIME_DGREY,
    PRIME_LGREY   = charite_colors$PRIME_LGREY
  ),
  
  secondary = c(
    SECOND_DBLUE  = charite_colors$SECOND_DBLUE,
    SECOND_LBLUE  = charite_colors$SECOND_LBLUE,
    KORALL        = charite_colors$KORALL
  ),
  
  mono = c(
    BLACK         = charite_colors$BLACK,
    PRIME_DGREY   = charite_colors$PRIME_DGREY,
    PRIME_LGREY   = charite_colors$PRIME_LGREY
  ),
  
  light = c(
    SECOND_LBLUE  = charite_colors$SECOND_LBLUE,
    PRIME_LGREY   = charite_colors$PRIME_LGREY
  ),
  
  buch = c(
    PRIME_BLUE    = charite_colors$PRIME_BLUE,
    ROT           = charite_colors$ROT
  ),
  
  franklin = c(
    LILA          = charite_colors$LILA,
    MINT          = charite_colors$MINT,
    MINERAL       = charite_colors$MINERAL
  ),
  
  mitte = c(
    WEINROT       = charite_colors$WEINROT,
    HIMBEER       = charite_colors$HIMBEER,
    MINT          = charite_colors$MINT,
    GRUEN         = charite_colors$GRUEN
  ),
  
  cvk = c(
    SECOND_DBLUE  = charite_colors$SECOND_DBLUE,
    SECOND_LBLUE  = charite_colors$SECOND_LBLUE,
    ZITRONE       = charite_colors$ZITRONE,
    RAPSGELB      = charite_colors$RAPSGELB
  ),
  
  berryseason = c(
    HIMBEERE      = charite_colors$HIMBEER,
    PFLAUME       = charite_colors$PFLAUME,
    BROMBEERE     = charite_colors$BROMBEERE,
    HIMBEERE      = charite_colors$SECOND_DBLUE,
    MOCCA         = charite_colors$MOCCA,
    BRAUN         = charite_colors$BRAUN
  ),
  
  goldelse = c(
    RAPSGELB      = charite_colors$RAPSGELB,
    ZITRONE       = charite_colors$ZITRONE,
    LIMETTE       = charite_colors$LIMETTE,
    GRASGRUEN     = charite_colors$GRASGRUEN,
    AQUA          = charite_colors$AQUA,
    MINERAL       = charite_colors$MINERAL,
    LAVENDEL      = charite_colors$LAVENDEL,
    LILA          = charite_colors$LILA
  )
)