\name{transformer}
\alias{transformer}
\title{Transforms values}
\description{
\sQuote{transformer} converts values of type char to numeric, e.g. "female" to '1'.
}
\usage{
transformer(list, ...)
}
\arguments{
\tabular{rll}{
\tab \code{x} \tab list which contains the values of type char.\cr\cr
\tab \code{...} \tab further arguments passed to or from other methods.\cr\cr
\tab \code{verbose} \tab logical, indicating whether or not transformation details should be printed in console.
}
}
\examples{
library(pradadata)
trans_data <- transformer(subset())

## With verbose output
trans_data <- transformer(dating$comm_type, verbose = TRUE)
}
