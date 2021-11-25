# Hello, World!

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("This is version ", packageVersion(pkgname),
                        " of ", pkgname, "\nType `help(ourdata)´")
}

.onLoad <- function(libname, pkgname) {
  ourdata()
}
