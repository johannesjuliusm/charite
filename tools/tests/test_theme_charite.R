library(charite)
library(ggplot2)

set.seed(777)

dummy <- data.frame(
  id = paste0("sub-", sprintf("%03d", 1:10)),
  group = sample(c("Patient", "Control"), 10, replace = TRUE),
  predictor = runif(10, min = 0, max = 6),
  outcome = runif(10, min = 0, max = 12)
)

p <- ggplot(dummy, aes(x = predictor, y = outcome, fill = group)) +
  geom_point(
    pch = 21,
    size = 3,
    stroke = NA,
    alpha = .6
  ) +
  scale_fill_manual(values = c(
    "Patient" = charite_colors$PFLAUME,
    "Control" = charite_colors$MINT
  )) +
  scale_x_continuous(expand = c(0,0), limits = c(0, ceiling(max(dummy$predictor)))) +
  scale_y_continuous(expand = c(0,0), limits = c(0, ceiling(max(dummy$outcome)))) +
  labs(x = "The x axis Text",
       y = "Y outcome [%]",
       title = "Theme Development",
       subtitle = "Charité"
  ) +
  theme_charite(
    font_size = 10,
    thickness = 0.5,
    grid = TRUE,
    tiny_margins = FALSE,
    debug_area = FALSE
  )
p

nice_save("man/figures/test-figure-1.svg")