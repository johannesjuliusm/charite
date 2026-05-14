# Package management ------------------------------------------------------

library(ggplot2)
library(charite)
library(ggpubr)


# Point plots -------------------------------------------------------------

# plain figure without modifications
ggplot(ChickWeight, aes(x = Time, y = weight)) +
  geom_point(size = 4) +
  labs(
    title = "Beispielschaubild",
    subtitle = "Mit Untertitel",
    x = "Zeit (Tage)",
    y = "Gewicht (kg)"
  )

# using the charite colours for points
ggplot(ChickWeight, aes(x = Time, y = weight)) +
  geom_point(
    color = charite_colors$HIMBEER,
    size = 4
    ) +
  labs(
    title = "Beispielschaubild",
    subtitle = "Mit Untertitel",
    x = "Zeit (Tage)",
    y = "Gewicht (kg)"
  )

# full charite theme
p <- ggplot(ChickWeight, aes(x = Time, y = weight, color = weight)) +
  geom_point(size = 4) +
  labs(
    title = "Beispielschaubild",
    subtitle = "Mit Untertitel",
    x = "Zeit (Tage)",
    y = "Gewicht (kg)"
  ) +
  scale_color_charite(palette = "brickhouse", discrete = FALSE, reverse = TRUE) +
  theme_charite(font = "Charité Text Office", font_size = 14)
p

# saving the figure
nice_save("example_scatter_plot.png", p, layout = "slides")


# Box plots ---------------------------------------------------------------

df <- ToothGrowth
df$dose <- factor(recode(df$dose, "0.5" = "Placebo", "1" = "Treatment", "2" = "Control"))
df$dose <- factor(df$dose, levels = c("Placebo", "Treatment", "Control"))
df$len[df$dose == "Treatment"] <- df$len[df$dose == "Treatment"] + 4

p <- ggplot(df, aes(x = dose, y = len, group = dose, color = dose)) +
  geom_boxplot(
    outlier.shape = NA,
    fill = "white",
    width = 0.6,
    lwd = 1
  ) +
  geom_point(
    pch = 21,
    stroke = 2,
    size = 2,
    alpha = 0.6,
    position = position_jitter(width = 0.2)
  ) +
  stat_compare_means(
    comparisons = list(
      c("Placebo", "Treatment"),
      c("Placebo", "Control"),
      c("Treatment", "Control")
    ),
    method = "t.test",
    label = "p.signif",
    tip.length = 0.01
  ) +
  scale_fill_charite("goldelse") +
  scale_color_charite("goldelse") +
  scale_y_continuous(
    expand = c(0,0),
    limits = c(0, 45),
    breaks = c(5, 10, 15, 20, 25, 30, 35),
    labels = c("5", "10", "15", "20", "25", "30", "35")
  ) +
  labs(
    title = "Treatment Effects",
    x = NULL,
    y = "Score"
  ) +
  theme_charite(font_size = 12, font = "Charité Text Office", aspect_ratio = 4/3) +
  theme(axis.ticks.x = element_blank()) +
  guides(fill = "none", color = "none")
p

# saving the figure
nice_save("example_box_plot.tiff", p, layout = "slides", bg = "white")
