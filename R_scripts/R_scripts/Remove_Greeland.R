############################################
## Remove Greenlan from LULc files
## Author: Tainá Rocha
## Date : 27/04/202
## 4.02 R version
############################################

library(raster)
library(rgdal)

## Shape Mask for all files 

mascara <- readOGR("./data/Accuracy/Shapes/Sem_Greeland.shp") # Load shape
#plot(mascara)

#################################### 850 _2015 #################################### 

##### List of directories

lista_850 <-list.dirs("./Results/850_2015/")

#plot(mascara) # plot shape

## Stack all files

stack_LULC <- stack(list.files(path=lista_850, recursive=TRUE, full.names=TRUE, pattern='LULC_'))
plot(stack_LULC)

# Aplly mask  
mascara_LULC <- mask(x = stack_LULC, mask = mascara)

## Crop by mask
  
final_LULC <- crop(x = mascara_LULC, y = extent(mascara)) 

## Get correct names

a <- paste0(names(stack_LULC), ".tif")

## Save raster in parental folder

writeRaster(final_LULC, filename=a, bylayer=TRUE) 

## Remove old file from subfolders

file.remove(list.files(path=lista_850, recursive=TRUE, full.names=TRUE, pattern='LULC_'))

#################################### SSP2_45_2015_2100 #################################### 


##### List of directories

lista_SSP_2 <-list.dirs("./Results/SSP2_45_2015_2100/")

## Stack all files

stack_2_SSP <- stack(list.files(path=lista_SSP_2, recursive=TRUE, full.names=TRUE, pattern='LULC_'))

#plot(stcak_2_SSP)

# Aplly mask  

mascara_2_SSP <- mask(x = stack_2_SSP, mask = mascara)

## Crop by mask

SSP_2 <- crop(x = mascara_2_SSP, y = extent(mascara)) 

## Get correct names

b <- paste0(names(stack_2_SSP), ".tif")

## Save raster in parental folder

writeRaster(SSP_2, filename=b, bylayer=TRUE) 

## Remove old file from subfolders

file.remove(list.files(path=lista_SSP_2, recursive=TRUE, full.names=TRUE, pattern='LULC_'))


#################################### SSP5_85_2015_2100 #################################### 


##### List of directories

lista_SSP_5 <-list.dirs("./Results/SSP5_85_2015_2100/")

## Stack all files

stack_5_SSP <- stack(list.files(path=lista_SSP_5, recursive=TRUE, full.names=TRUE, pattern='LULC_'))

#plot(stack_5_SSP)

# Aplly mask  

mascara_5_SSP <- mask(x = stack_5_SSP, mask = mascara)

## Crop by mask

SSP_5 <- crop(x = mascara_5_SSP, y = extent(mascara)) 

## Get correct names

c <- paste0(names(stack_5_SSP), ".tif")

## Save raster in parental folder

writeRaster(SSP_5, filename=c, bylayer=TRUE) 

## Remove old file from subfolders

file.remove(list.files(path=lista_SSP_5, recursive=TRUE, full.names=TRUE, pattern='LULC_'))



