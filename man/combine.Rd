\name{combine}
\alias{combine}
\title{Combines two Lists}
\description{
\sQuote{combine} combines two data frames. In each data frame must be an equal (matchable) identifier.
}
\usage{
combine(id, foreign_key, list1, list2, ...)
}
\arguments{
\tabular{rll}{
\tab \code{id} \tab matching point of the left list.\cr\cr
\tab \code{foreign_key} \tab matching point of the right list.\cr\cr
\tab \code{list1} \tab values of the left list.\cr\cr
\tab \code{list2} \tab values of the right list.\cr\cr
\tab \code{...} \tab further arguments passed to or from other methods.\cr\cr
\tab \code{col1} \tab a name of the id column / variable.\cr\cr
\tab \code{col2} \tab a name of the list1 column / variable.\cr\cr
\tab \code{col3} \tab a name of the list1 column / variable.
}
}
\examples{
combined_list <- combine(imr$name, hdi$country, imr$value, hdi$hdi)

## With column names spezified
combined_list <- combine(imr$name, hdi$country, imr$value, hdi$hdi, col1 = "Country", col2 = "IMR", col3 = "HDI")
}
