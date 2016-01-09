#Hakken en Zagen
#8 Januari 2016
#Mark ten Vregelaar, Jos Goris

#Import packages
library(raster)
library(rgdal)

#Import the functions
source('R/CalcNDVI.R')
source('R/ValueReplacement.R')

#Download the data
download.file(url='https://www.dropbox.com/s/i1ylsft80ox6a32/LC81970242014109-SC20141230042441.tar.gz?dl=0', destfile='./data/LandsatNDVI1.tar.gz', method='wget')
download.file(url='https://www.dropbox.com/s/akb9oyye3ee92h3/LT51980241990098-SC20150107121947.tar.gz?dl=0', destfile='./data/LandsatNDVI2.tar.gz', method='wget')

#Extract files
untar('./data/LandsatNDVI1.tar.gz', exdir = './data')
untar('./data/LandsatNDVI2.tar.gz', exdir = './data')

#List landsat 5 and landsat 8
landsat5list <- list.files('data/', pattern = glob2rx('LT5*.tif'), full.names = TRUE)
landsat8list <- list.files('data/', pattern = glob2rx('LC8*.tif'), full.names = TRUE)
  
#Stack the layers
landsat5 <- stack(landsat5list)
landsat8 <- stack(landsat8list)

#Extract cloud layers from the stack
fmask5 <- landsat5[[1]]
fmask8 <- landsat8[[1]]

#Remove layer from stack
landsat5_2 <- dropLayer(landsat5,1)
landsat8_2 <- dropLayer(landsat8,1)

#Replace values
landsat5cloudf <- overlay(x = landsat5_2, y = fmask5, fun = cloud2NA)
landsat8cloudf <- overlay(x = landsat8_2, y = fmask8, fun = cloud2NA)

#Calculate NDVI 
ndvi5 <- overlay(x=landsat5cloudf[[6]], y=landsat5cloudf[[7]], fun=ndvOver)
ndvi8 <- overlay(x=landsat8cloudf[[4]], y=landsat8cloudf[[5]], fun=ndvOver)

#subtract the images
diffNDVI <- ndvi5-ndvi8

#plot the result
plot(diffNDVI)


