# R/ourdata.R
# Startup message

ourdata <- function() {
  cat("This is the R package `ourdata` used for Data Science courses at the Fresenius University of Applied Sciences.\n")
  cat("Type `help(ourdata)` to display the content.\n")
  cat("Type `ourdata_website()` to open the package website.\n")
  cat("Have fun in the course!\n")
  cat("Benjamin Gross\n")
}


#' Open the ourdata package website
#'
#' Opens the HTML documentation website in your default browser.
#'
#' @export
#' @examples
#' \dontrun{
#' ourdata_website()
#' }
ourdata_website <- function() {
  url <- system.file("rmd", "ourdata.html", package = "ourdata", mustWork = TRUE)
  browseURL(url)
  invisible(url)
}
