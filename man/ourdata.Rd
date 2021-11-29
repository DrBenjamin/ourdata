\name{ourdata}
\alias{ourdata}
\title{Hello Students!}
\description{
Data frames of the Technical Applications & Data Analytics course, containing\cr\cr
- sQuote{imr} Infant mortality rates\cr\cr
- sQuote{hdi} Human development index\cr\cr
- sQuote{koelsch} Colgone brewed beer (Koelsch) consumption from 2017 to 2020\cr\cr
- sQuote{kirche} Church exits in Germany from 2017 to 2020\cr\cr
- sQuote{fragebogen} Head circumference and other featrues of the GD und AVM courses\cr\cr\cr
Functions of the course, containing\cr\cr
- sQuote{ourddata()} Prints a welcome message.\cr\cr
- sQuote{combine(id, foreign_key, list1, list2, ...)} Combines two data frames.\cr\cr
- sQuote{transformer(x, ...)} Transforms char type values in numeric values.
}
\usage{
help(ourdata)
}
\examples{
## Data frames
print(imr)
print(hdi)
print(koelsch)
print(kirche)
print(fragebogen)

## Functions
help(combine)
help(transformer)
}
