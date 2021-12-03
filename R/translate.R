## R/translate.R
## function 'translate' for translating text using deepl

translate <- function(dataset = NULL,
                          source.lang = "DE",
                          target.lang = "EN",
                          add.source.lang = FALSE,
                          auth_key = NULL,
                          url = "https://api.deepl.com/v2/translate?text="
) {



  if(is.null(auth_key)){cat("You need an API key. See https://www.deepl.com/api-contact.html.")}else{


    if(inherits(dataset,"character")==TRUE){
      responses <- NULL
      source_lang <- NULL
      z <- 0
      for(i in dataset){
        svMisc::progress(z, max.value = length(dataset))
        z <- z+1
        i <- stringr::str_replace(gsub("\\s+", "%20", stringr::str_trim(i)), "B", "b")


        # Source language: "detect" vs. "X"
        if(source.lang=="detect"){


          response.i <- httr::GET(paste(url,
                                        i,
                                        "&target_lang=", target.lang,
                                        "&auth_key=", auth_key
                                        , sep = ""))
        }else{
          response.i <- httr::GET(paste(url,
                                        i,
                                        "&source_lang=", source.lang,
                                        "&target_lang=", target.lang,
                                        "&auth_key=", auth_key
                                        , sep = ""))
        }


        respcontent.i <- httr::content(response.i, as="text", encoding = "UTF-8")
        result.i <- jsonlite::fromJSON(respcontent.i)$translations$text
        responses <- c(responses, result.i)


        # Source language: "detect" vs. "X"
        if(source.lang == "detect"){
          source.lang.i <- jsonlite::fromJSON(respcontent.i)$translations$detected_source_language
        }else{
          source.lang.i <- jsonlite::fromJSON(respcontent.i)$translations$detected_source_language
        }
        source_lang <- c(source_lang, source.lang.i)



      }

      # OUPUT

      if(add.source.lang == TRUE){
        return(data.frame(cbind(translation = responses, source_lang)))
      }else{
        return(responses)
      }




    }else{
      cat("The input is not a character vector of length > 1.")
    }


  } # API KEY

} # End of function
