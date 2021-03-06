# R/transformer.R
# function transformer converts values of type char to a numeric style
# e.g. "female" to 1 and "male" to 2

transformer <- function(x, verbose = FALSE) {
  trans_data <- c(as.numeric())
  x_name <- names(x)
  x <- as.vector(unlist(x))

  # Search for different values which should be transformed
  counterValues <- 1
  charValues <- c("")
  counterBool <- TRUE
  for (c in 1:length(x)) {
    for (cc in 1:counterValues) {
      if(x[c] == charValues[cc]) {
        counterBool = FALSE
      }
    }
    if(counterBool == TRUE) {
      if(c > 1) { counterValues <- counterValues + 1 }
      if(counterValues > 1) { charValues <- c(charValues, "") }
      charValues[counterValues] = x[c]
    }
    counterBool <- TRUE
  }

  counterUniques <- c(as.numeric(0))
  for (vItem in x) {
    for (c in 1:counterValues) {
      if(vItem == charValues[c]) {
        counterUniques[c] <- counterUniques[c] + 1
        trans_data <- c(as.vector(unlist(trans_data)), as.numeric(c))
      }
      counterUniques <- c(counterUniques, as.numeric(0))
    }
  }
  if(verbose == TRUE) {
    print(paste0(length(x), " values in vector '", x_name, "'."))
    print(paste0("Count of unique (different) values: ", counterValues))
    for(c in 1:counterValues)
      print(paste0("Unique vaulue '", charValues[c], "' was converted to '", c, "' with ", counterUniques[c], " hits."))
  }
  return(trans_data)
}
