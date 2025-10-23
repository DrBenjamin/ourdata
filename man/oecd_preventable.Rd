\name{oecd_preventable}
\alias{oecd_preventable}
\docType{data}
\title{
OECD Preventable Mortality Data
}
\description{
This dataset contains preventable mortality statistics from OECD countries. Preventable mortality refers to deaths that could potentially be avoided through effective public health and primary prevention interventions. The data includes standardized death rates per 100,000 inhabitants across different countries and time periods from 2010 onwards.
}
\usage{data("oecd_preventable")}
\format{
  A data frame with 1164 observations on the following 30 variables:
  \describe{
    \item{\code{STRUCTURE}}{Data structure identifier}
    \item{\code{STRUCTURE_ID}}{Structure ID code}
    \item{\code{STRUCTURE_NAME}}{Name of data structure}
    \item{\code{ACTION}}{Action indicator}
    \item{\code{REF_AREA}}{Reference area code (country code)}
    \item{\code{Reference.area}}{Full country name}
    \item{\code{FREQ}}{Frequency code}
    \item{\code{Frequency.of.observation}}{Frequency description (Annual)}
    \item{\code{MEASURE}}{Measure code (PREVM - Preventable mortality)}
    \item{\code{Measure}}{Measure description}
    \item{\code{UNIT_MEASURE}}{Unit of measure code}
    \item{\code{Unit.of.measure}}{Deaths per 100,000 inhabitants}
    \item{\code{AGE}}{Age group code}
    \item{\code{Age}}{Age group description}
    \item{\code{SEX}}{Sex code}
    \item{\code{Sex}}{Sex description}
    \item{\code{SOCIO_ECON_STATUS}}{Socio-economic status code}
    \item{\code{Socio.economic.status}}{Socio-economic status description}
    \item{\code{DEATH_CAUSE}}{Cause of death code}
    \item{\code{Cause.of.death}}{Cause of death description}
    \item{\code{CALC_METHODOLOGY}}{Calculation methodology (STANDARD - Standardised rate)}
    \item{\code{Calculation.methodology}}{Methodology description}
    \item{\code{TIME_PERIOD}}{Year of observation}
    \item{\code{OBS_VALUE}}{Observation value (death rate)}
    \item{\code{DECIMALS}}{Number of decimal places}
    \item{\code{OBS_STATUS}}{Observation status}
    \item{\code{OBS_STATUS2}}{Observation status 2}
    \item{\code{OBS_STATUS3}}{Observation status 3}
    \item{\code{UNIT_MULT}}{Unit multiplier}
    \item{\code{...}}{Additional metadata fields}
  }
}
\details{
The data represents age-standardized preventable mortality rates, allowing for comparison across countries and over time. Preventable deaths are those that can be mainly avoided through effective public health interventions and primary prevention, such as deaths from certain cancers, cardiovascular diseases, and accidents.

The standardization allows for fair comparison between countries with different age structures. Values represent deaths per 100,000 inhabitants.
}
\source{
OECD Health Statistics
\url{https://www.oecd.org/health/health-data.htm}
}
\references{
OECD (2024), "Avoidable mortality", OECD Health Statistics (database), \url{https://doi.org/10.1787/data-00352-en}
}
\examples{
data(oecd_preventable)

# View structure of the dataset
str(oecd_preventable)

# Summary statistics
summary(oecd_preventable$OBS_VALUE)

# Countries included in the dataset
unique(oecd_preventable$Reference.area)

# Time period covered
range(oecd_preventable$TIME_PERIOD, na.rm = TRUE)

# Plot preventable mortality trends for selected countries
library(ggplot2)
countries <- c("Australia", "Austria", "Belgium", "Canada")
subset_data <- oecd_preventable[oecd_preventable$Reference.area \%in\% countries, ]

ggplot(subset_data, aes(x = TIME_PERIOD, y = OBS_VALUE, color = Reference.area)) +
  geom_line() +
  labs(title = "Preventable Mortality Trends",
       x = "Year",
       y = "Deaths per 100,000 inhabitants",
       color = "Country") +
  theme_minimal()
}
\keyword{datasets}
