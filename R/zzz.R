#' @noRd
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    pkgname, " ", packageVersion(pkgname), " loaded.\n",
    "Have fun with your project!"
  )
}
