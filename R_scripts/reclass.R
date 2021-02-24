##############################################################################
## Reclassifing LULC raster and FAO (reference map) for accuracy
## Author: Tainá Rocha
##############################################################################

############## Reclassificando raster

#Library
library(raster)
library(rJava)
library(rgeos)
library(rgdal)

## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_reclass_2000<-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,1,3,1,3,3,3,4,2,2,2,2,2),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2000 <-raster("./data/Acurracy/LULC_2000_CMPI_accucary_input.tif")
plot(raster_2000)

##Reclassificando o objeto raster

raster_reclass_2000 <-reclassify(x = raster_2000, #objeto raster
                           rcl =matriz_reclass_2000, #matriz criada com os valores de origem e destino
                           filename="2000_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_reclass_2000,"./Results/Accuracy/LULC_2000_CMIP6_reclass.tif")
plot(raster_reclass_2000)



## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_reclass_2005<-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,1,3,1,3,3,3,4,2,2,2,2,2),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2005 <-raster("./data/Acurracy/LULC_2005_CMPI_accucary_input.tif")
plot(raster_2005)

##Reclassificando o objeto raster

raster_reclass_2005 <-reclassify(x = raster_2005, #objeto raster
                                 rcl =matriz_reclass_2005, #matriz criada com os valores de origem e destino
                                 filename="2005_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_reclass_2005,"./Results/Accuracy/LULC_2005_CMIP6_reclass.tif")
plot(raster_reclass_2005)


## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_reclass_2010<-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,1,3,1,3,3,3,4,2,2,2,2,2),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2010 <-raster("./data/Acurracy/LULC_2010_CMPI_accucary_input.tif")
plot(raster_2010)

##Reclassificando o objeto raster

raster_reclass_2010 <-reclassify(x = raster_2010, #objeto raster
                                 rcl =matriz_reclass_2010, #matriz criada com os valores de origem e destino
                                 filename="2010_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_reclass_2010,"./Results/Accuracy/LULC_2010_CMIP6_reclass.tif")
plot(raster_reclass_2010)


## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_reclass_2015<-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,1,3,1,3,3,3,4,2,2,2,2,2),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2015 <-raster("./data/Acurracy/LULC_2015_CMPI_accucary_input.tif")
plot(raster_2015)

##Reclassificando o objeto raster

raster_reclass_2015 <-reclassify(x = raster_2015, #objeto raster
                                 rcl =matriz_reclass_2015, #matriz criada com os valores de origem e destino
                                 filename="2015_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_reclass_2015,"./Results/Accuracy/LULC_2015_CMIP6_reclass.tif")
plot(raster_reclass_2015)



