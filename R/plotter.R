# R/plotter.R
# Function plotter' for plotting data with a menu to choose different
# plotting types, e.g. 'plot(x)' for a Scatter plot

plotter <- function(x = NULL, y = NULL, plot_type = NULL, header = NULL, regline = NULL, language = NULL, pdf = NULL, verbose = NULL) {

  ## User input
  # Checking verbose
  if(is.null(verbose)) {
    verbose <- FALSE
  }
  # Checking Language
  if(is.null(language)) {
    cat("'BG' Bulgarian, 'CS' - Czech, 'DA' - Danish, 'DE' - German, 'EL' - Greek, 'EN-GB' - British English, 'EN-US' - American English, 'ES' - Spanish, 'ET' - Estonia, 'FI' - Finnish, 'FR' - French, 'HU' - Hungarian, 'IT' - Italian, 'JA' - Japanese, 'LT' - Lithuanian, 'LV' - Latvian, 'NL' - Dutch, 'PL' - Polish, 'PT' - Portuguese, 'RO' - Romanian, 'RU' - Russian, 'SK' - Slovak, 'SL' - Slovenian, 'SV' - Swedish or 'ZH' - Chinese)? ")
    user_inputl <- readline(prompt = "Which language? ")
    if(user_inputl == "BG" | user_inputl == "CS" | user_inputl == "DA" | user_inputl == "DE" | user_inputl == "EL" | user_inputl == "EN-GB" | user_inputl == "EN-US" | user_inputl == "ES" | user_inputl == "ET" | user_inputl == "FI" | user_inputl == "FR" | user_inputl == "HU" | user_inputl == "IT" | user_inputl == "JA" | user_inputl == "LT" | user_inputl == "LV" | user_inputl == "NL" | user_inputl == "PL" | user_inputl == "PT" | user_inputl == "RO" | user_inputl == "RU" | user_inputl == "SK" | user_inputl == "SL" | user_inputl == "SV" | user_inputl == "ZH") {
      if(!user_inputl == "DE") {
        # Load reticulate libraries
        library(reticulate)
        # Set enviroment
        use_virtualenv("my_env")
        # Load python function for using later
        source_python("py_deepl.py")
      }
    } else {
        user_inputl <- "DE"
      }
    language <- user_inputl
  } else {
    if(!language == "BG" & !language == "CS" & !language == "DA" & !language == "DE" & !language == "EL" & !language == "EN-GB" & !language == "EN-US" & !language == "ES" & !language == "ET" & !language == "FI" & !language == "FR" & !language == "HU" & !language == "IT" & !language == "JA" & !language == "LT" & !language == "LV" & !language == "NL" & !language == "PL" & !language == "PT" & !language == "RO" & !language == "RU" & !language == "SK" & !language == "SL" & !language == "SV" & !language == "ZH") {
      language <- "DE"
    } else {
      if(!language == "DE") {
        # Load reticulate libraries
        library(reticulate)
        # Set enviroment
        use_virtualenv("my_env")
        # Load python function for using later
        source_python("py_deepl.py")
      }
    }
  }

  # PDF Export
  if(is.null(pdf)) {
    user_text <- "PDF Export - wenn keine Grafikausgabe möglich! ('TRUE' oder 'FALSE')?"
    if(!language == 'DE') {
      user_text <- as.character(py_deepl(user_text, language))
    }
    user_inputgfx <- readline(prompt = paste0(user_text, " "))
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

  ## Checking if 'x' data is available
  if(is.null(x)) {
    user_inputx <- ""
    while (user_inputx == "") {
      user_text <- "Bezeichnung des Data Frames oder Vektors ('x')?"
      if(!language == 'DE') {
        user_text <- as.character(py_deepl(user_text, language))
      }
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
      user_text <- "Sind noch mehr Daten ('y') einzubeziehen (<Enter> drücken für 'FALSE')?"
      if(!language == 'DE') {
        user_text <- as.character(py_deepl(user_text, language))
      }
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
        user_text <- "'Ba' - Balkendiagramm, 'Bo' - Box-Diagramm, 'D' - Dichtediagramm, 'Hi' - Histogramm, 'L' - Linien-Diagramm, 'S' - Streudiagramm oder 'V' - Venn-Diagramm?"
        if(!language == 'DE') {
          user_text <- as.character(py_deepl(user_text, language))
        }
      } else {
        user_text <- "'Ba' - Balkendiagramm, 'Bo' - Box-Plot, 'He' - Heatmap, 'P' - Paar-Diagramm, 'Q' - Qqplot, 'S' - Streudiagramm oder 'V' - Venn-Diagramm?"
        if(!language == 'DE') {
          user_text <- as.character(py_deepl(user_text, language))
        }
      }
      cat(user_text)
      if(!language == 'DE') {
        user_text <- as.character(py_deepl("Welcher Diagramm Typ soll verwendet werden?", language))
      } else {
        user_text <- "Welcher Diagramm Typ soll verwendet werden?"
      }
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
      user_text <- "Bitte die Bezeichnung für die Kopfzeile des Diagramms eingeben (<Enter> drücken für keinen Header):"
      if(!language == 'DE') {
        user_text <- as.character(py_deepl(user_text, language))
      }
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
      if(language == 'DE') {
        pdf("Balkendiagramm.pdf")
      } else {
        pdf("Barplot.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        barplot(x)
      } else {
        barplot(x, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("barplot(x)", "\n"))
      }
    } else {
      if(is.null(header)) {
        barplot(x, y)
      } else {
        barplot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("barplot(x, y)", "\n"))
      }
    }
  }
  if(plot_type == 'BO' | plot_type == 'Bo' | plot_type == 'bo') {
    if(pdf == TRUE) {
      if(language == 'DE') {
        pdf("Kastengrafik.pdf")
      } else {
        pdf("Boxplot.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        boxplot(x)
      } else {
        boxplot(x, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("boxplot(x)", "\n"))
      }
    } else {
      if(is.null(header)) {
        boxplot(x, y)
      } else {
        boxplot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("boxplot(x, y)", "\n"))
      }
    }
  }
  if(plot_type == 'D' | plot_type == 'd') {
    if(pdf == TRUE) {
      if(language == 'DE') {
        pdf("Dichtediagramm.pdf")
      } else {
        pdf("Densityplot.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(density(x))
      } else {
        plot(density(x), main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("plot(density(x))", "\n"))
      }
    } else {
      if(is.null(header)) {
        plot(density(x, y))
      } else {
        plot(density(x, y), main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("plot(density(x, y))", "\n"))
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
        cat(paste0("heatmap(x)", "\n"))
      }
    } else {
      if(is.null(header)) {
        heatmap(cbind(x, y))
      } else {
        heatmap(cbind(x, y), main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("heatmap(cbind(x, y))", "\n"))
      }
    }
  }
  if(plot_type == 'HI' | plot_type == 'Hi' | plot_type == 'hi') {
    if(pdf == TRUE) {
      if(language == 'DE') {
        pdf("Histogramm.pdf")
      } else {
        pdf("Histogram.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        hist(x)
      } else {
        hist(x, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("hist(x)", "\n"))
      }
    } else {
      if(is.null(header)) {
        hist(x, y)
      } else {
        hist(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("hist(x, y)", "\n"))
      }
    }
  }
  if(plot_type == 'L' | plot_type == 'l') {
    if(pdf == TRUE) {
      if(language == 'DE') {
        pdf("Liniendiagramm.pdf")
      } else {
        pdf("Lineplot.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(x, type = "l")
      } else {
        plot(x, type = "l", main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("plot(x, type = 'l')", "\n"))
      }
    } else {
      if(is.null(header)) {
        plot(x, y, type = "l")
      } else {
        plot(x, y, type = "l", main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("plot(x, y, type = 'l')", "\n"))
      }
    }
  }
  if(plot_type == 'P' | plot_type == 'p') {
    if(pdf == TRUE) {
      if(language == 'DE') {
        pdf("Paar-Diagramm.pdf")
      } else {
        pdf("Pairplot.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        pairs(data.frame(x))
      } else {
        pairs(data.frame(x), line.main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("pairs(data.frame(x))", "\n"))
      }
    } else {
      if(is.null(header)) {
        pairs(data.frame(x, y))
      } else {
        pairs(data.frame(x, y), line.main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("pairs(data.frame(x, y))", "\n"))
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
        cat(paste0("qqplot(x)", "\n"))
      }
    } else {
      if(is.null(header)) {
        qqplot(x, y)
      } else {
        qqplot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("qqplot(x, y)", "\n"))
      }
    }
  }
  if(plot_type == 'S' | plot_type == 's') {
    if(pdf == TRUE) {
      if(language == 'DE') {
        pdf("Streudiagramm.pdf")
      } else {
        pdf("Scatterplot.pdf")
      }
    }
    if(is.null(y)) {
      if(is.null(header)) {
        plot(x)
      } else {
        plot(x, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("plot(x)", "\n"))
      }
    } else {
      if(is.null(header)) {
        plot(x, y)
      } else {
        plot(x, y, main = header)
      }
      if(verbose == TRUE) {
        cat(paste0("plot(x, y)", "\n"))
      }
    }
  }
  if(plot_type == 'V' | plot_type == 'v') {
    if(pdf == TRUE) {
      if(language == 'DE') {
        pdf("Venndiagramm.pdf")
      } else {
        pdf("Venndiagram.pdf")
      }
    }
    library("VennDiagram")
    plot.new()
    if(is.null(y)) {
      draw.single.venn(area = 10)
      if(verbose == TRUE) {
        cat(paste0("draw.single.venn(area = 10)", "\n"))
      }
    } else {
      draw.pairwise.venn(area1 = 10,
                         area2 = 20,
                         cross.area = 2)
      if(verbose == TRUE) {
        cat(paste0("draw.pairwise.venn(area1 = 10, area2 = 20, cross.area = 2)", "\n"))
      }
    }
  }
  # should the regression line be printed?
  if(!is.null(y)) {
    if(is.null(regline)) {
      user_inputrl <- ""
      while (user_inputrl == "") {
        user_text <- "Soll eine Regressionsgrade gezeichnet werden ('TRUE' oder 'FALSE')?"
        if(!language == 'DE') {
          user_text <- as.character(py_deepl(user_text, language))
        }
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
      cat(paste0("abline(lm(y ~ x), col = 'red'", "\n"))
    }
    user_inputcoe <- ""
    while (user_inputcoe == "") {
      user_text <- "Soll der p-Wert und Korrelationskoeffizent berechnet werden ('TRUE' oder 'FALSE')?"
      if(!language == 'DE') {
        user_text <- as.character(py_deepl(user_text, language))
      }
      user_inputcoe <- readline(prompt = paste0(user_text, " "))

      if(user_inputcoe == "" | user_inputcoe == "FALSE" | user_inputcoe == "False" | user_inputcoe == "false" | user_inputcoe == "F"| user_inputcoe == "f") {
        user_inputcoe <- FALSE
      } else {
        user_inputcoe <- TRUE
        print(cor.test(x, y, method = "spearman", exact = FALSE))
        if(verbose == TRUE) {
          cat(paste0("cor.test(x, y, method = 'spearman')", "\n"))
        }
      }
    }
  }
  # End pdf printing if it was activated
  if(pdf == TRUE) { dev.off() }

  ## Close function
  if(verbose == TRUE) {
    user_text <- "Erledigt."
    if(!language == 'DE') {
      user_text <- as.character(py_deepl(user_text, language))
    }
    return(cat(paste0(user_text, "\n")))
  }
}
