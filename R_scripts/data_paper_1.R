########################## Mariana M Vale & Tainá c Rocha 

#Library

library(raster)
library(ncdf4)
library(rgdal)

#Open NetCDF
nc_data <- nc_open('states.nc')

# Save the print(nc) dump to a text file
{
  sink('states.txt')
  print(nc_data)
  sink()
}

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
primf.array <- ncvar_get(nc_data, "primf") # store the data in a 3-dimensional array
dim(primf.array) 


#All done reading in the data. We can close the netCDF file.

nc_close(nc_data) 


#Time is the third dimension of these âsecdf.arrayâ. The first time slice represents the growing season of 1950.

primf.slice <- primf.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(primf.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(primf.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_primf_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## PRIMN State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
primn.array <- ncvar_get(nc_data, "primn") # store the data in a 3-dimensional array
dim(primn.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

primn.slice <- primn.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(primn.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(primn.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_primn_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## SECDf State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
secdf.array <- ncvar_get(nc_data, "secdf") # store the data in a 3-dimensional array
dim(secdf.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

secdf.slice <- secdf.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(secdf.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(secdf.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_secdf_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## secdn State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
secdn.array <- ncvar_get(nc_data, "secdn") # store the data in a 3-dimensional array
dim(secdn.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

secdn.slice <- secdn.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(secdn.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(secdn.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_secdn_2095_45.tif", "GTiff", overwrite=TRUE)


######################################################## urban State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
urban.array <- ncvar_get(nc_data, "urban") # store the data in a 3-dimensional array
dim(urban.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

urban.slice <- urban.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(urban.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(urban.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_urban_2095_45.tif", "GTiff", overwrite=TRUE)




######################################################## c3ann State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
c3ann.array <- ncvar_get(nc_data, "c3ann") # store the data in a 3-dimensional array
dim(c3ann.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

c3ann.slice <- c3ann.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(c3ann.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(c3ann.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_c3ann_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## c4ann State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
c4ann.array <- ncvar_get(nc_data, "c4ann") # store the data in a 3-dimensional array
dim(c4ann.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

c4ann.slice <- c4ann.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(c4ann.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(c4ann.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_c4ann_2095_45.tif", "GTiff", overwrite=TRUE)

######################################################## c3per State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
c3per.array <- ncvar_get(nc_data, "c3per") # store the data in a 3-dimensional array
dim(c3per.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

c3per.slice <- c3per.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(c3per.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(c3per.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_c3per_2095_45.tif", "GTiff", overwrite=TRUE)


######################################################## c4per State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
c4per.array <- ncvar_get(nc_data, "c4per") # store the data in a 3-dimensional array
dim(c4per.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

c4per.slice <- c4per.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(c4per.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(c4per.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_c4per_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## c3nfx State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
c3nfx.array <- ncvar_get(nc_data, "c3nfx") # store the data in a 3-dimensional array
dim(c3nfx.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

c3nfx.slice <- c3nfx.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(c3nfx.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(c3nfx.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_c3nfx_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## pastr State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
pastr.array <- ncvar_get(nc_data, "pastr") # store the data in a 3-dimensional array
dim(pastr.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

pastr.slice <- pastr.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(pastr.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(pastr.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_pastr_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## range State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
range.array <- ncvar_get(nc_data, "range") # store the data in a 3-dimensional array
dim(range.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

range.slice <- range.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(range.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(range.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_range_2095_45.tif", "GTiff", overwrite=TRUE)



######################################################## PRIMN State

#Read in the data from the x variable and verify the dimensions of the array. There should be 1440 lons, 720 lats, and 85 times
primn.array <- ncvar_get(nc_data, "primn") # store the data in a 3-dimensional array
dim(primn.array) 

#Time is the third dimension of the âsecdf.arrayâ. The first time slice represents the growing season of 1950.

primn.slice <- primn.array[, , 81] 

#Just to make sure everything is working correctly, we can take a look at the dimensions of this time slice. 
#The dimensions should be 4320 longitudes by 2095 latitudes.

dim(primn.slice)

#Ok, everything checks out, so we can go ahead and save this data in a raster. Note that we provide the coordinate reference system âCRSâ in the standard well-known text format. For this data set, it is the common WGS84 system.

r <- raster(t(primn.slice), xmn=min(-180), xmx=max(180), ymn=min(-90), ymx=max(90), crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0")) 


#Plotting
#Finally, we can plot the raster to take a look at the NDVI in 1982. Remember this data is cut off below 20 degrees North.
plot(r)


# If the data plot in a worgn way, you will need to transpose and flip to orient the data correctly. The best way to figure this out is through trial and error, but remember that most netCDF files record spatial data from the bottom left corner.
#r <- flip(r, direction='y')

#Saving to GeoTif
writeRaster(r, "CMPI6_Land_Use_Harmonization_primn_2095_45.tif", "GTiff", overwrite=TRUE)

