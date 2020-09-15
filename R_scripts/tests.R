#####################
# Extract from netCDF
#####################

# load pckgs  
library(sf) 
library(ncdf4)
library(raster)
library(rasterVis)
library(RColorBrewer)

# read ncdf file
# exemple: nc<-nc_open('D:/SSTs.nc')


#Open NetCDF
states_45_SSP2 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP4.5 SSP2 (from MESSAGE-GLOBIOM)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MESSAGE-ssp245-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)


b <- brick(states_45_SSP2)




#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times

primf.array <- ncvar_get(states_45_SSP2, "primf") # store the data in a 3-dimensional array

primf <- stack()

for(i in array(primf.array)) {
  
  primf[[i]] <- primf.array[, ,1:86]
}    
    
    writeRaster(primf.slice, "CMPI6_Land_Use_Harmonization_primf.tif", "GTiff", bylayer= T, suffix ="numbers", overwrite=TRUE)



primf.slice <- primf.array[, ,1]

#dim(primf.slice)


primf <- stack()

for (i in 1:length(primf.slice)) {
  primf[[i]] <- writeRaster(primf.slice, "CMPI6_Land_Use_Harmonization_primf.tif", "GTiff", bylayer= T, suffix ="numbers", overwrite=TRUE)
}

#Saving to GeoTif
writeRaster(primf.slice, "CMPI6_Land_Use_Harmonization_primf.tif", "GTiff", bylayer= T, suffix ="numbers", overwrite=TRUE)
