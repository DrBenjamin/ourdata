## ourdata
Functions and data frames used in Data Science courses at the Fresenius University of Applied Sciences (2025).


## Contents
Data frames contains data:

- 'fragebogen' Head circumference and other characteristics from student surveys
- 'hdi' Human development index world wide
- 'imr' Infant mortality rates worldwide
- 'kirche' Church exits in Germany from 2017 to 2020
- 'koelsch' Colgone brewed beer (Koelsch) consumption from 2017 to 2020

Note that some of these data sets were not published by the author of this package. The original authors can be found in the description of each data set.

Functions:
- 'combine(x, y, ...)' Combines two data sets using id and foreign key matching.
- 'ourdata()' Prints out a welcome message.
- 'plotter(...)' Plots the data in different plots.
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
