## R/zzz.R
## Startup message and load of functions

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("This is version ", packageVersion(pkgname),
                        " of ", pkgname, "\nType help(ourdata)")
}

.onLoad <- function(libname, pkgname) {
  if (interactive()) {
    ourdata()

    # Loading the HTML 'ourdata' Page
    url <- as.character(system.file("rmd", "ourdata.html", package = "ourdata", mustWork = FALSE))
    browseURL(url, browser = getOption("browser"), encodeIfNeeded = FALSE)

    # Running the Rmd file directly
    #rmarkdown::run(system.file("rmd", "ourdata.Rmd", package = "ourdata", mustWork = FALSE))
  }
}
