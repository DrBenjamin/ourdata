## R/plotter.R
## Function plotter' for plotting data with a menu to choose different
## plotting types, e.g. 'plot(x)' for a Scatter plot

plotter <- function(x = NULL, y = NULL, plot_type = NULL, header = NULL, regline = NULL, language = NULL, pdf = NULL, verbose = NULL) {

  ## User input
  # Checking verbose
  if(is.null(verbose)) {
    verbose <- FALSE
  }
  # PDF Export
  if(is.null(pdf)) {
    user_text <- "PDF Export - when no graphic output is possible! ('TRUE' or 'FALSE')?"
    user_inputgfx <- readline(prompt = paste0(user_text, " "))
    if(user_inputgfx == "TRUE" | user_inputgfx == "true" | user_inputgfx == "True") {
      user_inputgfx <- TRUE
    } else {
      user_inputgfx <- FALSE
    }
    pdf <- user_inputgfx
  } else {
    if(!pdf == TRUE) {
      pdf <- FALSE
    }
  }

  ## Checking if 'x' data is available
  if(is.null(x)) {
    user_inputx <- ""
    while (user_inputx == "") {
      user_text <- "Name of the data frame or vector ('x')?"
      user_inputx <- readline(prompt = paste0(user_text, " "))
      if(grepl("$", user_inputx, fixed = TRUE)) {
        # To not check if file exists -> error
      } else {
        if(!exists(user_inputx)) {
          user_inputx <- ""
        }
      }
    }
    # Problems with 'data_frame$column' writing in a variable with name of vector, solution ->
    if(grepl("$", user_inputx, fixed = TRUE)) {
      # data frame column to vector (x)
      x <- as.vector(unlist(eval(parse(text=paste0(user_inputx)))))
    } else {
      if(is.data.frame(get(user_inputx))) {
        # Read a data frame name from input from console
        x <- get(user_inputx)
        x <- as.vector(unlist(x))
      } else {
        # Read a vector name from input from console
        x <- get(user_inputx)
      }
    }
  } else {
    if(is.data.frame(x)) {
      # Got a data frame when function was loaded
      x <- as.vector(unlist(x))
    } else {
      # Got a vector when function was loaded
      # All fine, nothing needed :)
    }
  }

  ## Checking if 'y' data is available
  if(is.null(y)) {
    no_datay <- TRUE
    user_inputy <- ""
    while (user_inputy == "") {
      user_text <- "Should more data ('y') be included (press <Enter> for 'FALSE')?"
      user_inputy <- readline(prompt = paste0(user_text, " "))
      if(user_inputy == "" | user_inputy == "FALSE" | user_inputy == "False" | user_inputy == "false"| user_inputy == "f" | user_inputy == "F") {
        no_datay <- TRUE
        user_inputy <- "NO"
      } else {
        if(grepl("$", user_inputy, fixed = TRUE)) {
          # To not check if file exists -> error
          no_datay <- FALSE
        } else {
          if(!exists(user_inputy)) {
            user_inputy <- ""
          } else {
            no_datay <- FALSE
          }
        }
      }
    }
    # Just do when y data should be used
    if(no_datay == FALSE) {
      #problems with 'data_frame$column' writing in a variable with name of vector, solution ->
        if(grepl("$", user_inputy, fixed = TRUE)) {
          # data frame column to vector (x)
          y <- as.vector(unlist(eval(parse(text=paste0(user_inputy)))))
        } else {
          if(is.data.frame(get(user_inputy))) {
            # read a data frame name from input from console
            y <- get(user_inputy)
            y <- as.vector(unlist(y))
          } else {
            # read a vector name from input from console
            y <- get(user_inputy)
          }
        }
    }
  } else {
    if(is.data.frame(y)) {
      # Got a data frame when function was loaded
      y <- as.vector(unlist(y))
    } else {
      # Got a vector when function was loaded
      # All fine, nothing needed :)
    }
  }

  ## Checking if plot_type is choosen
  if(is.null(plot_type)) {
    user_inputp <- ""
    while (user_inputp == "") {
      # Checking if y data is available or not
      if(is.null(y)) {
        user_text <- "'Ba' - Bar plot, 'Bo' - Box plot, 'D' - Density plot, 'Hi' - Histogram, 'L' - Line plot, 'S' - Scatter plot or 'V' - Venn diagram?"
      } else {
        user_text <- "'Ba' - Bar plot, 'Bo' - Box plot, 'He' - Heatmap, 'P' - Pairs plot, 'Q' - Qqplot, 'S' - Scatter plot or 'V' - Venn diagram?"
      }
      cat(user_text, sep = "\n")
      user_text <- "Which plot type should be used?"
      user_inputp <- readline(prompt = paste0(user_text, " "))
      if(user_inputp == 'BA' | user_inputp == 'Ba' | user_inputp == 'ba' | user_inputp == 'BO' | user_inputp == 'Bo' | user_inputp == 'bo' | user_inputp == 'D' | user_inputp == 'd' | user_inputp == 'HE' | user_inputp == 'He' | user_inputp == 'he' | user_inputp == 'HI' | user_inputp == 'Hi' | user_inputp == 'hi' | user_inputp == 'L' | user_inputp == 'l' | user_inputp == 'P' | user_inputp == 'p' | user_inputp == 'Q' | user_inputp == 'q' | user_inputp == 'S' | user_inputp == 's' | user_inputp == 'V' | user_inputp == 'v' ) {
        plot_type <- user_inputp
      } else {
        user_inputp <- ""
      }
    }
  }

  ## Do the plotting
  # Ask for a header
  if(is.null(header)) {
    user_inputh <- ""
    while (user_inputh == "") {
      user_text <- "Please enter the plot header (press <Enter> for no header):"
      user_inputh <- readline(prompt = paste0(user_text, " "))
      if(user_inputh == "" | user_inputh == "FALSE" | user_inputh == "False" | user_inputh == "false" | user_inputh == "F"| user_inputh == "f") {
        user_inputh <- "FALSE"
      } else {
        header = user_inputh
      }
    }
  }
  if(plot_type == 'BA' | plot_type == 'Ba' | plot_type == 'ba') {
    if(pdf == TRUE) {
      pdf("Barplot.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        barplot(x)
      } else {
        barplot(x, main = header)
      }
      if(verbose == TRUE) {
        cat("barplot(x)", sep = "\n")
      }
    } else {
      if(is.null(header)) {
        barplot(x, y)
      } else {
        barplot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat("barplot(x, y)", sep = "\n")
      }
    }
  }
  if(plot_type == 'BO' | plot_type == 'Bo' | plot_type == 'bo') {
    if(pdf == TRUE) {
      pdf("Boxplot.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        boxplot(x)
      } else {
        boxplot(x, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("boxplot(x)", sep = "\n"))
      }
    } else {
      if(is.null(header)) {
        boxplot(x, y)
      } else {
        boxplot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat("boxplot(x, y)", sep = "\n")
      }
    }
  }
  if(plot_type == 'D' | plot_type == 'd') {
    if(pdf == TRUE) {
      pdf("Densityplot.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(density(x))
      } else {
        plot(density(x), main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("plot(density(x))", sep = "\n"))
      }
    } else {
      if(is.null(header)) {
        plot(density(x, y))
      } else {
        plot(density(x, y), main = header)
      }
      if(verbose == TRUE) {
        cat("plot(density(x, y))", sep = "\n")
      }
    }
  }
  if(plot_type == 'HE' | plot_type == 'He' | plot_type == 'he') {
    if(pdf == TRUE) {
      pdf("Heatmap.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        heatmap(x)
      } else {
        heatmap(x, main = header)
      }
      if(verbose == TRUE) {
        cat("heatmap(x)", sep = "\n")
      }
    } else {
      if(is.null(header)) {
        heatmap(cbind(x, y))
      } else {
        heatmap(cbind(x, y), main = header)
      }
      if(verbose == TRUE) {
        cat("heatmap(cbind(x, y))", sep = "\n")
      }
    }
  }
  if(plot_type == 'HI' | plot_type == 'Hi' | plot_type == 'hi') {
    if(pdf == TRUE) {
      pdf("Histogram.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        hist(x)
      } else {
        hist(x, main = header)
      }
      if(verbose == TRUE) {
        cat("hist(x)", sep = "\n")
      }
    } else {
      if(is.null(header)) {
        hist(x, y)
      } else {
        hist(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat("hist(x, y)", sep = "\n")
      }
    }
  }
  if(plot_type == 'L' | plot_type == 'l') {
    if(pdf == TRUE) {
      pdf("Lineplot.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(x, type = "l")
      } else {
        plot(x, type = "l", main = header)
      }
      if(verbose == TRUE) {
        cat("plot(x, type = 'l')", sep = "\n")
      }
    } else {
      if(is.null(header)) {
        plot(x, y, type = "l")
      } else {
        plot(x, y, type = "l", main = header)
      }
      if(verbose == TRUE) {
        cat("plot(x, y, type = 'l')", sep = "\n")
      }
    }
  }
  if(plot_type == 'P' | plot_type == 'p') {
    if(pdf == TRUE) {
      pdf("Pairsplot.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        pairs(data.frame(x))
      } else {
        pairs(data.frame(x), line.main = header)
      }
      if(verbose == TRUE) {
        cat("pairs(data.frame(x))", sep = "\n")
      }
    } else {
      if(is.null(header)) {
        pairs(data.frame(x, y))
      } else {
        pairs(data.frame(x, y), line.main = header)
      }
      if(verbose == TRUE) {
        cat("pairs(data.frame(x, y))", sep = "\n")
      }
    }
  }
  if(plot_type == 'Q' | plot_type == 'q') {
    if(pdf == TRUE) {
      pdf("Qqplot.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        qqplot(x)
      } else {
        qqplot(x, main = header)
      }
      if(verbose == TRUE) {
        cat("qqplot(x)", sep = "\n")
      }
    } else {
      if(is.null(header)) {
        qqplot(x, y)
      } else {
        qqplot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat("qqplot(x, y)", sep = "\n")
      }
    }
  }
  if(plot_type == 'S' | plot_type == 's') {
    if(pdf == TRUE) {
      pdf("Scatterplot.pdf")
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(x)
      } else {
        plot(x, main = header)
      }
      if(verbose == TRUE) {
        cat("plot(x)", sep = "\n")
      }
    } else {
      if(is.null(header)) {
        plot(x, y)
      } else {
        plot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat("plot(x, y)", sep = "\n")
      }
    }
  }
  if(plot_type == 'V' | plot_type == 'v') {
    if(pdf == TRUE) {
      pdf("Venndiagram.pdf")
    }
    library("VennDiagram")
    plot.new()
    if(is.null(y)) {
      draw.single.venn(area = 10)
      if(verbose == TRUE) {
        cat("draw.single.venn(area = 10)", sep = "\n")
      }
    } else {
      draw.pairwise.venn(area1 = 10,
                         area2 = 20,
                         cross.area = 2)
      if(verbose == TRUE) {
        cat("draw.pairwise.venn(area1 = 10, area2 = 20, cross.area = 2)", sep = "\n")
      }
    }
  }
  # should the regression line be printed?
  if(!is.null(y)) {
    if(is.null(regline)) {
      user_inputrl <- ""
      while (user_inputrl == "") {
        user_text <- "Should a regression line be drawn ('TRUE' or 'FALSE')?"
        user_inputrl <- readline(prompt = paste0(user_text, " "))
        if(user_inputrl == "" | user_inputrl == "FALSE" | user_inputrl == "False" | user_inputrl == "false" | user_inputrl == "F"| user_inputrl == "f") {
          user_inputrl <- FALSE
        } else {
          user_inputrl <- TRUE
        }
      }
      regline <- user_inputrl
    }
  } else {
    regline = FALSE
  }
  # print a regression line
  if(regline == TRUE) {
    abline(lm(y ~ x), col = "red")
    if(verbose == TRUE) {
      cat("abline(lm(y ~ x), col = 'red'", sep = "\n")
    }
    user_inputcoe <- ""
    while (user_inputcoe == "") {
      user_text <- "Should the p-value and correlation coefficient be calculated ('TRUE' or 'FALSE')?"
      user_inputcoe <- readline(prompt = paste0(user_text, " "))

      if(user_inputcoe == "" | user_inputcoe == "FALSE" | user_inputcoe == "False" | user_inputcoe == "false" | user_inputcoe == "F"| user_inputcoe == "f") {
        user_inputcoe <- FALSE
      } else {
        user_inputcoe <- TRUE
        print(cor.test(x, y, method = "spearman", exact = FALSE))
        if(verbose == TRUE) {
          cat("cor.test(x, y, method = 'spearman')", sep = "\n")
        }
      }
    }
  }
  # End pdf printing if it was activated
  if(pdf == TRUE) {
    dev.off()
  }

  ## Close function
  if(verbose == TRUE) {
    user_text <- "Done."
    return(cat(user_text, sep = "\n"))
  }
}
