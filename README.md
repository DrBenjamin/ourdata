## ourdata
Functions and data frames used in Data Science courses at Hochschule Fresenius University of Applied Sciences in Cologne (2025).


## Contents
Data frames contains data:

- 'fragebogen' Head circumference and other characteristics from GD and AVM courses
- 'hdi' Human development index world wide
- 'imr' Infant mortality rates worldwide
- 'kirche' Church exits in Germany from 2017 to 2020
- 'koelsch' Colgone brewed beer (Koelsch) consumption from 2017 to 2020

Notes that some of these data sets were not published by the author of this pacakge. The original authors can be found in the desription of each data set.

Functions:
- 'combine(x, y, ...)' Combines two data sets using id and foreign key matching.
- 'ourdata()' Prints out a welcome message.
- 'plotter(...)' Plotts the data in different plotts.
- 'transformer(x, ...)' Transforms char type values in numeric values.


## Installation
`devtools::install_github("DrBenjamin/ourdata")`


## Getting started
In R (or RStudio) type
`library("ourdata")`

`ourdata()`


## Get help
`help("ourdata")`


## Requirements
R
