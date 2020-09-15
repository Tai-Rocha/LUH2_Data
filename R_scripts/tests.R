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




################################### Does not NOT WORK
# extract variable name, size and dimension
v <- states_45_SSP2$var
size <- v[1:12]
dims <- v$time_bnds
nt <- size             # length of time dimension
lat <- states_45_SSP2$dim$latitude$vals   # latitude position
lon <- states_45_SSP2$dim$longitude$vals  # longitude position

# read time variable

pf <-list()
pn <-list()
sf <-list()
sn <-list()
ub <-list()
c3a <-list()
c4a <-list()
c3p <-list()
c4p <-list()
c3n <-list()
pat <-list()
ran <-list()


for (i in seq_along(nt)) {
  start <- rep(1,dims)     # begin with start=(1,1,...,1)
  start[dims] <- i         # change to start=(1,1,...,i) to read    timestep i
  count <- size            # begin with count=(nx,ny,...,nt), reads entire var
  count[dims] <- 1         # change to count=(nx,ny,...,1) to read 1 tstep
  
  #primf <- ncvar_get(states_45_SSP2, "primf", start = start, count = count)   
  primn <- ncvar_get(states_45_SSP2, "primn", start = start, count = count)
  secdf <- ncvar_get(states_45_SSP2, "secdf", start = start, count = count)
  secdn <- ncvar_get(states_45_SSP2, "secdn", start = start, count = count)
  urban <- ncvar_get(states_45_SSP2, "urban", start = start, count = count)
  c3ann <- ncvar_get(states_45_SSP2, "c3ann", start = start, count = count)
  c4ann <- ncvar_get(states_45_SSP2, "c4ann", start = start, count = count)
  c3per <- ncvar_get(states_45_SSP2, "c3per", start = start, count = count)
  c4per <- ncvar_get(states_45_SSP2, "c4per", start = start, count = count)
  c3nfx <- ncvar_get(states_45_SSP2, "c3nfx", start = start, count = count)
  pastr <- ncvar_get(states_45_SSP2, "pastr", start = start, count = count)
  range <- ncvar_get(states_45_SSP2, "range", start = start, count = count)
  
  # convert to raster
  #pf[i]<-raster(primf)
  pn[i] <- raster(primn)
  sf[i] <-raster(secdf)
  sn[i] <-raster(secdn)
  ub[i] <-raster(urban)
  c3a[i] <-raster(c3ann)
  c4a[i] <-raster(c4ann)
  c3p[i] <-raster(c3per)
  c4p[i] <-raster(c4per)
  c3n[i] <-raster(c3nfx)
  pat[i] <-raster(pastr)
  ran[i] <-raster(ran)
}

# create layer stack with time dimension
#pf<-stack(pf)
#plot(pf)
pn <- stack(pn)
sf <- stack(sf)
sn <- stack(sn)
ub <- stack(ub)
c3a <- stack(c3a)
c4a <- stack(c4a)
c3p <- stack(c3p)
c4p <- stack(c4p)
c3n <- stack(c3n)
pat <- stack(pat)
ran <- stack(ran)

# transpose the raster to have correct orientation
pf<-t(pf)

# plot the result
spplot(rt)

writeRaster(rt, "CMPI6_Land_Use_Harmonization_primf.tif", "GTiff", bylayer= T, suffix ="names", overwrite=TRUE)
