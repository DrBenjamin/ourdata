\name{plotter}
\alias{plotter}
\title{Plotting data}
\description{
\sQuote{plotter} is plotting data with a menu to choose different plotting types.
}
\usage{
plotter(...)
}
\arguments{
\tabular{rll}{
\tab \code{no args} \tab without any arguments, \sQuote{plotter} will take you through a menu to find out what you want and with which data it should be done.\cr\cr
\tab \code{...} \tab further arguments passed to or from other methods.\cr\cr
\tab \code{x} \tab data which should be used.\cr\cr
\tab \code{y} \tab more data e.g. for correlation analysis.\cr\cr
\tab \code{plot_type} \tab chose a plotting type.\cr
\tab \tab \code{B} for a (B)arplot.\cr
\tab \tab \code{D} for a (D)ensity plot.\cr
\tab \tab \code{S} for a (S)catter plot.\cr\cr
\tab \code{language} \tab \sQuote{ger} for German, \sQuote{eng} for English.\cr\cr
\tab \code{verbose} \tab logical, indicating whether or not output details should be printed in console.
}
}
\examples{
library(ourdata)

# it will ask you for all data and information
plotter()

## With x data
plotter(subset(fragebogen$alter)

### With x & y data, language and verbose option set
plotter(subset(fragebogen, select = alter), subset(fragebogen, select = kopf), plot_type = "S", language = "ger", verbose = TRUE)
}
