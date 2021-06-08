##########################################################################################
## Generate Land-use Land-cover raster from 12 states of Land-use Harmonization Project
## To build this raster, for each pixel the higest value among 12 states is assumed. 
## Author script: Tainá Rocha
## 4.02 R version
##########################################################################################

## Librarys

library(raster)
library(stats)

## Initial set

setwd("./Results/SSP5_85_2015_2100/") # Set the parental folder

## Creating a list and select the subdirectories  


stack.list <- list()  # Create a empty list for years stacks

sub <- list.dirs(full.names=TRUE, recursive=FALSE) # List the subdirectories


### Automating through loop "for"

for(j in 1:length(sub)) {
  print(sub[j])
  
  h <- list.files(path=sub[j], recursive= FALSE, full.names=TRUE,  pattern='.tif')
  print(h)
  
  stack.list[[j]] <- stack(h)
  
}

LULC_2015_SSP5_85 <- which.max(stack.list[[1]])
writeRaster(LULC_2015_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2015/LULC_2015_SSP5_85_CMIP6.tif")

LULC_2016_SSP5_85 <- which.max(stack.list[[2]])
writeRaster(LULC_2016_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2016/LULC_2016_SSP5_85_CMIP6.tif")

LULC_2017_SSP5_85 <- which.max(stack.list[[3]])
writeRaster(LULC_2017_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2017/LULC_2017_SSP5_85_CMIP6.tif")

LULC_2018_SSP5_85 <- which.max(stack.list[[4]])
writeRaster(LULC_2018_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2018/LULC_2018_SSP5_85_CMIP6.tif")

LULC_2019_SSP5_85 <- which.max(stack.list[[5]])
writeRaster(LULC_2019_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2019/LULC_2019_SSP5_85_CMIP6.tif")

LULC_2020_SSP5_85 <- which.max(stack.list[[6]])
writeRaster(LULC_2020_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2020/LULC_2020_SSP5_85_CMIP6.tif")

LULC_2021_SSP5_85 <- which.max(stack.list[[7]])
writeRaster(LULC_2021_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2021/LULC_2021_SSP5_85_CMIP6.tif")

LULC_2022_SSP5_85 <- which.max(stack.list[[8]])
writeRaster(LULC_2022_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2022/LULC_2022_SSP5_85_CMIP6.tif")

LULC_2023_SSP5_85 <- which.max(stack.list[[9]])
writeRaster(LULC_2023_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2023/LULC_2023_SSP5_85_CMIP6.tif")

LULC_2024_SSP5_85 <- which.max(stack.list[[10]])
writeRaster(LULC_2024_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2024/LULC_2024_SSP5_85_CMIP6.tif")

LULC_2025_SSP5_85 <- which.max(stack.list[[11]])
writeRaster(LULC_2025_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2025/LULC_2025_SSP5_85_CMIP6.tif")

LULC_2026_SSP5_85 <- which.max(stack.list[[12]])
writeRaster(LULC_2026_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2026/LULC_2026_SSP5_85_CMIP6.tif")

LULC_2027_SSP5_85 <- which.max(stack.list[[13]])
writeRaster(LULC_2027_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2027/LULC_2027_SSP5_85_CMIP6.tif")

LULC_2028_SSP5_85 <- which.max(stack.list[[14]])
writeRaster(LULC_2028_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2028/LULC_2028_SSP5_85_CMIP6.tif")

LULC_2029_SSP5_85 <- which.max(stack.list[[15]])
writeRaster(LULC_2029_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2029/LULC_2029_SSP5_85_CMIP6.tif")

LULC_2030_SSP5_85 <- which.max(stack.list[[16]])
writeRaster(LULC_2030_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2030/LULC_2030_SSP5_85_CMIP6.tif")

LULC_2031_SSP5_85 <- which.max(stack.list[[17]])
writeRaster(LULC_2031_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2031/LULC_2031_SSP5_85_CMIP6.tif")

LULC_2032_SSP5_85 <- which.max(stack.list[[18]])
writeRaster(LULC_2032_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2032/LULC_2032_SSP5_85_CMIP6.tif")

LULC_2033_SSP5_85 <- which.max(stack.list[[19]])
writeRaster(LULC_2033_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2033/LULC_2033_SSP5_85_CMIP6.tif")

LULC_2034_SSP5_85 <- which.max(stack.list[[20]])
writeRaster(LULC_2034_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2034/LULC_2034_SSP5_85_CMIP6.tif")

LULC_2035_SSP5_85 <- which.max(stack.list[[21]])
writeRaster(LULC_2035_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2035/LULC_2035_SSP5_85_CMIP6.tif")

LULC_2036_SSP5_85 <- which.max(stack.list[[22]])
writeRaster(LULC_2036_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2036/LULC_2036_SSP5_85_CMIP6.tif")

LULC_2037_SSP5_85 <- which.max(stack.list[[23]])
writeRaster(LULC_2037_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2037/LULC_2037_SSP5_85_CMIP6.tif")

LULC_2038_SSP5_85 <- which.max(stack.list[[24]])
writeRaster(LULC_2038_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2038/LULC_2038_SSP5_85_CMIP6.tif")

LULC_2039_SSP5_85 <- which.max(stack.list[[25]])
writeRaster(LULC_2039_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2039/LULC_2039_SSP5_85_CMIP6.tif")

LULC_2040_SSP5_85 <- which.max(stack.list[[26]])
writeRaster(LULC_2040_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2040/LULC_2040_SSP5_85_CMIP6.tif")

LULC_2041_SSP5_85 <- which.max(stack.list[[27]])
writeRaster(LULC_2041_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2041/LULC_2041_SSP5_85_CMIP6.tif")

LULC_2042_SSP5_85 <- which.max(stack.list[[28]])
writeRaster(LULC_2042_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2042/LULC_2042_SSP5_85_CMIP6.tif")

LULC_2043_SSP5_85 <- which.max(stack.list[[29]])
writeRaster(LULC_2043_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2043/LULC_2043_SSP5_85_CMIP6.tif")

LULC_2044_SSP5_85 <- which.max(stack.list[[30]])
writeRaster(LULC_2044_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2044/LULC_2044_SSP5_85_CMIP6.tif")

LULC_2045_SSP5_85 <- which.max(stack.list[[31]])
writeRaster(LULC_2045_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2045/LULC_2045_SSP5_85_CMIP6.tif")

LULC_2046_SSP5_85 <- which.max(stack.list[[32]])
writeRaster(LULC_2046_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2046/LULC_2046_SSP5_85_CMIP6.tif")

LULC_2047_SSP5_85 <- which.max(stack.list[[33]])
writeRaster(LULC_2047_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2047/LULC_2047_SSP5_85_CMIP6.tif")

LULC_2048_SSP5_85 <- which.max(stack.list[[34]])
writeRaster(LULC_2048_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2048/LULC_2048_SSP5_85_CMIP6.tif")

LULC_2049_SSP5_85 <- which.max(stack.list[[35]])
writeRaster(LULC_2049_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2049/LULC_2049_SSP5_85_CMIP6.tif")

LULC_2050_SSP5_85 <- which.max(stack.list[[36]])
writeRaster(LULC_2050_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2050/LULC_2050_SSP5_85_CMIP6.tif")

LULC_2051_SSP5_85 <- which.max(stack.list[[37]])
writeRaster(LULC_2051_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2051/LULC_2051_SSP5_85_CMIP6.tif")

LULC_2052_SSP5_85 <- which.max(stack.list[[38]])
writeRaster(LULC_2052_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2052/LULC_2052_SSP5_85_CMIP6.tif")

LULC_2053_SSP5_85 <- which.max(stack.list[[39]])
writeRaster(LULC_2053_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2053/LULC_2053_SSP5_85_CMIP6.tif")

LULC_2054_SSP5_85 <- which.max(stack.list[[40]])
writeRaster(LULC_2054_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2054/LULC_2054_SSP5_85_CMIP6.tif")

LULC_2055_SSP5_85 <- which.max(stack.list[[41]])
writeRaster(LULC_2055_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2055/LULC_2055_SSP5_85_CMIP6.tif")

LULC_2056_SSP5_85 <- which.max(stack.list[[42]])
writeRaster(LULC_2056_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2056/LULC_2056_SSP5_85_CMIP6.tif")

LULC_2057_SSP5_85 <- which.max(stack.list[[43]])
writeRaster(LULC_2057_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2057/LULC_2057_SSP5_85_CMIP6.tif")

LULC_2058_SSP5_85 <- which.max(stack.list[[44]])
writeRaster(LULC_2058_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2058/LULC_2058_SSP5_85_CMIP6.tif")

LULC_2059_SSP5_85 <- which.max(stack.list[[45]])
writeRaster(LULC_2059_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2059/LULC_2059_SSP5_85_CMIP6.tif")

LULC_2060_SSP5_85 <- which.max(stack.list[[46]])
writeRaster(LULC_2060_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2060/LULC_2060_SSP5_85_CMIP6.tif")

LULC_2061_SSP5_85 <- which.max(stack.list[[47]])
writeRaster(LULC_2061_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2061/LULC_2061_SSP5_85_CMIP6.tif")

LULC_2062_SSP5_85 <- which.max(stack.list[[48]])
writeRaster(LULC_2062_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2062/LULC_2062_SSP5_85_CMIP6.tif")

LULC_2063_SSP5_85 <- which.max(stack.list[[49]])
writeRaster(LULC_2063_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2063/LULC_2063_SSP5_85_CMIP6.tif")

LULC_2064_SSP5_85 <- which.max(stack.list[[50]])
writeRaster(LULC_2064_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2064/LULC_2064_SSP5_85_CMIP6.tif")

LULC_2065_SSP5_85 <- which.max(stack.list[[51]])
writeRaster(LULC_2065_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2065/LULC_2065_SSP5_85_CMIP6.tif")

LULC_2066_SSP5_85 <- which.max(stack.list[[52]])
writeRaster(LULC_2066_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2066/LULC_2066_SSP5_85_CMIP6.tif")

LULC_2067_SSP5_85 <- which.max(stack.list[[53]])
writeRaster(LULC_2067_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2067/LULC_2067_SSP5_85_CMIP6.tif")

LULC_2068_SSP5_85 <- which.max(stack.list[[54]])
writeRaster(LULC_2068_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2068/LULC_2068_SSP5_85_CMIP6.tif")

LULC_2069_SSP5_85 <- which.max(stack.list[[55]])
writeRaster(LULC_2069_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2069/LULC_2069_SSP5_85_CMIP6.tif")

LULC_2070_SSP5_85 <- which.max(stack.list[[56]])
writeRaster(LULC_2070_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2070/LULC_2070_SSP5_85_CMIP6.tif")

LULC_2071_SSP5_85 <- which.max(stack.list[[57]])
writeRaster(LULC_2071_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2071/LULC_2071_SSP5_85_CMIP6.tif")

LULC_2072_SSP5_85 <- which.max(stack.list[[58]])
writeRaster(LULC_2072_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2072/LULC_2072_SSP5_85_CMIP6.tif")

LULC_2073_SSP5_85 <- which.max(stack.list[[59]])
writeRaster(LULC_2073_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2073/LULC_2073_SSP5_85_CMIP6.tif")

LULC_2074_SSP5_85 <- which.max(stack.list[[60]])
writeRaster(LULC_2074_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2074/LULC_2074_SSP5_85_CMIP6.tif")

LULC_2075_SSP5_85 <- which.max(stack.list[[61]])
writeRaster(LULC_2075_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2075/LULC_2075_SSP5_85_CMIP6.tif")

LULC_2076_SSP5_85 <- which.max(stack.list[[62]])
writeRaster(LULC_2076_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2076/LULC_2076_SSP5_85_CMIP6.tif")

LULC_2077_SSP5_85 <- which.max(stack.list[[63]])
writeRaster(LULC_2077_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2077/LULC_2077_SSP5_85_CMIP6.tif")

LULC_2078_SSP5_85 <- which.max(stack.list[[64]])
writeRaster(LULC_2078_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2078/LULC_2078_SSP5_85_CMIP6.tif")

LULC_2079_SSP5_85 <- which.max(stack.list[[65]])
writeRaster(LULC_2079_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2079/LULC_2079_SSP5_85_CMIP6.tif")

LULC_2080_SSP5_85 <- which.max(stack.list[[66]])
writeRaster(LULC_2080_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2080/LULC_2080_SSP5_85_CMIP6.tif")

LULC_2081_SSP5_85 <- which.max(stack.list[[67]])
writeRaster(LULC_2081_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2081/LULC_2081_SSP5_85_CMIP6.tif")

LULC_2082_SSP5_85 <- which.max(stack.list[[68]])
writeRaster(LULC_2082_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2082/LULC_2082_SSP5_85_CMIP6.tif")

LULC_2083_SSP5_85 <- which.max(stack.list[[69]])
writeRaster(LULC_2083_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2083/LULC_2083_SSP5_85_CMIP6.tif")

LULC_2084_SSP5_85 <- which.max(stack.list[[70]])
writeRaster(LULC_2084_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2084/LULC_2084_SSP5_85_CMIP6.tif")

LULC_2085_SSP5_85 <- which.max(stack.list[[71]])
writeRaster(LULC_2085_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2085/LULC_2085_SSP5_85_CMIP6.tif")

LULC_2086_SSP5_85 <- which.max(stack.list[[72]])
writeRaster(LULC_2086_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2086/LULC_2086_SSP5_85_CMIP6.tif")

LULC_2087_SSP5_85 <- which.max(stack.list[[73]])
writeRaster(LULC_2087_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2087/LULC_2087_SSP5_85_CMIP6.tif")

LULC_2088_SSP5_85 <- which.max(stack.list[[74]])
writeRaster(LULC_2088_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2088/LULC_2088_SSP5_85_CMIP6.tif")

LULC_2089_SSP5_85 <- which.max(stack.list[[75]])
writeRaster(LULC_2089_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2089/LULC_2089_SSP5_85_CMIP6.tif")

LULC_2090_SSP5_85 <- which.max(stack.list[[76]])
writeRaster(LULC_2090_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2090/LULC_2090_SSP5_85_CMIP6.tif")

LULC_2091_SSP5_85 <- which.max(stack.list[[77]])
writeRaster(LULC_2091_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2091/LULC_2091_SSP5_85_CMIP6.tif")

LULC_2092_SSP5_85 <- which.max(stack.list[[78]])
writeRaster(LULC_2092_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2092/LULC_2092_SSP5_85_CMIP6.tif")

LULC_2093_SSP5_85 <- which.max(stack.list[[79]])
writeRaster(LULC_2093_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2093/LULC_2093_SSP5_85_CMIP6.tif")

LULC_2094_SSP5_85 <- which.max(stack.list[[80]])
writeRaster(LULC_2094_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2094/LULC_2094_SSP5_85_CMIP6.tif")

LULC_2095_SSP5_85 <- which.max(stack.list[[81]])
writeRaster(LULC_2095_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2095/LULC_2095_SSP5_85_CMIP6.tif")

LULC_2096_SSP5_85 <- which.max(stack.list[[82]])
writeRaster(LULC_2096_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2096/LULC_2096_SSP5_85_CMIP6.tif")

LULC_2097_SSP5_85 <- which.max(stack.list[[83]])
writeRaster(LULC_2097_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2097/LULC_2097_SSP5_85_CMIP6.tif")

LULC_2098_SSP5_85 <- which.max(stack.list[[84]])
writeRaster(LULC_2098_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2098/LULC_2098_SSP5_85_CMIP6.tif")

LULC_2099_SSP5_85 <- which.max(stack.list[[85]])
writeRaster(LULC_2099_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2099/LULC_2099_SSP5_85_CMIP6.tif")

LULC_2100_SSP5_85 <- which.max(stack.list[[86]])
writeRaster(LULC_2100_SSP5_85, "./CMIP6_Land_Use_Harmonization_SSP5_85_2100/LULC_2100_SSP5_85_CMIP6.tif")


################# End

