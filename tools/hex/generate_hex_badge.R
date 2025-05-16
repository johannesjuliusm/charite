#install.packages("hexSticker")
library(hexSticker)
library(ggplot2)
library(charite)

sticker(
  subplot = "inst/bettenhochhaus.png",
  package = "charite",
  p_size = 16,
  s_x = 1,          # center horizontally
  s_y = 0.85,        # slightly lower if needed
  s_width = 0.45,   # smaller image
  s_height = 0.45,  # optional, keeps proportions clean
  h_fill = "#ffffff",
  h_color = "#004d9b",
  p_color = "#7e898f",
  filename = "man/figures/hex_charite.png"
)