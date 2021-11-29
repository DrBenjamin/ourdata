# R/plotter.R
# function plotter' for plotting data with a menu to choose different plotting types
# e.g. 'plot' for a Scatter plot

plotter <- function(x, y = "None", verbose = FALSE) {
  x_name <- names(x)
  x <- as.vector(unlist(x))
  y_name <- names(y)
  y <- as.vector(unlist(y))

  # plotting
  if(y == "None") {
    barplot(x)
  }
  if(y != "None") {
    plot(x ~ y)
  }

  # verbose messages
  if(verbose == TRUE) {
    print("plot(x ~ y)")
  }
  return(print("Done."))
}
