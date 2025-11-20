\name{hdi}
\alias{hdi}
\title{Human development index for 2024}
\description{
Data frame contains human development indexes from 2024 for various countries worldwide. The Human Development Index (HDI) is a composite statistic of life expectancy, education, and per capita income indicators, which are used to rank countries into four tiers of human development.
}
\usage{
hdi
}
\format{
  A data frame with 194 observations on the following 4 variables:
  \describe{
    \item{\code{flagCode}}{Two-letter country code (ISO 3166-1 alpha-2)}
    \item{\code{country}}{Country name}
    \item{\code{HumanDevelopmentIndex_2024}}{Human Development Index value for 2024 (numeric, range 0-1)}
    \item{\code{HumanDevelopmentIndex_HDITierCurrent_txt_YearFree}}{HDI tier classification ("Very High", "High", "Medium", "Low")}
  }
}
\source{
The data was downloaded from: \url{https://worldpopulationreview.com/country-rankings/hdi-by-country}
}
\examples{
library(ourdata)

print(hdi)
}
