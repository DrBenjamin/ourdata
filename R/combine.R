# combine function
# combines two data frames (numeric values) using id and foreign_key for matching

combine <- function(id, foreign_key, list1, list2, col1 = "C1", col2 = "C2", col3 = "C3") {
  # Two For-Loops for matchting two lists
  com_data <- data.frame(col1 = character(),
                         col2 = numeric(),
                         col3 = numeric(),
                         stringsAsFactors = FALSE)
  for (i in 1:length(id)) {
    for (ii in 1:length(foreign_key)) {
      if(id[i] == foreign_key[ii]) {
        com_data <- rbind.data.frame(com_data, data.frame(as.character(id[i]), as.numeric(list1[i]), as.numeric(list2[ii]), stringsAsFactors = FALSE), stringsAsFactors = FALSE)
      }
    }
  }
  colnames(com_data) <- c(col1, col2, col3)
  str(com_data)
  return(com_data)
}
