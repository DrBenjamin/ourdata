# R/plotter.R
# function plotter' for plotting data with a menu to choose different plotting types
# e.g. 'plot' for a Scatter plot

plotter <- function(x = NULL, y = NULL, plot_type = NULL, language = NULL, verbose = FALSE) {

  # User input
  # Language
  if(is.null(language)) {
    user_input1 <- readline(prompt = "Language ('ger' or 'eng')? ")
  } else { user_input1 = language }

  # checking if x data is available
  if(is.null(x)) {
    user_inputx <- ""
    while (user_inputx == "") {
      if(user_input1 == 'eng') {
        # English
        user_inputx <- readline(prompt = "Name of the data frame or vector? ")
      } else {
        # German
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

  # checking if plot_type is not choosen
  if(is.null(plot_type)) {
    # checking if y data is available or not
    if(is.null(y)) {
      if(user_input1 == 'eng') {
        # English
        user_input2 <- readline(prompt = "(B)arplot or (D)ensity Plot? ")
      } else {
        # German
        user_input2 <- readline(prompt = "(B)alkendiagramm oder (D)ichtediagramm? ")
      }
    } else {
      y <- as.vector(unlist(y))
      if(user_input1 == 'eng') {
        # English
        user_input2 <- readline(prompt = "(S)catterplot? ")
      } else {
        # German
        user_input2 <- readline(prompt = "(S)treudiagramm? ")
      }
    }
    plot_type <- user_input2
  }

  # do the plotting
  if(plot_type == 'S' | plot_type == 's') {
    plot(x, y)
  }
  if(plot_type == 'B' | plot_type == 'b') {
    barplot(x)
  }
  if(plot_type == 'D' | plot_type == 'd') {
    plot(density(x))
  }

  if(verbose == TRUE) {
    if(user_input1 == 'eng') {
      return(print("Done."))
    } else {
      return(print("Erledigt."))
    }
  }
}
