##########################################################################################
## Generate Land-use Land-cover raster from 12 states of Land-use Harmonization Project
## To build this raster, for each pixel the higest value among 12 states is assumed. 
## Author script: Tainá 
##########################################################################################

lista_luh2 <- list.files("./Results/New_September/2100_test/", full.names = TRUE)

all <- stack(lista_luh2)

r <- which.max(all)
writeRaster(r, "./Results/test_LULC_2100.tif")

##