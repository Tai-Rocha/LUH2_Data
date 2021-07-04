#####Este script corta variáveis raster (.asc) por shapes (.shp)


# library -----------------------------------------------------------------


library(raster)
library(diffeR)
library(rgdal)
library(maptools)

# Read shape --------------------------------------------------------------


Mask_Greenland <- readOGR("./data/Shapes/Sem_Greeland.shp") # carregando o shape pela função OGR do pacote rgdal
plot(Mask_Greenland) #plotando


# Read raster -------------------------------------------------------------

FAO <-raster("./data/FAO/FAO_reclassified.tif")

LUH2 <-raster("./data/LUh2/LULC_2000_CMIP6_reclass.tif")



### FAO Crop and Mask
FAO_masked <- mask(x = FAO, mask = Mask_Greenland) #aplicando a máscara (shape) pela função mask do pacote raster 
plot(FAO_masked) # plot 

FAO_extention <- crop(x = FAO_masked, y = extent(Mask_Greenland)) #agora corte por essa máscara
plot(FAO_extention)

ext <- extent(-180, 180, -90, 83)
extent(FAO_extention) <- ext
FAO_extention <- setExtent(FAO_extention, ext, keepres=TRUE)

writeRaster(FAO_extention, "./data/Accuracy/Reclassified/FAO_reclass_final.tif", format="GTiff") ### Isto vai salvar no local em que estiver o projeto. Veja este local no canto superior  direito 


### LUH2 Crop and Mask
LUh2_masked <- mask(x = LUH2, mask = Mask_Greenland) #aplicando a máscara (shape) pela função mask do pacote raster 
plot(LUh2_masked) # plot 

LUh2_extention <- crop(x = LUh2_masked, y = extent(Mask_Greenland)) #agora corte por essa máscara
plot(LUh2_extention)

writeRaster(LUh2_extention, "./data/Accuracy/Reclassified/LUH2_reclass_final.tif", format="GTiff") ### Isto vai salvar no local em que estiver o projeto. Veja este local no canto superior  direito 


######################

