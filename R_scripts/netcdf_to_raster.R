#Open NetCDF
states_45_SSP2 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP4.5 SSP2 (from MESSAGE-GLOBIOM)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MESSAGE-ssp245-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

# extract variable name, size and dimension
v <- states_45_SSP2$var[[1]]
size <- v$varsize
dims <- v$ndims
nt <- size[dims]              # length of time dimension
lat <- states_45_SSP2$dim$latitude$vals   # latitude position
lon <- states_45_SSP2$dim$longitude$vals  # longitude position

# read time variable

r<-list()
for (i in 1:nt) {
  start <- rep(1,dims)     # begin with start=(1,1,...,1)
  start[dims] <- i             # change to start=(1,1,...,i) to read    timestep i
  count <- size                # begin with count=(nx,ny,...,nt), reads entire var
  count[dims] <- 1             # change to count=(nx,ny,...,1) to read 1 tstep
  
  
  dt<-ncvar_get(states_45_SSP2, "primf", start = start, count = count)
  
  # convert to raster
  r[i]<-raster(dt)
}

# create layer stack with time dimension
r<-stack(r)
plot(r)

# transpose the raster to have correct orientation
rt<-t(r)
#extent(rt)<-extent(c(range(lon), range(lat)))

# plot the result
spplot(rt)

writeRaster(rt, "CMPI6_Land_Use_Harmonization_primf.tif", "GTiff", bylayer= T, suffix ="numbers", overwrite=TRUE)
