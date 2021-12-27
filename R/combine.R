# R/combine.R
# Roxygen2:
#' conjuncts two data frames
#'
#' `combine` conjuncts two data frames. In each data frame must be an identifier (id and foreign_key) and two lists containing numeric values.
#' @usage
#' combine(id, foreign_key, list1, list2, ...)
#' @param id ID of the left list.
#' @param foreign_key Foreign key of the right list.
#' @param list1 Numeric values of the left list.
#' @param list2 Numeric values of the right list.
#' @param col1 Optionally, a name of id / foreign key column / variable.
#' @param col2 Optionally, a name of list1 column / variable.
#' @param col3 Optionally, a name of the list2 column / variable.
#' @return Conjuncted data frame.
#' @examples
#' library(ourdata)
#'
#' # combines two data frames
#' combined_list <- combine(imr$name, hdi$country, imr$value, hdi$hdi)
#'
#' ## With column names spezified
#' combined_list <- combine(imr$name, hdi$country, imr$value, hdi$hdi, col1 = "Country", col2 = "IMR", col3 = "HDI")

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
