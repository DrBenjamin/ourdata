## R/translate.R
## function 'translate' for translating text using deepl (www.deepl.com)

translate <- function(text = NULL,
                      target_lang = "EN"
                      )
{
    responses <- NULL

    text <- stringr::str_replace(gsub("\\s+", "%20", stringr::str_trim(text)), "B", "b")
    url <- "https://api-free.deepl.com/v2/translate?"
    auth_key <- "c52a9c7d-3198-063c-2bbf-8f67173820ce:fx"
    urlx <- paste0(url,
                  "auth_key=", auth_key,
                  "&text=", text,
                  "&target_lang=", target_lang
                  )
    response <- httr::GET(urlx)
    respcontent <- httr::content(response, as = "text", encoding = "UTF-8")
    result <- jsonlite::fromJSON(respcontent)$translations$text
    responses <- c(responses, result)

    return(responses)
}
