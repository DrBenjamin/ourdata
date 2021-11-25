# combine function
# combines two data sets using id and foreign key matching

combine <- function(id, foreign_key, list1, list2, col1 = "C1", col2 = "C2", col3 = "C3") {
  # Two For-Loops for matchting two lists
  com_data <- data.frame(col1 = character(),
                         col2 = character(),
                         col3 = character(),
                         stringsAsFactors = FALSE)
  print(str(com_data))
  for (i in 1:length(id)) {
    #print(paste0("Left list: ", id[i], " | position ", i))
    for (ii in 1:length(foreign_key)) {
      if(id[i] == foreign_key[ii]) {
        #print(paste0("Right list: ", freign_key[ii], " | position = ", ii))
        com_data <- rbind(com_data, c(id[i], list1[i], list2[ii]))
      }
    }
  }
  colnames(com_data) <- c(col1, col2, col3)
  print(str(com_data))
  return(com_data)
}
