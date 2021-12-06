# Komplexere R Skript (Programmierung)

# Einfacher Vektor, die Funktion c kombiniert Werte in einen Vektor oder eine Liste
fruitVec <- c("Apfel", "Banane", "Orange", "Birne") # fruitVec wird mit 4 Werten (Strings) gefüllt

# Einfache While-Schleife
# Funktion length: gibt die Länge eines/r Vektors / Liste aus
# Der Vektor fruitVec kann wie ein Array angesprochen werden, um die einzelnen Werte auszulesen
pos <- 1
while (pos <= length(fruitVec)) {
  print(paste0("Die Frucht Nr.", pos, " ist : ", fruitVec[pos]))
  pos <- pos + 1
}

# Einfache For-Schleife
# Funktion paste0 verbindet Strings
# Funktion which ermittelt die Position eines Wertes im Vektor (bzw. Array)
help(which)
for (fruit in fruitVec) {
  print(paste0("Die Frucht Nr.", which(fruit == fruitVec), " ist: ", fruit))
}
