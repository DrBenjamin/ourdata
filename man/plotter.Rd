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
\tab \code{plot_type} \tab choose a plotting type.\cr
\tab \tab \code{Ba} for a (Ba)arplot.\cr
\tab \tab \code{Bo} for a (Bo)xplot.\cr
\tab \tab \code{D} for a (D)ensity Plot.\cr
\tab \tab \code{He} for a (He)atmap.\cr
\tab \tab \code{Hi} for a (Hi)stogram.\cr
\tab \tab \code{L} for a (L)ine Plot.\cr
\tab \tab \code{P} for a (P)airs Plot.\cr
\tab \tab \code{Q} for a (Q)qplot Plot.\cr
\tab \tab \code{S} for a (S)catter Plot.\cr
\tab \tab \code{V} for a (V)enn Diagram.\cr\cr
\tab \code{header} \tab choose a header for the plott.\cr\cr
\tab \code{regline} \tab logical, a regression line will be printed.\cr\cr
\tab \code{pdf} \tab logical, indicating whether or not output of plots should be exported to a PDF file (on devices without a graphical interface like an iPad.\cr\cr
\tab \code{verbose} \tab logical, indicating whether or not plotting details should be printed in console.
}
}
\examples{
library(ourdata)

# It will ask you for all data and information
plotter()

## With x data
plotter(subset(fragebogen$alter)

### With x & y data, plot_type, header, regline and verbose option set
plotter(subset(fragebogen, select = alter), subset(fragebogen, select = kopf), plot_type = "S", header = "Alter bestimmt den Kopfumfang", regline = TRUE, verbose = TRUE)
}
