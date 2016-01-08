#Hakken en Zagen
#8 Januari 2016
#Mark ten Vregelaar, Jos Goris

#Function to replace values
cloud2NA <- function(x, y){
  x[y != 0] <- NA
  return(x)
}