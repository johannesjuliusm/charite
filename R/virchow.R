#' ASCII art of Rudolf Virchow
#'
#' Prints Rudolf Virchow as ASCII art to the R console.
#'
#' @return A fun little Easter egg printing an ASCII rendering of Rudolf Virchow.
#' @export
virchow <- function() {
  ascii_path <- system.file("virchow_ascii.txt", package = "charite")
  if (ascii_path == "") {
    warning("ASCII art file not found.")
  } else {
    cat(readLines(ascii_path, warn = FALSE), sep = "\n")
  }
}