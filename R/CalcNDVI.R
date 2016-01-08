#Hakken en Zagen
#8 Januari 2016
#Mark ten Vregelaar, Jos Goris

#Function to calculate the NDVI
ndvOver <- function(x, y) {
  ndvi <- (y - x) / (x + y)
  return(ndvi)
}