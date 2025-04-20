#' Preview available Charite color palettes
#'
#' Displays all color palettes defined in [charite::charite_palettes] as color swatches.
#'
#' @importFrom graphics par rect text
#'
#' @export
#'
#' @examples
#' preview_charite_palettes()
preview_charite_palettes <- function() {
  palettes <- charite_palettes
  n_pal <- length(palettes)
  
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par))
  
  par(mar = c(0.5, 8, 1, 0.5))
  plot(NULL, type = "n", xlim = c(0, max(lengths(palettes))), ylim = c(0, n_pal), 
       xaxt = "n", yaxt = "n", bty = "n", xlab = "", ylab = "")
  
  for (i in seq_along(palettes)) {
    pal <- palettes[[i]]
    n <- length(pal)
    rect(xleft = 0:(n - 1), ybottom = n_pal - i, 
         xright = 1:n, ytop = n_pal - i + 0.8, 
         col = pal, border = NA)
    text(-0.2, n_pal - i + 0.4, names(palettes)[i], xpd = TRUE, pos = 2, cex = 0.8)
  }
}