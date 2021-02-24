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


#### FAO reclass
############# Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

FAO_matriz_reclass <-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,4,2,3,1,3,3,3,3,3,NA,NA),nrow=11,ncol=2)


##Leitura e transformação em objeto do raster

raster_FAO <-raster("./data/FAO/GlcShare_v10_Dominant/glc_shv10_DOM.Tif")
plot(raster_FAO)

as.factor(raster_FAO)
##Reclassificando o objeto raster

raster_reclass_2<-reclassify(x = raster_FAO, #objeto raster
                             rcl = FAO_matriz_reclass, #matriz criada com os valores de origem e destino
                             filename="FAO_reclassified7") #nome do arquivo de output

plot(raster_reclass_2)

##salvando o novo raster reclassificado
as.factor(raster_reclass_2)
plot(raster_reclass_2)
writeRaster(raster_reclass_2,"./data/FAO/FAO_reclassified.tif")



####################################################################
####################################################################
####################### LUH2 Reclass ###############################
####################################################################
####################################################################

## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_2000_reclass<-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,2,2,2,2,2,3,1,3,3,1,3,4),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2000 <-raster("./data/Accuracy/LULC_2000_CMPI_accucary_input.tif")
plot(raster_2000)

##Reclassificando o objeto raster

raster_2000_reclass <-reclassify(x = raster_2000, #objeto raster
                           rcl = matriz_2000_reclass, #matriz criada com os valores de origem e destino
                           filename="2000_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_2000_reclass,"./data/Accuracy/Reclassified/LULC_2000_CMIP6_reclass.tif")
plot(raster_2000_reclass)

#######################################################################################################

## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_2005_reclass <-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,2,2,2,2,2,3,1,3,3,1,3,4),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2005 <-raster("./data/Accuracy/LULC_2005_CMPI_accucary_input.tif")
plot(raster_2005)

##Reclassificando o objeto raster

raster_2005_reclass <-reclassify(x = raster_2005, #objeto raster
                                 rcl =matriz_2005_reclass, #matriz criada com os valores de origem e destino
                                 filename="2005_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_2005_reclass,"./data/Accuracy/Reclassified/LULC_2005_CMIP6_reclass.tif")
plot(raster_2005_reclass)

#######################################################################################################

## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_2010_reclass <-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,2,2,2,2,2,3,1,3,3,1,3,4),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2010 <-raster("./data/Accuracy/LULC_2010_CMPI_accucary_input.tif")
plot(raster_2010)

##Reclassificando o objeto raster

raster_2010_reclass <-reclassify(x = raster_2010, #objeto raster
                                 rcl =matriz_2010_reclass, #matriz criada com os valores de origem e destino
                                 filename="2010_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_2010_reclass,"./data/Accuracy/Reclassified/LULC_2010_CMIP6_reclass.tif")
plot(raster_2010_reclass)

#######################################################################################################

## Criar uma matriz onde estarão os valores do pixel atual e o que serão substituídos

matriz_2015_reclass <-matrix(data=c(1,2,3,4,5,6,7,8,9,10,11,12,2,2,2,2,2,3,1,3,3,1,3,4),nrow=12,ncol=2)

##Leitura e transformação em objeto do raster

raster_2015 <-raster("./data/Accuracy/LULC_2015_CMPI_accucary_input.tif")
plot(raster_2015)

##Reclassificando o objeto raster

raster_2015_reclass <-reclassify(x = raster_2015, #objeto raster
                                 rcl =matriz_2015_reclass, #matriz criada com os valores de origem e destino
                                 filename="2015_reclass") #nome do arquivo de output


##salvando o novo raster reclassificado
writeRaster(raster_2015_reclass,"./data/Accuracy/Reclassified/LULC_2015_CMIP6_reclass.tif")
plot(raster_2015_reclass)



