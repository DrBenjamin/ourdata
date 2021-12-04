\name{tminer}
\alias{tminer}
\title{Text mining}
\description{
\sQuote{tminer} is a text miner.
}
\usage{
tminer(x, ...)
}
\arguments{
\tabular{rll}{
\tab \code{x} \tab text data which should be analysed.\cr\cr
\tab \code{...} \tab further arguments passed to or from other methods.\cr\cr
\tab \code{translate} \tab text will be passed to deepl and translated to given language e.g. "EN" for English.
}
}
\examples{
library(ourdata)

# Text will be translated to English
tminer(x, translate = "EN")
}
