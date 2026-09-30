#' @noRd
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    pkgname, " ", utils::packageVersion(pkgname), " loaded.\n",
    "Have fun with your project!"
  )
}
