#' Preview available Charite color palettes
#'
#' Displays all color palettes defined in [charite::charite_palettes] as color swatches.
#' Users can toggle between viewing the palettes as discrete colors or continuous gradients.
#'
#' @param type Character; either "discrete" or "continuous". Defaults to "discrete".
#'
#' @importFrom graphics par rect text image box layout
#'
#' @export
#'
#' @examples
#' preview_charite_palettes()
#' preview_charite_palettes(type = "continuous")
preview_charite_palettes <- function(type = c("discrete", "continuous")) {
  type <- match.arg(type)
  palettes <- charite_palettes
  n_pal <- length(palettes)
  
  old_par <- par(no.readonly = TRUE)
  on.exit(par(old_par))
  
  if (type == "discrete") {
    
    par(mar = c(0.5, 4, 0.1, 0.1))
    plot(NULL, type = "n", xlim = c(0, max(lengths(palettes))), ylim = c(0, n_pal), 
         xaxt = "n", yaxt = "n", bty = "n", xlab = "", ylab = "")
    
    for (i in seq_along(palettes)) {
      pal <- palettes[[i]]
      n <- length(pal)
      
      # draw color swatches
      rect(xleft = 0:(n - 1), ybottom = n_pal - i, 
           xright = 1:n, ytop = n_pal - i + 0.8, 
           col = pal, border = NA)
      
      # draw a border around the full swatch row
      rect(
        xleft = 0, 
        ybottom = n_pal - i, 
        xright = n, 
        ytop = n_pal - i + 0.8, 
        border = "white", 
        lwd = 0.5, 
        col = NA
      )
      
      # add label
      text(-0.2, n_pal - i + 0.4, names(palettes)[i], xpd = TRUE, pos = 2, cex = 0.8)
    }
    
  } else if (type == "continuous") {
    
    layout(matrix(seq_len(n_pal), ncol = 1))
    par(mar = c(0.3, 6, 0.3, 0.3), cex = 1)
    
    for (i in seq_along(palettes)) {
      pal_name <- names(palettes)[i]
      pal <- palettes[[i]]
      
      # draw the colour gradients
      ramp <- grDevices::colorRampPalette(pal)(256)
      image(1:256, 1, as.matrix(1:256), col = ramp,
            axes = FALSE, xlab = "", ylab = "")
      box(col = "white")
      
      # add label
      text(-10, 1, pal_name, xpd = TRUE, pos = 2, cex = 0.8)
    }
  }
}