# data-raw/ourdata.R
# Data import and processing pipeline

library(readr)
library(readxl)

imr <- read_csv("data-raw/IMR.csv")
hdi <- read_csv("data-raw/HDI.csv")
koelsch <- read_csv("data-raw/Koelsch.csv")
kirche <- read_csv("data-raw/Kirche.csv")
kopfumfang <- read_csv("data-raw/Kopfumfang.csv")

# Data cleaning code here...
# (Do NOT put data analysis code here!)

# This should be the last line.
# Note that names are unquoted.
# I like using overwrite = T so everytime I run the script the
# updated objects are saved, but the default is overwrite = F
usethis::use_data(imr, hdi, koelsch, kirche, kopfumfang, overwrite = TRUE)
