############################################
## Remove Greenlan from LULc files
## Author: Tainá Rocha
## Date : 27/04/202
############################################

library(raster)
library(rgdal)

##### List of directories

lista_850 <-list.dirs("./Results/850_2015/")

## Shape Mask

mascara <- readOGR("./data/Accuracy/Shapes/Sem_Greeland.shp") # Load shape

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

########################### Remove old file

file.remove(list.files(path=lista_850, recursive=TRUE, full.names=TRUE, pattern='LULC_'))


###################################
for(i in 1:length(lista_850)) {
  r <- list.files(path=lista_850[i], recursive=TRUE, full.names=TRUE,  pattern='LULC_')
  print(r)
} 
  
