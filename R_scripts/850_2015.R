##########################################################################
## Time series extract from netCDF file of Land use Harmonization Project
## Author: Tainá Rocha
########################################################################

#Librarys
library(sp)
library(raster)
library(rgdal)
library(ncdf4)


#1 Open NetCDF
states<- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/Historical/states.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Create directory per year. First a read the tables with de subfolders names
table_8502015 <- read.csv("./data/table_850_2015_subfolders.csv")

subfolder_names <- c(table_8502015[1:1166,])

#2.2 Loop to crate these folders in singles folder 

for (j in 1: length(subfolder_names)){
  dir.create(paste0("./Results/850_2015/",subfolder_names[j]))
}

#2.3 
setwd("./Results/850_2015/")

#3 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

########################################################################################
#Primf states...  Describe the state.....
########################################################################################

# Object prepare for loops of primf state
pf <- states$var[[1]]  ## Take primf variable
pf$name # Certificating that is a primnf variable
pf_size <- pf$varsize ## There should be 1440 lons, 720 lats, and 86 times
pf_dims <- pf$ndims ## 3 dimensions Long, Lat and time
pf_v <- pf_size[pf_dims]  ## Length of time dimension (for loop for)
lat <- states$dim$latitude$vals   # latitude position
lon <- states$dim$longitude$vals  # longitude position
primf<-list() # primf variable list

#4 Loop to get 2015 to 2100 raster of primf 
for (i in 1:pf_v) {
  start <- rep(1,pf_dims)  # begin with start=(1,1,...,1)
  start[pf_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- pf_size         # begin with count=(nx,ny,...,pf_v), reads entire var
  count[pf_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  primf_var <-ncvar_get(states, varid = 'primf', start = start, count = count)
  
  #5 convert to raster
  primf[i]<-raster(primf_var)
}

###### End of Loop

#6 Create layer stack with time dimension
primf<-stack(primf)

#7 Transpose the raster to have correct orientation
primf_final<-t(primf)


#8 Set the coordinate reference system (CRS) and extent
crs(primf_final) <- crs_object # set crs of raster stack
extent(primf_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(primf_final)


#10 Write and save rasters in a year folders 





