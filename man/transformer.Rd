\name{transformer}
\alias{transformer}
\title{Transforms values}
\description{
\sQuote{transformer} converts values of type char to numeric, e.g. 'female' to '1' and 'male' to '2'.
}
\usage{
transformer(x, ...)
}
\arguments{
\tabular{rll}{
\tab \code{x} \tab vector which contains the values of type char.\cr\cr
\tab \code{...} \tab further arguments passed to or from other methods.\cr\cr
\tab \code{verbose} \tab logical, indicating whether or not transformation details should be printed in console.
}
}
\examples{
library(ourdata)
library(pradadata)

# converts a vector
trans_data <- transformer(subset(dating, select = comm_type))

## With verbose output
trans_data <- transformer(dating$comm_type, verbose = TRUE)
}
