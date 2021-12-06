## inst/extdata/example.R
## Beispiel Code zum Veranschaulichen der externen Code-Ausführung in R-Markdown

## @knitr variablesXY

# x Werte von 1 und 100 zuweisen
x <- 1:100
# y 100 Werte zuweisen mit x + Zufallszahl (-5 bis +5)
y <- x + rnorm(100, sd = 5)
# Gibt den ersten oder letzten Teil eines Vektors, einer Matrix oder einer Tabelle zurück
head(data.frame(x, y))

## @knitr plotXY

plot(x, y)
