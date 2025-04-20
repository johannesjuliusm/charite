#install.packages("hexSticker")
library(hexSticker)

library(ggplot2)
library(charite)

sticker(
  subplot = "inst/221215_charite_bildmarke_rgb.png",
  package = "charite",
  p_size = 16,
  s_x = 1,         # center horizontally
  s_y = 0.9,         # slightly lower if needed
  s_width = 0.5,   # smaller image
  s_height = 0.5,  # optional, keeps proportions clean
  h_fill = "#ffffff",
  h_color = "#004d9b",
  p_color = "#7e898f",
  filename = "man/figures/hex_charite.png"
)