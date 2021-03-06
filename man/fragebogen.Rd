\name{fragebogen}
\alias{fragebogen}
\title{Data from a survey of GD and AVM courses, contains the head circumference and other features!}
\description{
Data frame with the head circumference and other features, containing\cr\cr
- \sQuote{alter} Age -> num 16 - 99 (years)\cr\cr
- \sQuote{geschlecht} Sex -> num 1 (female), 2 (male), 3 (divers)\cr\cr
- \sQuote{note_mathe} Last math grade -> num 1 - 6 (German grading system)\cr\cr
- \sQuote{note_annahme} Expected grade in the Technical Applications & Data Analytics course -> num 1 - 6 (German grading system)\cr\cr
- \sQuote{kopf} head circumference -> num 40 - 70 (cm)\cr\cr
- \sQuote{angst} Fear of the course -> num 1 - 6 (1 high, 6 low)\cr\cr
- \sQuote{interesse} Interest in the topic -> num 1 - 6 (1 high, 6 low)\cr\cr
- \sQuote{praxis} Desired practical part in the lectures -> num 10 - 90 (percent)\cr\cr
}
\usage{
fragebogen
}
\source{
The data was self generated from a survey in the course Technical Applications & Data Analytics in the study of Game Design & Management and Audio-Visuelle Medien (5th semester, 2021) at Hochschule Fresenius University of Applied Sciences in Cologne.
}
\examples{
library(ourdata)

print(fragebogen)
}
