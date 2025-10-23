\name{fragebogen}
\alias{fragebogen}
\title{Data from student surveys, contains the head circumference and other features!}
\description{
Data frame with the head circumference and other features, containing\cr\cr
- \sQuote{alter} Age -> num 16 - 99 (years)\cr\cr
- \sQuote{geschlecht} Sex -> num 1 (female), 2 (male), 3 (divers)\cr\cr
- \sQuote{note_mathe} Last math grade -> num 1 - 6 (German grading system)\cr\cr
- \sQuote{note_annahme} Expected grade in Data Science courses -> num 1 - 6 (German grading system)\cr\cr
- \sQuote{kopf} head circumference -> num 40 - 70 (cm)\cr\cr
- \sQuote{angst} Fear of the course -> num 1 - 6 (1 high, 6 low)\cr\cr
- \sQuote{interesse} Interest in the topic -> num 1 - 6 (1 high, 6 low)\cr\cr
- \sQuote{praxis} Desired practical part in the lectures -> num 10 - 90 (percent)\cr\cr
}
\usage{
fragebogen
}
\source{
The data was self generated from a survey in Data Science courses at the Fresenius University of Applied Sciences (5th semester, 2021).
}
\examples{
library(ourdata)

print(fragebogen)
}
