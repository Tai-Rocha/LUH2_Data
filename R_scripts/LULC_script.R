##########################################################################################
## Generate Land-use Land-cover raster from 12 states of Land-use Harmonization Project
## To build this raster, for each pixel the higest value among 12 states is assumed. 
## Author script: Tainá Rocha
##########################################################################################

lista_luh2_2015 <- list.files("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_SSP2_45_2015/", full.names = TRUE)

all_2015 <- stack(lista_luh2_2015)

LULC_2015 <- which.max(all_2015)

plot(LULC_2015)
writeRaster(LULC_2015_2, "./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_SSP2_45_2015/LULC_2015_CMIP6.tif")

##

sub_dirs <- list.dirs("./Results/SSP2_45_2015_2100/", full.names = T)
flist <- list()
stackfile <- list()
LULC <- list()

for(i in seq_along(sub_dirs)){
  flist[[i]] <- list.files(sub_dirs[i], recursive = T, full.names = T, pattern = ".tif")
  
  stackfile[[i]] <- stack(flist[[i]])
  
  LULC[[i]] <- which.max(stackfile[[i]])
}


for(i in seq_along(sub_dirs)){
  print(i)
}  



writeRaster(LULC, file.path("/home/taina/Documentos/LUH2_Data/Results/SSP2_45_2015_2100/", names(sub)), "GTiff",  bylayer= T, suffix ="names", overwrite=FALSE)