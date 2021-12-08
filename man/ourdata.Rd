\name{ourdata}
\alias{ourdata}
\title{Data frames and functions}
\description{
Data frames and functions of the Technical Applications & Data Analytics course. See \url{system.file("rmd", "ourdata.html", package = "ourdata")} for more information and visualisation!. The dataof this package contains:\cr\cr
- \sQuote{fragebogen} Head circumference and other featrues of the GD und AVM courses\cr\cr
- \sQuote{hdi} Human development index\cr\cr
- \sQuote{imr} Infant mortality rates\cr\cr
- \sQuote{kirche} Church exits in Germany from 2017 to 2020\cr\cr
- \sQuote{koelsch} Colgone brewed beer (Koelsch) consumption from 2017 to 2020\cr\cr\cr
These functions are included:\cr\cr
- \sQuote{combine(id, foreign_key, list1, list2, ...)} Combines two data frames.\cr\cr
- \sQuote{ourddata()} Prints a welcome message.\cr\cr
- \sQuote{plotter(...)} Plotting data with a menu to choose different plotting types.\cr\cr
- \sQuote{tminer(x, ...)} A simple text miner.\cr\cr
- \sQuote{transformer(x, ...)} Transforms char type values in numeric values.\cr\cr
- \sQuote{translate(x, target_lang)} Plotting data with a menu to choose different plotting types.\cr\cr
}
\usage{
help(ourdata)
}
\examples{
library(ourdata)

# Data frames
print(fragebogen)
print(hdi)
print(imr)
print(kirche)
print(koelsch)

## Functions
help(combine)
help(plotter)
help(tminer)
help(transformer)
help(translate)
}
