# R/plotter.R
# function plotter' for plotting data with a menu to choose different plotting types
# e.g. 'plot' for a Scatter plot

plotter <- function(x = NULL, y = NULL, plot_type = NULL, header = NULL, regline = NULL, language = NULL, pdf = NULL, verbose = NULL) {

  ## User input
  # Language
  if(is.null(language)) {
    user_inputl <- readline(prompt = "Language ('ger' or 'eng')? ")
    if(user_inputl == "ger" | user_inputl == "Ger" | user_inputl == "GER") {
      user_inputl <- "ger"
    } else {
      user_inputl <- "eng"
    }
    language <- user_inputl
  } else {
    if(!language == "ger" | !language == "eng") {
      language <- "eng"
    }
  }

  # PDF Export
  if(is.null(pdf)) {
    if(language == 'eng') {
      user_inputgfx <- readline(prompt = "PDF Export ('TRUE' or 'FALSE')? ")
    } else {
      user_inputgfx <- readline(prompt = "PDF Export ('TRUE' oder 'FALSE')? ")
    }
    if(user_inputgfx == "TRUE" | user_inputgfx == "true" | user_inputgfx == "True") {
      user_inputgfx <- TRUE
    } else {
      user_inputgfx <- FALSE
    }
    pdf <- user_inputgfx
  } else {
    if(!pdf == TRUE | !language == FALSE) {
      pdf <- FALSE
    }
  }

  ## checking if 'x' data is available
  if(is.null(x)) {
    user_inputx <- ""
    while (user_inputx == "") {
      if(language == 'eng') {
        user_inputx <- readline(prompt = "Name of the data frame or vector ('x')? ")
      } else {
        user_inputx <- readline(prompt = "Name des Data Frames oder Vektors ('x')? ")
      }
      if(grepl("$", user_inputx, fixed = TRUE)) {
        # nicht prüfen ob vorhanden!
      } else {
        if(!exists(user_inputx)) {
          user_inputx <- ""
        }
      }
    }
    # problems with 'data_frame$column' writing in a variable with name of vector, solution ->
    if(grepl("$", user_inputx, fixed = TRUE)) {
      # data frame column to vector (x)
      x <- as.vector(unlist(eval(parse(text=paste0(user_inputx)))))
    } else {
      if(is.data.frame(get(user_inputx))) {
        # read a data frame name from input from console
        x <- get(user_inputx)
        x <- as.vector(unlist(x))
      } else {
        # read a vector name from input from console
        x <- get(user_inputx)
      }
    }
  } else {
    if(is.data.frame(x)) {
      # got a data frame when function was loaded
      x <- as.vector(unlist(x))
    } else {
      # got a vector when function was loaded
      # all fine, nothing needed :)
    }
  }

  ## checking if 'y' data is available
  if(is.null(y)) {
    no_datay <- TRUE
    user_inputy <- ""
    while (user_inputy == "") {
      if(language == 'eng') {
        user_inputy <- readline(prompt = "Is there more data ('y') for calculating (just type <Enter> for 'NO')? ")
      } else {
        user_inputy <- readline(prompt = "Sind noch mehr Daten ('y') zuberechnen (<Enter> drücken für 'NEIN')? ")
      }
      if(user_inputy == "" | user_inputy == "NO" | user_inputy == "no" | user_inputy == "No"| user_inputy == "NEIN" | user_inputy == "nein" | user_inputy == "Nein") {
        no_datay <- TRUE
        user_inputy <- "NO"
      } else {
        if(grepl("$", user_inputy, fixed = TRUE)) {
          # nicht prüfen ob vorhanden!
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
    # just do when y data should be used
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
      # got a data frame when function was loaded
      y <- as.vector(unlist(y))
    } else {
      # got a vector when function was loaded
      # all fine, nothing needed :)
    }
  }

  ## checking if plot_type is choosen
  if(is.null(plot_type)) {
    user_inputp <- ""
    while (user_inputp == "") {
      # checking if y data is available or not
      if(is.null(y)) {
        if(language == 'eng') {
          user_inputp <- readline(prompt = "(Ba)rplot, (Bo)xplot, (D)ensity Plot, (Hi)stogram, \n(L)ine Plot, (S)catterplot or (V)enn Diagram? ")
        } else {
          user_inputp <- readline(prompt = "(Ba)lkendiagramm, (Bo)x-Diagramm, (D)ichtediagramm, (Hi)stogramm, \n(L)inien-Diagramm, (S)treudiagramm oder (V)enn-Diagramm? ")
        }
      } else {
        if(language == 'eng') {
          user_inputp <- readline(prompt = "(Ba)rplot, (Bo)xplot, (He)atmap, (P)airs Plot, \n(Q)qplot, (S)catterplot or (V)enn Diagram? ")
        } else {
          user_inputp <- readline(prompt = "(Ba)lkendiagramm, (Bo)x-Diagramm, (He)atmap, \n(P)aar-Diagramm, (Q)qplot, (S)treudiagramm oder (V)enn-Diagramm? ")
        }
      }
      if(user_inputp == 'BA' | user_inputp == 'Ba' | user_inputp == 'ba' | user_inputp == 'BO' | user_inputp == 'Bo' | user_inputp == 'bo' | user_inputp == 'D' | user_inputp == 'd' | user_inputp == 'HE' | user_inputp == 'He' | user_inputp == 'he' | user_inputp == 'HI' | user_inputp == 'Hi' | user_inputp == 'hi' | user_inputp == 'L' | user_inputp == 'l' | user_inputp == 'P' | user_inputp == 'p' | user_inputp == 'Q' | user_inputp == 'q' | user_inputp == 'S' | user_inputp == 's' | user_inputp == 'V' | user_inputp == 'v' ) {
        plot_type <- user_inputp
      } else {
        user_inputp <- ""
      }
    }
  }

  ## do the plotting
  # ask for a header
  if(is.null(header)) {
    user_inputh <- ""
    while (user_inputh == "") {
      if(language == 'eng') {
        user_inputh <- readline(prompt = "Please enter the name for the header of the diagram: \n(just type <Enter> for no header) ")
      } else {
        user_inputh <- readline(prompt = "Bitte die Bezeichnung für die Kopfzeile des Diagramms eingeben: \n(<Enter> drücken für keinen Header) ")
      }
      if(user_inputh == "" | user_inputh == "FALSE" | user_inputh == "NO" | user_inputh == "no" | user_inputh == "Nein"| user_inputh == "NEIN" | user_inputh == "nein" | user_inputh == "No") {
        user_inputh <- "FALSE"
      } else {
        header = user_inputh
      }
    }
  }
  if(plot_type == 'BA' | plot_type == 'Ba' | plot_type == 'ba') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Barplot.pdf")
      } else {
        pdf("Balkendiagramm.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        barplot(x)
      } else {
        barplot(x, main = header)
      }
    } else {
      if(is.null(header)) {
        barplot(x, y)
      } else {
        barplot(x, y, main = header)
      }
    }
  }
  if(plot_type == 'BO' | plot_type == 'Bo' | plot_type == 'bo') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Boxplot.pdf")
      } else {
        pdf("Boxdiagramm.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        boxplot(x)
      } else {
        boxplot(x, main = header)
      }
    } else {
      if(is.null(header)) {
        boxplot(x, y)
      } else {
        boxplot(x, y, main = header)
      }
    }
  }
  if(plot_type == 'D' | plot_type == 'd') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Densityplot.pdf")
      } else {
        pdf("Dichtediagramm.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(density(x))
      } else {
        plot(density(x), main = header)
      }
    } else {
      if(is.null(header)) {
        plot(density(x, y))
      } else {
        plot(density(x, y), main = header)
      }
    }
  }
  if(plot_type == 'HE' | plot_type == 'He' | plot_type == 'he') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Heatmap.pdf")
      } else {
        pdf("Heatmap.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        heatmap(x)
      } else {
        heatmap(x, main = header)
      }
    } else {
      if(is.null(header)) {
        heatmap(cbind(x, y))
      } else {
        heatmap(cbind(x, y), main = header)
      }
    }
  }
  if(plot_type == 'HI' | plot_type == 'Hi' | plot_type == 'hi') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Histogram.pdf")
      } else {
        pdf("Histogramm.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        hist(x)
      } else {
        hist(x, main = header)
      }
    } else {
      if(is.null(header)) {
        hist(x, y)
      } else {
        hist(x, y, main = header)
      }
    }
  }
  if(plot_type == 'L' | plot_type == 'l') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Lineplot.pdf")
      } else {
        pdf("Liniendiagramm.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(x, type = "l")
      } else {
        plot(x, type = "l", main = header)
      }
    } else {
      if(is.null(header)) {
        plot(x, y, type = "l")
      } else {
        plot(x, y, type = "l", main = header)
      }
    }
  }
  if(plot_type == 'P' | plot_type == 'p') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Pairdiagram.pdf")
      } else {
        pdf("Paardiagramm.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        pairs(data.frame(x))
      } else {
        pairs(data.frame(x), line.main = header)
      }
    } else {
      if(is.null(header)) {
        pairs(data.frame(x, y))
      } else {
        pairs(data.frame(x, y), line.main = header)
      }
    }
  }
  if(plot_type == 'Q' | plot_type == 'q') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Qqlot.pdf")
      } else {
        pdf("Qqplot.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        qqplot(x)
      } else {
        qqplot(x, main = header)
      }
    } else {
      if(is.null(header)) {
        qqplot(x, y)
      } else {
        qqplot(x, y, main = header)
      }
    }
  }
  if(plot_type == 'S' | plot_type == 's') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Scatterplot.pdf")
      } else {
        pdf("Streudiagramm.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(x)
      } else {
        plot(x, main = header)
      }
    } else {
      if(is.null(header)) {
        plot(x, y)
      } else {
        plot(x, y, main = header)
      }
    }
  }
  if(plot_type == 'V' | plot_type == 'v') {
    if(pdf == TRUE) {
      if(language == 'eng') {
        pdf("Venndiagram.pdf")
      } else {
        pdf("Venndiagramm.pdf")
      }
    }
    library("VennDiagram")
    plot.new()
    if(is.null(y)) {
      draw.single.venn(area = 10)
    } else {
      draw.pairwise.venn(area1 = 10,
                         area2 = 20,
                         cross.area = 2)
    }
  }
  # should the regression line be printed?
  if(!is.null(y)) {
    if(is.null(regline)) {
      user_inputrl <- ""
      while (user_inputrl == "") {
        if(language == 'eng') {
          user_inputrl <- readline(prompt = "Should a regression line be printed ('TRUE' or 'FALSE')? ")
        } else {
          user_inputrl <- readline(prompt = "Soll eine Regressionsgrade gezeichnet werden ('TRUE' oder 'FALSE')? ")
        }
        if(user_inputrl == "" | user_inputrl == "FALSE" | user_inputrl == "NO" | user_inputrl == "no" | user_inputrl == "Nein"| user_inputrl == "NEIN" | user_inputrl == "nein" | user_inputrl == "No") {
          user_inputrl <- FALSE
        } else {
          user_inputrl <- TRUE
        }
      }
      regline = user_inputrl
    }
  } else {
    regline = FALSE
  }
  # print a regression line
  if(regline == TRUE) { abline(lm(y ~ x), col = "red") }
  # end pdf printing if activated
  if(pdf == TRUE) { dev.off() }

  ## verbose output
  if(is.null(verbose)) { verbose <- FALSE}
  if(verbose == TRUE) {
    if(language == 'eng') {
      return(print("Done."))
    } else {
      return(print("Erledigt."))
    }
  }
}
