\name{imr}
\alias{imr}
\title{Infant mortality rates for 2024}
\description{
Data frame contains infant mortality rates from 2024 for various countries worldwide. Infant mortality rate is defined as the number of deaths of infants under one year old per 1,000 live births in a given year.
}
\usage{
imr
}
\format{
  A data frame with 228 observations on the following 6 variables:
  \describe{
    \item{\code{name}}{Country name}
    \item{\code{slug}}{URL-friendly country identifier (lowercase with hyphens)}
    \item{\code{deaths/1,000 live births}}{Infant mortality rate: number of deaths per 1,000 live births (numeric)}
    \item{\code{date_of_information}}{Year of the data (typically "2024")}
    \item{\code{ranking}}{Global ranking by infant mortality rate (1 = highest mortality)}
    \item{\code{region}}{Geographic region (e.g., "Africa", "South Asia", "Europe")}
  }
}
\source{
The data was downloaded from: \url{https://www.cia.gov/the-world-factbook/field/infant-mortality-rate/country-comparison}
}
\examples{
library(ourdata)

print(imr)
}
