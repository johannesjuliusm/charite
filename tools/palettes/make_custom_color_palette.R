# define your favourite colours
monored_colors <- c(
  BLACK   = charite_colors$BLACK,
  DGREY   = charite_colors$PRIME_DGREY,
  LGREY   = charite_colors$PRIME_LGREY,
  KORALL  = charite_colors$KORALL,
  ROT     = charite_colors$ROT
)

# turn it into a colour palette
monored <- charite::make_charite_palette(monored_colors, reverse = FALSE)
# monored <- grDevices::colorRampPalette(rev(berryseason_colors)) # alternatively
monored <- monored(5) # define how many colour steps
n <- length(monored)

# display your new palette
par(mar = c(1, 1, 1, 1))
plot(NULL, type = "n", xlim = c(0, n), ylim = c(0, 1), 
     xaxt = "n", yaxt = "n", bty = "n", xlab = "", ylab = "")
for (i in seq_len(n)) {
  rect(xleft = i - 1, ybottom = 0, xright = i, ytop = 1, 
       col = monored[i], border = NA)
}

# use your new palette in a plot
ggplot(ChickWeight, aes(x = Time, y = weight, color = weight)) +
  geom_point(size = 3) +
  scale_color_gradientn(colors = monored) +
  theme_charite(base_size = 12)