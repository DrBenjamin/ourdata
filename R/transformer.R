# R/transformer.R
# function transformer converts values of type char to a numeric style
# e.g. "female" to 1

transformer <- function(x, verbose = FALSE) {
  transformed_data <- data.frame(col = numeric(), stringsAsFactors = FALSE)
  x <- as.vector(unlist(x))

  # Search for different values which should be transformed
  counterValues <- 1
  charValues <- c("", "")
  for (c in 1:length(x)) {
    for (cc in 1:counterValues)
      if(x[c] != charValues[cc]) {
        charValues[counterValues] = x[c]
      }
    counterValues <- length(charValues)
  }

  counterUniques <- c(as.numeric(0), as.numeric(0))
  for (vItem in x) {
    for (c in 1:counterValues) {
      if(vItem == charValues[c]) {
        counterUniques[c] <- counterUniques[c] + 1
        transformed_data <- rbind.data.frame(transformed_data, as.numeric(c), stringsAsFactors = FALSE)
      }
    }
  }
  if(verbose == TRUE) {
    print(paste0(length(x), " values in list."))
    print(paste0("Count of unique values: ", counterValues))
    for(c in 1:counterValues)
      print(paste0("Unique vaulue ", charValues[c]," has ", counterUniques[c]), " hits.")
  }
  return(transformed_data)
}
