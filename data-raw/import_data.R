# data-raw/import_data.R
# Data import and processing pipeline

#library(readr)
#library(readxl)

imr <- read.csv("data-raw/IMR.csv")
hdi <- read.csv("data-raw/HDI.csv")
koelsch <- read.csv("data-raw/Koelsch.csv")
kirche <- read.csv("data-raw/Kirche.csv")
fragebogen <- read.csv("data-raw/Fragebogen.csv")

# Data cleaning code here...
# (Do NOT put data analysis code here!)

# This should be the last line.
# Note that names are unquoted.
# I like using overwrite = T so everytime I run the script the
# updated objects are saved, but the default is overwrite = F
usethis::use_data(imr, hdi, koelsch, kirche, fragebogen, overwrite = TRUE)
