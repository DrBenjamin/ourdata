\name{plotter}
\alias{plotter}
\title{Plotting data}
\description{
\sQuote{plotter} plotting data with a menu to choose different plotting types.
}
\usage{
plotter(x, y, ...)
}
\arguments{
\tabular{rll}{
\tab \code{x} \tab data which should be used.\cr\cr
\tab \code{...} \tab further arguments passed to or from other methods.\cr\cr
\tab \code{y} \tab more data for correlation analysis.\cr\cr
\tab \code{verbose} \tab logical, indicating whether or not output details should be printed in console.
}
}
\examples{
library(pradadata)
plotter(subset(dating, select = comm_type))

## With verbose output
plotter(dating$comm_type, verbose = TRUE)
}
