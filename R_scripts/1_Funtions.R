##########################################################################
## Funtions to extract time-series variables from netCDF file
## And to rename files from old raw names to new names
##########################################################################

#Library

library(sp)
library(raster)
library(rgdal)
library(ncdf4)

### Funtion to extract

netcdf_extract <- function(x){

  varr$name # Certificating that is a primnf variable
  varr_size <- varr$varsize ## There should be 1440 lons, 720 lats, and 86 times
  varr_dims <- varr$ndims ## 3 dimensions Long, Lat and time
  varr_v <- varr_size[varr_dims]  ## Length of time dimension (for loop for)
  lat <- states_45_SSP2$dim$latitude$vals  # latitude position
  lon <- states_45_SSP2$dim$longitude$vals  # longitude position
  listaa <- list() # primf variable list
  
  
#4 Loop to get 2015 to 2100 raster of primf 
  for (i in 1:varr_v) {
    start <- rep(1,varr_dims)  # begin with start=(1,1,...,1)
    start[varr_dims] <- i      # change to start=(1,1,...,i) to read timestep i
    count <- varr_size         # begin with count=(nx,ny,...,varr_v), reads entire var
    count[varr_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
    
    
    ## Seleciona variável 
    if(varr$name == "primf")
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'primf', start = start, count = count)
    }
    else if(varr$name == "primn")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'primn', start = start, count = count)
    }
    else if(varr$name == "secdf")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'secdf', start = start, count = count)
    }
    else if(varr$name == "secdn")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'secdn', start = start, count = count)
    }
    else if(varr$name == "urban")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'urabn', start = start, count = count)
    }
    else if(varr$name == "c3ann")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'c3ann', start = start, count = count)
    }
    else if(varr$name == "c4ann")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'c4ann', start = start, count = count)
    }
    else if(varr$name == "c3per")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'c3per', start = start, count = count)
    }
    else if(varr$name == "c4per")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'c4per', start = start, count = count)
    }
    else if(varr$name == "c3nfx")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'c3nfx', start = start, count = count)
    }
    else if(varr$name == "pastr")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'pastr', start = start, count = count)
    }
    else if(varr$name == "range")    
    {
      var_var <-ncvar_get(states_45_SSP2, varid = 'range', start = start, count = count)
    }
    
    #5 convert to raster
    listaa[i] <- raster(var_var)
  }  

# Create layer stack with time dimension
  listaa <- stack(listaa)
  
#7 Transpose the raster to have correct orientation
listaa_final<-t(listaa)
  
listaa_final 
# Set the coordinate reference system (CRS) and extent
  crs(listaa_final) <- crs_object # set crs of raster stack
  extent(listaa_final) <- c(-180,180, -90,90) # set extent
  
  
# Write and save rasters in a year folders 
  
writeRaster(listaa_final, filename=file.path("./Results/SSP2_45_2015_2100/"), format="GTiff", bylayer=TRUE)

return()
}  


### Funtions to rename files and than remove old files

new_fnames <- function(x) 
{file.copy(from = old_files, to = new_files)
  file.remove(old_files)
  }

######## 

