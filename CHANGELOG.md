# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---


## [0.4.0] - 2025-05-16

### New features
- Added `theme_sci()`, a derivative of `theme_charite()` for publications in journals
- Added a vignette with installation instructions for computers with proxies
- Added message informing about saved figure size to `nice_save()`
- Extended workflow documentation in README highlighting the use of custom fonts
- Updated colour palette names
- Updated function descriptions of all functions

### Fixes
- Fixed font warning in `theme_charite()` to remain silent when default "sans" is used
- Fixed default background colour of legend in `theme_charité`, now transparent like the plot
- Fixed scaling of legend keys in `theme_charite()`

## [0.3.0] - 2025-04-24

### New features
- `nice_save()` now supports manual height/width overrides.
- `theme_charite()` accepts custom font families.
- `preview_charite_palettes()` can now show continuous gradients.
- "berryseason" as a new color palette in `charite_palettes`

### Fixes
- `.svg` export error caused by `fill = NA` in `element_rect()`.
- Plot dimensions more accurately calculated in `nice_save()`.
- Plots can now be saved with transparent background.

---

## [0.2.0] - 2025-04-20

### New features
- Added `charite_palettes` and `make_charite_palette()` for custom color interpolation.
- Added `scale_fill_charite()` and `scale_color_charite()`.
- Added `nice_save()` for optimized plot rendering

---

## [0.1.0] - 2025-04-19

### Initial release
- New theme `theme_charite()` aligned with Charité visual identity.
- The Charité visual identity colors in `charite_colors`
- Example plot with `example_plot()`
- Easter egg with the `virchow()` function
- Dummy data `curves.rda` for test plots