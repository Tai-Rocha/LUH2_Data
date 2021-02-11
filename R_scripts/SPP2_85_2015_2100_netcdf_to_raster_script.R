###########################################################################
## Time series extract from netCDF file of Land use Harmonization Project
## Author: Tainá Rocha
########################################################################### 

#Librarys
library(sp)
library(raster)
library(rgdal)
library(ncdf4)


#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Create directory per year  

subfolder_names <- c("CMIP6_Land_Use_Harmonization_SSP5_85_2015",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2016",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2017",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2018",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2019",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2020",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2021",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2022",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2023",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2024",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2025",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2026",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2027",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2028",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2029",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2030",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2031",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2032",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2033",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2034",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2035",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2036",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2037",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2038",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2039",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2040",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2041",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2042",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2043",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2044",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2045",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2046",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2047",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2048",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2049",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2050",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2051",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2052",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2053",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2054",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2055",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2056",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2057",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2058",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2059",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2060",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2061",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2062",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2063",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2064",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2065",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2066",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2067",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2068",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2069",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2070",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2071",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2072",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2073",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2074",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2075",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2076",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2077",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2078",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2079",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2080",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2081",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2082",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2083",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2084",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2085",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2086",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2087",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2088",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2089",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2090",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2091",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2092",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2093",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2094",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2095",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2096",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2097",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2098",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2099",
                     "CMIP6_Land_Use_Harmonization_SSP5_85_2100")

#2.2 Loop to crate these folders in singles folder 

for (j in 1: length(subfolder_names)){
  dir.create(paste0("./Results/SSP5_85_2015_2100/",subfolder_names[j]))
}

#3 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

########################################################################################
#Primf states...  Describe the state.....
########################################################################################

# Object prepare for loops of primf state
pf <- states_85_SSP5$var[[1]]  ## Take primf variable
pf$name # Certificating that is a primnf variable
pf_size <- pf$varsize ## There should be 1440 lons, 720 lats, and 86 times
pf_dims <- pf$ndims ## 3 dimensions Long, Lat and time
pf_v <- pf_size[pf_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
primf<-list() # primf variable list

#4 Loop to get 2015 to 2100 raster of primf 
for (i in 1:pf_v) {
  start <- rep(1,pf_dims)  # begin with start=(1,1,...,1)
  start[pf_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- pf_size         # begin with count=(nx,ny,...,pf_v), reads entire var
  count[pf_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  primf_var <-ncvar_get(states_85_SSP5, varid = 'primf', start = start, count = count)
  
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

writeRaster(primf_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(primf_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(primf_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_primf_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots


#### From now one I repeat  these 11 stpes. I alaways clean the environment after finshed each states. 

########################################################################################
# Primn states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of primn state
pn <- states_85_SSP5$var[[2]]  ## Take primn variable
pn$name # Certificating that is a primn variable 
pn_size <- pn$varsize ## There should be 1440 lons, 720 lats, and 86 times
pn_dims <- pn$ndims ## 3 dimensions Long, Lat and time
pn_v <- pn_size[pn_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
primn<-list() # primn variable list

#4 Loop to get 2015 to 2100 raster of primn 
for (i in 1:pn_v) {
  start <- rep(1,pn_dims)  # begin with start=(1,1,...,1)
  start[pn_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- pn_size         # begin with count=(nx,ny,...,pn_v), reads entire var
  count[pn_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  primn_var <-ncvar_get(states_85_SSP5, varid = 'primn', start = start, count = count)
  
  #5 convert to raster
  primn[i]<-raster(primn_var)
}

###### End of Loop

#6 Create layer stack with time dimension
primn<-stack(primn)

#7 Transpose the raster to have correct orientation
primn_final<-t(primn)

#8 Set the coordinate reference system (CRS) and extent
crs(primn_final) <- crs_object # set crs of raster stack
extent(primn_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
###spplot(primn_final)

#10 Write and save rasters
writeRaster(primn_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(primn_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(primn_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_primn_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots


########################################################################################
# Secdf states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of secdf state
sf <- states_85_SSP5$var[[3]]  ## Take secdf variable
sf$name # Certificating that is a secdf variable 
sf_size <- sf$varsize ## There should be 1440 lons, 720 lats, and 86 times
sf_dims <- sf$ndims ## 3 dimensions Long, Lat and time
sf_v <- sf_size[sf_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
secdf<-list() # secdf variable list

#4 Loop to get 2015 to 2100 raster of secdf 
for (i in 1:sf_v) {
  start <- rep(1,sf_dims)  # begin with start=(1,1,...,1)
  start[sf_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- sf_size         # begin with count=(nx,ny,...,sf_v), reads entire var
  count[sf_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  secdf_var <-ncvar_get(states_85_SSP5, varid = 'secdf', start = start, count = count)
  
  #5 convert to raster
  secdf[i]<-raster(secdf_var)
}

###### End of Loop

#6 Create layer stack with time dimension
secdf<-stack(secdf)

#7 Transpose the raster to have correct orientation
secdf_final<-t(secdf)

#8 Set the coordinate reference system (CRS) and extent
crs(secdf_final) <- crs_object # set crs of raster stack
extent(secdf_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(secdf_final)

#10 Write and save rasters

writeRaster(secdf_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(secdf_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(secdf_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_secdf_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots



########################################################################################
# Secdn states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of secdn state
sn <- states_85_SSP5$var[[4]]  ## Take secdn variable
sn$name # Certificating that is a secdn variable 
sn_size <- sn$varsize ## There should be 1440 lons, 720 lats, and 86 times
sn_dims <- sn$ndims ## 3 dimensions Long, Lat and time
sn_v <- sn_size[sn_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
secdn<-list() # secdn variable list

#4 Loop to get 2015 to 2100 raster of secdn 
for (i in 1:sn_v) {
  start <- rep(1,sn_dims)  # begin with start=(1,1,...,1)
  start[sn_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- sn_size         # begin with count=(nx,ny,...,sn_v), reads entire var
  count[sn_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  secdn_var <-ncvar_get(states_85_SSP5, varid = 'secdn', start = start, count = count)
  
  #5 convert to raster
  secdn[i]<-raster(secdn_var)
}

###### End of Loop

#6 Create layer stack with time dimension
secdn<-stack(secdn)

#7 Transpose the raster to have correct orientation
secdn_final<-t(secdn)

#8 Set the coordinate reference system (CRS) and extent
crs(secdn_final) <- crs_object # set crs of raster stack
extent(secdn_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(secdn_final)

#10 Write and save rasters

writeRaster(secdn_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(secdn_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(secdn_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_secdn_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots



########################################################################################
# Urban states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of urban state
ub <- states_85_SSP5$var[[5]]  ## Take urban variable
ub$name # Certificating that is a urban variable 
ub_size <- ub$varsize ## There should be 1440 lons, 720 lats, and 86 times
ub_dims <- ub$ndims ## 3 dimensions Long, Lat and time
ub_v <- ub_size[ub_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
urban<-list() # urban variable list

#4 Loop to get 2015 to 2100 raster of urban 
for (i in 1:ub_v) {
  start <- rep(1,ub_dims)  # begin with start=(1,1,...,1)
  start[ub_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- ub_size         # begin with count=(nx,ny,...,ub_v), reads entire var
  count[ub_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  urban_var <-ncvar_get(states_85_SSP5, varid = 'urban', start = start, count = count)
  
  #5 convert to raster
  urban[i]<-raster(urban_var)
}

###### End of Loop

#6 Create layer stack with time dimension
urban<-stack(urban)

#7 Transpose the raster to have correct orientation
urban_final<-t(urban)

#8 Set the coordinate reference system (CRS) and extent
crs(urban_final) <- crs_object # set crs of raster stack
extent(urban_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(urban_final)

#10 Write and save rasters

writeRaster(urban_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(urban_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(urban_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_urban_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots



########################################################################################
# C3ann states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of c3ann state
c3a <- states_85_SSP5$var[[6]]  ## Take c3ann variable
c3a$name # Certificating that is a c3ann variable 
c3a_size <- c3a$varsize ## There should be 1440 lons, 720 lats, and 86 times
c3a_dims <- c3a$ndims ## 3 dimensions Long, Lat and time
c3a_v <- c3a_size[c3a_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
c3ann<-list() # c3ann variable list

#4 Loop to get 2015 to 2100 raster of c3ann 
for (i in 1:c3a_v) {
  start <- rep(1,c3a_dims)  # begin with start=(1,1,...,1)
  start[c3a_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- c3a_size         # begin with count=(nx,ny,...,c3a_v), reads entire var
  count[c3a_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  c3ann_var <-ncvar_get(states_85_SSP5, varid = 'c3ann', start = start, count = count)
  
  #5 convert to raster
  c3ann[i]<-raster(c3ann_var)
}

###### End of Loop

#6 Create layer stack with time dimension
c3ann<-stack(c3ann)

#7 Transpose the raster to have correct orientation
c3ann_final<-t(c3ann)

#8 Set the coordinate reference system (CRS) and extent
crs(c3ann_final) <- crs_object # set crs of raster stack
extent(c3ann_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(c3ann_final)

#10 Write and save rasters

writeRaster(c3ann_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(c3ann_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(c3ann_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_c3ann_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots



########################################################################################
# C4ann states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of c4ann state
c4a <- states_85_SSP5$var[[7]]  ## Take c4ann variable
c4a$name # Certificating that is a c4ann variable 
c4a_size <- c4a$varsize ## There should be 1440 lons, 720 lats, and 86 times
c4a_dims <- c4a$ndims ## 3 dimensions Long, Lat and time
c4a_v <- c4a_size[c4a_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
c4ann<-list() # c4ann variable list

#4 Loop to get 2015 to 2100 raster of c4ann 
for (i in 1:c4a_v) {
  start <- rep(1,c4a_dims)  # begin with start=(1,1,...,1)
  start[c4a_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- c4a_size         # begin with count=(nx,ny,...,c4a_v), reads entire var
  count[c4a_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  c4ann_var <-ncvar_get(states_85_SSP5, varid = 'c4ann', start = start, count = count)
  
  #5 convert to raster
  c4ann[i]<-raster(c4ann_var)
}

###### End of Loop

#6 Create layer stack with time dimension
c4ann<-stack(c4ann)

#7 Transpose the raster to have correct orientation
c4ann_final<-t(c4ann)

#8 Set the coordinate reference system (CRS) and extent
crs(c4ann_final) <- crs_object # set crs of raster stack
extent(c4ann_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(c4ann_final)

#10 Write and save rasters

writeRaster(c4ann_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(c4ann_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(c4ann_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_c4ann_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots

rm(list=ls()) ## list all environment objects and remove
#dev.off(dev.list()["RStudioGD"]) ## remove all plots



########################################################################################
# C3per states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of c3per state
c3p <- states_85_SSP5$var[[8]]  ## Take c3per variable
c3p$name # Certificating that is a c3per variable 
c3p_size <- c3p$varsize ## There should be 1440 lons, 720 lats, and 86 times
c3p_dims <- c3p$ndims ## 3 dimensions Long, Lat and time
c3p_v <- c3p_size[c3p_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
c3per<-list() # c3per variable list

#4 Loop to get 2015 to 2100 raster of c3per 
for (i in 1:c3p_v) {
  start <- rep(1,c3p_dims)  # begin with start=(1,1,...,1)
  start[c3p_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- c3p_size         # begin with count=(nx,ny,...,c3p_v), reads entire var
  count[c3p_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  c3per_var <-ncvar_get(states_85_SSP5, varid = 'c3per', start = start, count = count)
  
  #5 convert to raster
  c3per[i]<-raster(c3per_var)
}

###### End of Loop

#6 Create layer stack with time dimension
c3per<-stack(c3per)

#7 Transpose the raster to have correct orientation
c3per_final<-t(c3per)

#8 Set the coordinate reference system (CRS) and extent
crs(c3per_final) <- crs_object # set crs of raster stack
extent(c3per_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(c3per_final)

#10 Write and save rasters

writeRaster(c3per_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(c3per_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(c3per_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_c3per_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots



########################################################################################
# C4per states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of c4per state
c4p <- states_85_SSP5$var[[9]]  ## Take c4per variable
c4p$name # Certificating that is a c4per variable 
c4p_size <- c4p$varsize ## There should be 1440 lons, 720 lats, and 86 times
c4p_dims <- c4p$ndims ## 3 dimensions Long, Lat and time
c4p_v <- c4p_size[c4p_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
c4per<-list() # c4per variable list

#4 Loop to get 2015 to 2100 raster of c4per 
for (i in 1:c4p_v) {
  start <- rep(1,c4p_dims)  # begin with start=(1,1,...,1)
  start[c4p_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- c4p_size         # begin with count=(nx,ny,...,c4p_v), reads entire var
  count[c4p_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  c4per_var <-ncvar_get(states_85_SSP5, varid = 'c4per', start = start, count = count)
  
  #5 convert to raster
  c4per[i]<-raster(c4per_var)
}

###### End of Loop

#6 Create layer stack with time dimension
c4per<-stack(c4per)

#7 Transpose the raster to have correct orientation
c4per_final<-t(c4per)

#8 Set the coordinate reference system (CRS) and extent
crs(c4per_final) <- crs_object # set crs of raster stack
extent(c4per_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(c4per_final)

#10 Write and save rasters

writeRaster(c4per_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(c4per_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(c4per_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_c4per_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots


########################################################################################
# C3nfx states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of c3nfx state
c3n <- states_85_SSP5$var[[10]]  ## Take c3nfx variable
c3n$name # Certificating that is a c3nfx variable 
c3n_size <- c3n$varsize ## There should be 1440 lons, 720 lats, and 86 times
c3n_dims <- c3n$ndims ## 3 dimensions Long, Lat and time
c3n_v <- c3n_size[c3n_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
c3nfx<-list() # c3nfx variable list

#4 Loop to get 2015 to 2100 raster of c3nfx 
for (i in 1:c3n_v) {
  start <- rep(1,c3n_dims)  # begin with start=(1,1,...,1)
  start[c3n_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- c3n_size         # begin with count=(nx,ny,...,c3n_v), reads entire var
  count[c3n_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  c3nfx_var <-ncvar_get(states_85_SSP5, varid = 'c3nfx', start = start, count = count)
  
  #5 convert to raster
  c3nfx[i]<-raster(c3nfx_var)
}

###### End of Loop

#6 Create layer stack with time dimension
c3nfx<-stack(c3nfx)

#7 Transpose the raster to have correct orientation
c3nfx_final<-t(c3nfx)

#8 Set the coordinate reference system (CRS) and extent
crs(c3nfx_final) <- crs_object # set crs of raster stack
extent(c3nfx_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(c3nfx_final)

#10 Write and save rasters

writeRaster(c3nfx_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(c3nfx_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(c3nfx_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_c3nfx_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots


########################################################################################
# Pastr states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prepare for loops of pastr state
pa <- states_85_SSP5$var[[11]]  ## Take pastr variable
pa$name # Certificating that is a pastr variable 
pa_size <- pa$varsize ## There should be 1440 lons, 720 lats, and 86 times
pa_dims <- pa$ndims ## 3 dimensions Long, Lat and time
pa_v <- pa_size[pa_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
pastr<-list() # pastr variable list

#4 Loop to get 2015 to 2100 raster of pastr 
for (i in 1:pa_v) {
  start <- rep(1,pa_dims)  # begin with start=(1,1,...,1)
  start[pa_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- pa_size         # begin with count=(nx,ny,...,pa_v), reads entire var
  count[pa_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  pastr_var <-ncvar_get(states_85_SSP5, varid = 'pastr', start = start, count = count)
  
  #5 convert to raster
  pastr[i]<-raster(pastr_var)
}

###### End of Loop

#6 Create layer stack with time dimension
pastr<-stack(pastr)

#7 Transpose the raster to have correct orientation
pastr_final<-t(pastr)

#8 Set the coordinate reference system (CRS) and extent
crs(pastr_final) <- crs_object # set crs of raster stack
extent(pastr_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(pastr_final)

#10 Write and save rasters

writeRaster(pastr_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(pastr_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(pastr_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_pastr_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots


########################################################################################
# Range states...  Describe the state.....
########################################################################################

#1 Open NetCDF
states_85_SSP5 <- nc_open("./data/raw_data/LUH2 v2f Release (12_21_17)/RCP8.5 SSP5 (from REMIND-MAGPIE)/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MAGPIE-ssp585-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)

#2 Get the coordinate reference system (CRS) to use for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Object prerare for loops of range state
ra <- states_85_SSP5$var[[12]]  ## Take range variable
ra$name # Certificating that is a range variable 
ra_size <- ra$varsize ## There should be 1440 lons, 720 lats, and 86 times
ra_dims <- ra$ndims ## 3 dimensions Long, Lat and time
ra_v <- ra_size[ra_dims]  ## Length of time dimension (for loop for)
lat <- states_85_SSP5$dim$latitude$vals   # latitude position
lon <- states_85_SSP5$dim$longitude$vals  # longitude position
range<-list() # range variable list

#4 Loop to get 2015 to 2100 raster of range 
for (i in 1:ra_v) {
  start <- rep(1,ra_dims)  # begin with start=(1,1,...,1)
  start[ra_dims] <- i      # change to start=(1,1,...,i) to read timestep i
  count <- ra_size         # begin with count=(nx,ny,...,ra_v), reads entire var
  count[ra_dims] <- 1      # change to count=(nx,ny,...,1) to read 1 tstep
  
  range_var <-ncvar_get(states_85_SSP5, varid = 'range', start = start, count = count)
  
  #5 convert to raster
  range[i]<-raster(range_var)
}

###### End of Loop

#6 Create layer stack with time dimension
range<-stack(range)

#7 Transpose the raster to have correct orientation
range_final<-t(range)

#8 Set the coordinate reference system (CRS) and extent
crs(range_final) <- crs_object # set crs of raster stack
extent(range_final) <- c(-180,180, -90,90) # set extent

#9 plot the result
#spplot(range_final)

#10 Write and save rasters

writeRaster(range_final$layer.1, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2015/CMIP6_Land_Use_Harmonization_range_SSP5_85_2015.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.2, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2016/CMIP6_Land_Use_Harmonization_range_SSP5_85_2016.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.3, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2017/CMIP6_Land_Use_Harmonization_range_SSP5_85_2017.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.4, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2018/CMIP6_Land_Use_Harmonization_range_SSP5_85_2018.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.5, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2019/CMIP6_Land_Use_Harmonization_range_SSP5_85_2019.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.6, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2020/CMIP6_Land_Use_Harmonization_range_SSP5_85_2020.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.7, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2021/CMIP6_Land_Use_Harmonization_range_SSP5_85_2021.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.8, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2022/CMIP6_Land_Use_Harmonization_range_SSP5_85_2022.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.9, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2023/CMIP6_Land_Use_Harmonization_range_SSP5_85_2023.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.10, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2024/CMIP6_Land_Use_Harmonization_range_SSP5_85_2024.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.11, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2025/CMIP6_Land_Use_Harmonization_range_SSP5_85_2025.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.12, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2026/CMIP6_Land_Use_Harmonization_range_SSP5_85_2026.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.13, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2027/CMIP6_Land_Use_Harmonization_range_SSP5_85_2027.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.14, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2028/CMIP6_Land_Use_Harmonization_range_SSP5_85_2028.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.15, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2029/CMIP6_Land_Use_Harmonization_range_SSP5_85_2029.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.16, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2030/CMIP6_Land_Use_Harmonization_range_SSP5_85_2030.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.17, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2031/CMIP6_Land_Use_Harmonization_range_SSP5_85_2031.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.18, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2032/CMIP6_Land_Use_Harmonization_range_SSP5_85_2032.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.19, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2033/CMIP6_Land_Use_Harmonization_range_SSP5_85_2033.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.20, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2034/CMIP6_Land_Use_Harmonization_range_SSP5_85_2034.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.21, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2035/CMIP6_Land_Use_Harmonization_range_SSP5_85_2035.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.22, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2036/CMIP6_Land_Use_Harmonization_range_SSP5_85_2036.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.23, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2037/CMIP6_Land_Use_Harmonization_range_SSP5_85_2037.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.24, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2038/CMIP6_Land_Use_Harmonization_range_SSP5_85_2038.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.25, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2039/CMIP6_Land_Use_Harmonization_range_SSP5_85_2039.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.26, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2040/CMIP6_Land_Use_Harmonization_range_SSP5_85_2040.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.27, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2041/CMIP6_Land_Use_Harmonization_range_SSP5_85_2041.tif","GTiff", overwrite=FALSE) 

writeRaster(range_final$layer.28, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2042/CMIP6_Land_Use_Harmonization_range_SSP5_85_2042.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.29, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2043/CMIP6_Land_Use_Harmonization_range_SSP5_85_2043.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.30, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2044/CMIP6_Land_Use_Harmonization_range_SSP5_85_2044.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.31, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2045/CMIP6_Land_Use_Harmonization_range_SSP5_85_2045.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.32, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2046/CMIP6_Land_Use_Harmonization_range_SSP5_85_2046.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.33, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2047/CMIP6_Land_Use_Harmonization_range_SSP5_85_2047.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.34, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2048/CMIP6_Land_Use_Harmonization_range_SSP5_85_2048.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.35, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2049/CMIP6_Land_Use_Harmonization_range_SSP5_85_2049.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.36, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2050/CMIP6_Land_Use_Harmonization_range_SSP5_85_2050.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.37, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2051/CMIP6_Land_Use_Harmonization_range_SSP5_85_2051.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.38, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2052/CMIP6_Land_Use_Harmonization_range_SSP5_85_2052.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.39, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2053/CMIP6_Land_Use_Harmonization_range_SSP5_85_2053.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.40, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2054/CMIP6_Land_Use_Harmonization_range_SSP5_85_2054.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.41, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2055/CMIP6_Land_Use_Harmonization_range_SSP5_85_2055.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.42, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2056/CMIP6_Land_Use_Harmonization_range_SSP5_85_2056.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.43, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2057/CMIP6_Land_Use_Harmonization_range_SSP5_85_2057.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.44, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2058/CMIP6_Land_Use_Harmonization_range_SSP5_85_2058.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.45, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2059/CMIP6_Land_Use_Harmonization_range_SSP5_85_2059.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.46, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2060/CMIP6_Land_Use_Harmonization_range_SSP5_85_2060.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.47, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2061/CMIP6_Land_Use_Harmonization_range_SSP5_85_2061.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.48, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2062/CMIP6_Land_Use_Harmonization_range_SSP5_85_2062.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.49, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2063/CMIP6_Land_Use_Harmonization_range_SSP5_85_2063.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.50, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2064/CMIP6_Land_Use_Harmonization_range_SSP5_85_2064.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.51, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2065/CMIP6_Land_Use_Harmonization_range_SSP5_85_2065.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.52, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2066/CMIP6_Land_Use_Harmonization_range_SSP5_85_2066.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.53, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2067/CMIP6_Land_Use_Harmonization_range_SSP5_85_2067.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.54, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2068/CMIP6_Land_Use_Harmonization_range_SSP5_85_2068.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.55, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2069/CMIP6_Land_Use_Harmonization_range_SSP5_85_2069.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.56, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2070/CMIP6_Land_Use_Harmonization_range_SSP5_85_2070.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.57, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2071/CMIP6_Land_Use_Harmonization_range_SSP5_85_2071.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.58, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2072/CMIP6_Land_Use_Harmonization_range_SSP5_85_2072.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.59, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2073/CMIP6_Land_Use_Harmonization_range_SSP5_85_2073.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.60, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2074/CMIP6_Land_Use_Harmonization_range_SSP5_85_2074.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.61, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2075/CMIP6_Land_Use_Harmonization_range_SSP5_85_2075.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.62, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2076/CMIP6_Land_Use_Harmonization_range_SSP5_85_2076.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.63, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2077/CMIP6_Land_Use_Harmonization_range_SSP5_85_2077.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.64, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2078/CMIP6_Land_Use_Harmonization_range_SSP5_85_2078.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.65, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2079/CMIP6_Land_Use_Harmonization_range_SSP5_85_2079.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.66, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2080/CMIP6_Land_Use_Harmonization_range_SSP5_85_2080.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.67, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2081/CMIP6_Land_Use_Harmonization_range_SSP5_85_2081.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.68, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2082/CMIP6_Land_Use_Harmonization_range_SSP5_85_2082.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.69, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2083/CMIP6_Land_Use_Harmonization_range_SSP5_85_2083.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.70, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2084/CMIP6_Land_Use_Harmonization_range_SSP5_85_2084.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.71, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2085/CMIP6_Land_Use_Harmonization_range_SSP5_85_2085.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.72, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2086/CMIP6_Land_Use_Harmonization_range_SSP5_85_2086.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.73, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2087/CMIP6_Land_Use_Harmonization_range_SSP5_85_2087.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.74, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2088/CMIP6_Land_Use_Harmonization_range_SSP5_85_2088.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.75, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2089/CMIP6_Land_Use_Harmonization_range_SSP5_85_2089.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.76, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2090/CMIP6_Land_Use_Harmonization_range_SSP5_85_2090.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.77, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2091/CMIP6_Land_Use_Harmonization_range_SSP5_85_2091.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.78, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2092/CMIP6_Land_Use_Harmonization_range_SSP5_85_2092.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.79, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2093/CMIP6_Land_Use_Harmonization_range_SSP5_85_2093.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.80, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2094/CMIP6_Land_Use_Harmonization_range_SSP5_85_2094.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.81, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2095/CMIP6_Land_Use_Harmonization_range_SSP5_85_2095.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.82, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2096/CMIP6_Land_Use_Harmonization_range_SSP5_85_2096.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.83, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2097/CMIP6_Land_Use_Harmonization_range_SSP5_85_2097.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.84, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2098/CMIP6_Land_Use_Harmonization_range_SSP5_85_2098.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.85, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2099/CMIP6_Land_Use_Harmonization_range_SSP5_85_2099.tif","GTiff", overwrite=FALSE)

writeRaster(range_final$layer.86, file= "./Results/SSP5_85_2015_2100/CMIP6_Land_Use_Harmonization_SSP5_85_2100/CMIP6_Land_Use_Harmonization_range_SSP5_85_2100.tif","GTiff", overwrite=FALSE)

#11 Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

#dev.off(dev.list()["RStudioGD"]) ## remove all plots

################################# END #####################################################################