# R/plotter.R
# function plotter' for plotting data with a menu to choose different plotting types
# e.g. 'plot' for a Scatter plot

plotter <- function(x = NULL, y = NULL, plot_type = NULL, header = NULL, regline = NULL, language = NULL, pdf = NULL, verbose = NULL) {

  ## User input
  # Checking Language
  if(is.null(language)) {
    cat("'BG' Bulgarian, 'CS' - Czech, 'DA' - Danish, 'DE' - German, 'EL' - Greek, 'EN' - English, 'ES' - Spanish, 'ET' - Estonia, 'FI' - Finnish, 'FR' - French, 'HU' - Hungarian, 'IT' - Italian, 'JA' - Japanese, 'LT' - Lithuanian, 'LV' - Latvian, 'NL' - Dutch, 'PL' - Polish, 'PT' - Portuguese, 'RO' - Romanian, 'RU' - Russian, 'SK' - Slovak, 'SL' - Slovenian, 'SV' - Swedish or 'ZH' - Chinese)? ")
    user_inputl <- readline(prompt = "Which language? ")
    if(user_inputl == "BG" | user_inputl == "CS" | user_inputl == "DA" | user_inputl == "DE" | user_inputl == "EL" | user_inputl == "EN" | user_inputl == "ES" | user_inputl == "ET" | user_inputl == "FI" | user_inputl == "FR" | user_inputl == "HU" | user_inputl == "IT" | user_inputl == "JA" | user_inputl == "LT" | user_inputl == "LV" | user_inputl == "NL" | user_inputl == "PL" | user_inputl == "PT" | user_inputl == "RO" | user_inputl == "RU" | user_inputl == "SK" | user_inputl == "SL" | user_inputl == "SV" | user_inputl == "ZH") {
      # all fine, nothing to do!
    } else {
      user_inputl <- "EN"
    }
    language <- user_inputl
  } else {
    if(!user_inputl == "BG" & !user_inputl == "CS" & !user_inputl == "DA" & !user_inputl == "DE" & !user_inputl == "EL" & !user_inputl == "EN" & !user_inputl == "ES" & !user_inputl == "ET" & !user_inputl == "FI" & !user_inputl == "FR" & !user_inputl == "HU" & !user_inputl == "IT" & !user_inputl == "JA" & !user_inputl == "LT" & !user_inputl == "LV" & !user_inputl == "NL" & !user_inputl == "PL" & !user_inputl == "PT" & !user_inputl == "RO" & !user_inputl == "RU" & !user_inputl == "SK" & !user_inputl == "SL" & !user_inputl == "SV" & !user_inputl == "ZH") {
      language <- "EN"
    }
  }

  # PDF Export
  if(is.null(pdf)) {
    user_text <- "PDF Export - wenn keine Grafikausgabe möglich! ('TRUE' oder 'FALSE')?"
    if(!language == 'DE') {
      user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
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
        user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
      }
      user_inputx <- readline(prompt = paste0(user_text, " "))
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
      user_text <- "Sind noch mehr Daten ('y') einzubeziehen (<Enter> drücken für 'FALSE')?"
      if(!language == 'DE') {
        user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
      }
      user_inputy <- readline(prompt = paste0(user_text, " "))
      if(user_inputy == "" | user_inputy == "FALSE" | user_inputy == "False" | user_inputy == "false"| user_inputy == "f" | user_inputy == "F") {
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
        user_text <- "'Ba' - Balkendiagramm, 'Bo' - Box-Diagramm, 'D' - Dichtediagramm, 'Hi' - Histogramm, 'L' - Linien-Diagramm, 'S' - Streudiagramm oder 'V' - Venn-Diagramm?"
        if(!language == 'DE') {
          user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
        }
      } else {
        user_text <- "'Ba' - Balkendiagramm, 'Bo' - Box-Plot, 'He' - Heatmap, 'P' - Paar-Diagramm, 'Q' - Qqplot, 'S' - Streudiagramm oder 'V' - Venn-Diagramm?"
        if(!language == 'DE') {
          user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
        }
      }
      cat(user_text)
      if(!language == 'DE') {
        user_text <- translate_func_inside_plotter(dataset = "Welcher Diagramm Typ soll verwendet werden?", target.lang = language)
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
        user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
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
      pdf("Heatmap.pdf")
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
      pdf("Qqplot.pdf")
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
        user_text <- "Soll eine Regressionsgrade gezeichnet werden ('TRUE' oder 'FALSE')?"
        if(!language == 'DE') {
          user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
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
    user_inputcoe <- ""
    while (user_inputcoe == "") {
      user_text <- "Soll der p-Wert und Korrelationskoeffizent berechnet werden ('TRUE' oder 'FALSE')?"
      if(!language == 'DE') {
        user_text <- translate_func_inside_plotter(dataset = user_text, target.lang = language)
      }
      user_inputcoe <- readline(prompt = paste0(user_text, " "))

      if(user_inputcoe == "" | user_inputcoe == "FALSE" | user_inputcoe == "False" | user_inputcoe == "false" | user_inputcoe == "F"| user_inputcoe == "f") {
        user_inputcoe <- FALSE
      } else {
        user_inputcoe <- TRUE
        print(cor.test(x, y, method="spearman", exact=FALSE))
      }
    }
  }
  # End pdf printing if it was activated
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

translate_func_inside_plotter <- function(dataset = NULL,
                      target.lang = "EN"
                      )
{
  responses <- NULL
  source_lang <- NULL
  text <- stringr::str_replace(gsub("\\s+", "%20", stringr::str_trim(dataset)), "B", "b")
  url <- "https://api-free.deepl.com/v2/translate?"
  auth_key <- "c52a9c7d-3198-063c-2bbf-8f67173820ce:fx"
  urlx <- paste0(url,
                "auth_key=", auth_key,
                "&text=", text,
                "&target_lang=", target.lang
                )
  response <- httr::GET(urlx)
  respcontent <- httr::content(response, as = "text", encoding = "UTF-8")
  result <- jsonlite::fromJSON(respcontent)$translations$text
  responses <- c(responses, result)
  source.lang <- jsonlite::fromJSON(respcontent)$translations$detected_source_language
  source_lang <- c(source_lang, source.lang)
  return(responses)
}
