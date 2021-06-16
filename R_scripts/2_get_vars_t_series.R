########################################################################################
# Get states
# 4.1 prerelease R version 
########################################################################################

#Librarys
library(sp)
library(raster)
library(rgdal)
library(ncdf4)
library(logr)
library(rdtLite)

## Provenance Collector
prov.init(
  prov.dir = "./",
  overwrite = TRUE,
  snapshot.size = 0,
  hash.algorithm = "md5",
  save.debug = FALSE)


## Log collector
log_open(file_name = "", logdir = TRUE, show_notes = TRUE, autolog = TRUE)

## Initial setting 
# Get the coordinate reference system (CRS) for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#3 Get the coordinate reference system (CRS) for raster
epsg <- make_EPSG() # call the list of epsg
head(epsg) # search for epsg 4326 and put below
crs_object <-"+proj=longlat +datum=WGS84" #object of crs

#Open NetCDF
states_45_SSP2 <- nc_open("./data/multiple-states_input4MIPs_landState_ScenarioMIP_UofMD-MESSAGE-ssp245-2-1-f_gn_2015-2100.nc", write=TRUE, readunlim=TRUE, verbose = TRUE, auto_GMT = TRUE, suppress_dimvals = FALSE)


########################################################################################
# Get states
########################################################################################

#Call variables, it's is deliminted by index, i.e "[[]]". The object must call "varr" for funtions works. 

# primf
varr <- states_45_SSP2$var[[1]]  

# Call function creates in script 1_funtions 

primf <- netcdf_extract(varr) 

log_print(primf)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_primf_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots

## primn

varr <- states_45_SSP2$var[[2]]  ## Take primn variable

# Call function creates in script 1_funtions 

primn <- netcdf_extract(varr) 

log_print(primn)


# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_primn_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots

## secdf
varr <- states_45_SSP2$var[[3]]  ## Take secdf variable

secdf <- netcdf_extract(varr) 

log_print(secdf)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_secdf_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots


## secdn 
varr <- states_45_SSP2$var[[4]]  ## Take secdn variable

secdn <- netcdf_extract(varr) 

log_print(secdn)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_secdn_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots

## urban
varr <- states_45_SSP2$var[[5]]  ## Take urban variable

urban <- netcdf_extract(varr) 

log_print(urban)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_urban_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots

## c3ann
varr <- states_45_SSP2$var[[6]]  ## Take c3ann variable

c3ann <- netcdf_extract(varr) 

log_print(c3ann)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_c3ann_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots

## c4ann
varr <- states_45_SSP2$var[[7]]  ## Take c4ann variable

c4ann <- netcdf_extract(varr) 

log_print(c4ann)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names. You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_c4ann_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots


## c3per
varr <- states_45_SSP2$var[[8]]  ## Take c3per variable

c3per <- netcdf_extract(varr) 

log_print(c3per)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_c3per_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots


## c4per
varr <- states_45_SSP2$var[[9]]  ## Take c4per variable

c4per <- netcdf_extract(varr) 

log_print(c4per)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_c4per_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots


## c3nfx
varr <- states_45_SSP2$var[[10]]  ## Take c3nfx variable

c3nfx <- netcdf_extract(varr) 

log_print(c3nfx)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_c3nfx_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots


## pastr
varr <- states_45_SSP2$var[[11]]  ## Take pastr variable

pastr <- netcdf_extract(varr) 

log_print(pastr)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_pastr_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots


## range
varr <- states_45_SSP2$var[[12]]  ## Take range variable

range <- netcdf_extract(varr) 

log_print(range)

# List Old names
old_files <- list.files("./Results/SSP2_45_2015_2100/", pattern = "*.tif", full.names = TRUE)
old_files

# Create new names You need change this
new_files <- paste0("./Results/SSP2_45_2015_2100/CMIP6_Land_Use_Harmonization_range_ssp2_45_",2015:2100,".tif")   
new_files

## Call new_fnames funtion . Rename files and then remove olds files 
new_fnames(old_files)

## Clean environment and plots
rm(list=ls()) ## list all environment objects and remove

dev.off(dev.list()["RStudioGD"]) ## remove all plots

log_close()

prov.quit()
