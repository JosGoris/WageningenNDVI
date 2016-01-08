#Hakken en Zagen
#8 Januari 2016
#Mark ten Vregelaar, Jos Goris

#Import packages
library(raster)
library(rgdal)

#Import the functions
source('CalcNDVI.R')
source('ValueReplacement.R')

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



