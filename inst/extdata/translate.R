## inst/extdata/translate.R
## Function 'translate' for translating text using deepl (www.deepl.com)

# Funktionsname und Parameter
translate <- function(text = NULL,
                      target_lang = "EN"
                      )
{
    # Variable 'responses' leeren
    responses <- NULL

    # Leerzeichen mit '%20' füllen
    text <- stringr::str_replace(gsub("\\s+", "%20", stringr::str_trim(text)), "B", "b")

    # URL der Deepl API
    url <- "https://api-free.deepl.com/v2/translate?"

    # Auth Key
    auth_key <- "c52a9c7d-3198-063c-2bbf-8f67173820ce:fx"

    # URL mit Parametern zusammensetzen
    urlx <- paste0(url,
                  "auth_key=", auth_key,
                  "&text=", text,
                  "&target_lang=", target_lang
                  )

    # Daten des Deepl Servers erhalten
    response <- httr::GET(urlx)

    # Daten formatieren
    respcontent <- httr::content(response, as = "text", encoding = "UTF-8")

    # Daten im JSON-Format einlesen und in ein R-Objekt überführen
    result <- jsonlite::fromJSON(respcontent)$translations$text
    responses <- c(responses, result)

    # Rückgabe des Wertes an R / RStudio
    return(responses)
}
