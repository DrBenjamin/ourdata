# R/transformer.R
# function transformer converts values of type char to a numeric style
# e.g. "female" to 1

transformer <- function(x, verbose = FALSE) {
  transformed_data <- data.frame(col = numeric(), stringsAsFactors = FALSE)
  i <- 0
  ii <- 0
  for (vItem in x) {
    print(paste0("vItem: ", vItem))
    if(vItem == "female") {
      i <- i + 1
      transformed_data <- rbind.data.frame(transformed_data, as.numeric("1"), stringsAsFactors = FALSE)
    }
    if(vItem == "male") {
      ii <- ii + 1
      transformed_data <- rbind.data.frame(transformed_data, as.numeric("2"), stringsAsFactors = FALSE)
    }
  }
  if(verbose == TRUE) {
    print(paste0("female: ", i))
    print(paste0("male: ", ii))
  }
  return(transformed_data)
}
