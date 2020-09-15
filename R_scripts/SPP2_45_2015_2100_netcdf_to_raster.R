##########################################################################
## Time series extract from netCDF file of Land use Harmonization Project
## Author: Tainá Rocha
########################################################################## 

#Librarys
library(sp)
library(raster)
library(rgdal)
library(ncdf4)

# Open NetCDF
states_45_SSP2 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP4.5 SSP2 (from MESSAGE-GLOBIOM)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MESSAGE-ssp245-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

# Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

### Object prepare for loops of primf state
pf <- states_45_SSP2$var[[1]]  ## Take primf variable
pf_size <- pf$varsize ## There should be 1440 lons, 720 lats, and 86 times
pf_dims <- pf$ndims ## 3 dimensions Long, Lat and time
pf_v <- pf_size[pf_dims]  ## Length of time dimension (for loop for)
lat <- states_45_SSP2$dim$latitude$vals   # latitude position
lon <- states_45_SSP2$dim$longitude$vals  # longitude position
primf<-list() # primf variable list

## Loop to get 2015 to 2100 raster of primf 
for (i in 1:pf_v) {
  start <- rep(1,pf_dims)  # begin with start=(1,1,...,1)
  start[pf_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- pf_size         # begin with count=(nx,ny,...,pf_v), reads entire var
  count[pf_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  primf_var <-ncvar_get(states_45_SSP2, varid = 'primf', start = start, count = count)
  
  # convert to raster
  primf[i]<-raster(primf_var)
}

###### End of Loop

## Create layer stack with time dimension
primf<-stack(primf)

# TUrban_2015_2100_SSP2_45ranspose the raster to have correct orientation
primf_final<-t(primf)


# Set the coordinate reference system (CRS) and extent

crs(primf_final) <- crs_object # set crs of raster stack
extent(primf_final) <- c(-180,180, -90,90) # set extent

# plot the result
spplot(primf_final)

### Write and save rasters

writeRaster(primf_final, "CMPI6_Land_Use_Harmonization_primf.tif", "GTiff", bylayer= T, suffix ="names", overwrite=TRUE)

########################################################################################

