% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nice_save.R
\name{nice_save}
\alias{nice_save}
\title{High-resolution (300dpi) figure export for publications and slides}
\usage{
nice_save(
  filename,
  plot = ggplot2::last_plot(),
  layout = c("full col", "half col", "tiny", "full page", "slides"),
  custom = NULL,
  ...
)
}
\arguments{
\item{filename}{Name of the file to save. Should end in \code{.png}, \code{.tiff}, \code{.svg}, etc.}

\item{plot}{A ggplot object. If omitted, uses the last plot.}

\item{layout}{One of: "full col", "half col", "tiny", "full page", "slides".}

\item{custom}{A vector of width and height in inches. If specified, will override \code{layout}}

\item{...}{Additional arguments passed to \code{\link[ggplot2:ggsave]{ggplot2::ggsave()}}.}
}
\value{
Saves the plot and returns the filename (invisibly).
}
\description{
A wrapper around \code{\link[ggplot2:ggsave]{ggplot2::ggsave()}} that saves plots with layout profiles
optimized for slides and publications.
}
\details{
Supported layouts:
\itemize{
\item \code{"full col"} (3.5 in): Standard full-column publication figure
\item \code{"half col"} (1.8 in): Half-width column figure
\item \code{"tiny"}     (1 in): For compact sub-figures or thumbnails
\item \code{"full page"} (7 in): Full-page width figure
\item \code{"slides"}   (4.5 in height): For presentation slides
}

For optimal rendering, adjust \code{font_size} in \code{theme_charite()} and control sizes and margins in your plot.
Recommended sizes: 6 or 8 pt for most plots, 6 pt or smaller for "tiny" plots; 10 or 12 pt for "slides".

Plots rendered with \code{theme_charite()} have transparent backgrounds. You may override with \code{bg = "white"}.
Saving to \code{.svg} requires the \code{svglite} package.
}
\examples{
\dontrun{
nice_save("example.png", example_plot())
}
}
