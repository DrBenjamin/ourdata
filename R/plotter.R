# R/plotter.R
# function plotter' for plotting data with a menu to choose different plotting types
# e.g. 'plot' for a Scatter plot

plotter <- function(x = NULL, y = NULL, plot_type = NULL, language = NULL, pdf = NULL, verbose = NULL) {

  ## User input
  # Language
  if(is.null(language)) {
    user_inputl <- readline(prompt = "Language ('ger' or 'eng')? ")
    if(user_inputl == "") { user_inputl = "eng"}
    language <- user_inputl
  }

  # PDF Export
  if(is.null(pdf)) {
    if(language == 'eng') {
      user_inputgfx <- readline(prompt = "PDF Export ('TRUE' or 'FALSE')? ")
    } else {
      user_inputgfx <- readline(prompt = "PDF Export ('TRUE' oder 'FALSE')? ")
    }
    if(user_inputgfx == "") { user_inputgfx = FALSE }
    pdf <- user_inputgfx
  }

  # verbose output
  if(is.null(verbose)) {
    if(language == 'eng') {
      user_inputv <- readline(prompt = "Verbose output ('TRUE' or 'FALSE')? ")
    } else {
      user_inputv <- readline(prompt = "Ausführliche Ausgabe ('TRUE' oder 'FALSE')? ")
    }
    if(user_inputv == "") { user_inputv = FALSE }
    verbose <- user_inputv
  }

  ## checking if x data is available
  if(is.null(x)) {
    user_inputx <- ""
    while (user_inputx == "") {
      if(language == 'eng') {
        user_inputx <- readline(prompt = "Name of the data frame or vector? ")
      } else {
        user_inputx <- readline(prompt = "Name des Data Frames oder Vektors? ")
      }
    }
    # problems with 'data_frame$column' writing in a variable with name of vector, solution ->
    if(grepl("$", user_inputx, fixed = TRUE)) {
      # data frame column to vector (x)
      x <- as.vector(unlist(eval(parse(text=paste0(user_inputx)))))
    } else {
      if(is.data.frame(get(user_inputx))) {
        # read a data frame from input from console
        x <- get(user_inputx)
        x <- as.vector(unlist(x))
      } else {
        # read a vector from input from console
        x <- get(user_inputx)
      }
    }
  } else {
      if(is.data.frame(x)) {
        # got a data frame as 'x' in function load
        x <- as.vector(unlist(x))
      } else {
        # got a vector as 'x' in function load
      }
  }

  ## checking if plot_type is choosen
  if(is.null(plot_type)) {
    user_inputp <- ""
    while (user_inputp == "") {
      # checking if y data is available or not
      if(is.null(y)) {
        if(language == 'eng') {
          user_inputp <- readline(prompt = "(B)arplot or (D)ensity Plot? ")
        } else {
          user_inputp <- readline(prompt = "(B)alkendiagramm oder (D)ichtediagramm? ")
        }
      } else {
        y <- as.vector(unlist(y))
        if(language == 'eng') {
          user_inputp <- readline(prompt = "(S)catterplot? ")
        } else {
          user_inputp <- readline(prompt = "(S)treudiagramm? ")
        }
      }
      plot_type <- user_inputp
    }
  }

  ## do the plotting
  if(plot_type == 'S' | plot_type == 's') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Scatterplot.pdf")
      } else {
        pdf("Streudiagramm.pdf")
      }
    }
    plot(x, y)
  }
  if(plot_type == 'B' | plot_type == 'b') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Barplot.pdf")
      } else {
        pdf("Balkendiagramm.pdf")
      }
    }
    barplot(x)
  }
  if(plot_type == 'D' | plot_type == 'd') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Densityplot.pdf")
      } else {
        pdf("Dichtediagramm.pdf")
      }
    }
    plot(density(x))
  }
  if(pdf == TRUE) { dev.off() }

  ## verbose output
  if(verbose == TRUE) {
    if(language == 'eng') {
      return(print("Done."))
    } else {
      return(print("Erledigt."))
    }
  }
}
