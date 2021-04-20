# Global land-use and land-cover (LULC) data under historical, current, and future climatic conditions for ecologists.

### Ps.: The complete product and dataset generated are in the submission process and will freely available in ecoClime (https://www.ecoclimate.org/) database as soon as possible



## Welcome 
The World Climate Research Programme (WCRP, https://www.wcrp-climate.org/) is the main organization that addresses questions related to the coupled climate system, providing many products of past, present, and future climatic and land cover global conditions. Several initiatives redistribute this data according to their needs and demands as Wordclim (https://www.worldclim.org/), Paleoclim (http://www.paleoclim.org/), Ecoclimate (https://www.ecoclimate.org/) and others.

As part of the WCRP, The Land use Harmonization Project (LUH2 https://luh.umd.edu/index.shtml) provide a dataset of harmonized set of land-use scenarios that smoothly connects the historical reconstructions of land-use with the future projections in the format required for Earth System Models (ESM). The data is global with a spatial resolution of ~ 50 km, cover years from 850-2300 including land-use states, transitions and mgt layers for several representative concentration paths (RCPs) and social-economic paths (SSP). For more detail about the data please see the REAMDE of the raw data (https://gsweb1vh2.umd.edu/LUH2/LUH2_v2f_README_v6.pdf) and  Hurtt et al. 2006, 2011,2020 and Popp et al 2017.

Here we managed the LUH2 data (https://luh.umd.edu/data.shtml) for the latest version of the model earth system, called CMPI6 (Coupled Model Intercomparison Project Phase 6). We built an R script to convert the "States" NetCDF files in Tagged Image Format File (.tif extension) that is commonly input for ecological and biogeographic analysis.  We also create a new categorical data that is a land use land cover (LULC) based on twelve raw states, this LULC is important data for several spatial analysis as post-processing for species distribution models (or ecological niche models), conservation plans and many others in which it's important to incorporate (Torres et al 2014, Falcucci et al 2017, Hanna et al 2020). 

Our workflow has 4 steps, as follow: 

   - [x] 1- Extract one by one of twelve states per year from 850 to 2100 and for two future scenarios (RCP 4.5/SSP2 and RCP 8.5/SSP5)
    
      States:
      - primf: forested primary land
      - primn: non-forested primary land
      - secdf: potentially forested secondary land
      - secdn: potentially non-forested secondary land
      - pastr: managed pasture
      - range: rangeland
      - urban: urban land
      - c3ann: C3 annual crops
      - c3per: C3 perennial crops
      - c4ann: C4 annual crops
      - c4per: C4 perennial crops
      - c3nfx: C3 nitrogen-fixing crops

   - [x] 2- Save every single state (which is continuous data) as a TIF format
   - [x] 3- We created a new data that is Lad use land cover data with 12 states
   - [X] 4- LULC validation 
   
<img src="https://user-images.githubusercontent.com/11633554/109347278-aae8ce00-7851-11eb-945a-2ad8e50d6352.png" width="550">




## Land use Land cover data (new data derived from 12 states). Data for 2020 and 2100 years: 

<img src="https://user-images.githubusercontent.com/11633554/115323712-fd15e380-a15e-11eb-9ac7-a3d58178f6cd.png" width="550">

## Shared Socioeconomic Pathways and years compare among states

<img src="https://user-images.githubusercontent.com/11633554/115323856-3bab9e00-a15f-11eb-95ef-772cf0444f25.png" width="550">



## References 

Hanna, D. E., Raudsepp‐Hearne, C., & Bennett, E. M. (2020). Effects of land use, cover, and protection on stream and riparian ecosystem services and biodiversity. Conservation Biology, 34(1), 244-255.

Hurtt, G. C., Frolking, S., Fearon, M. G., Moore, B., Shevliakova, E., Malyshev, S., ... & Houghton, R. A. (2006). The underpinnings of land‐use history: Three centuries of global gridded land‐use transitions, wood‐harvest activity, and resulting secondary lands. Global Change Biology, 12(7), 1208-1229.

Hurtt, G. C., Chini, L. P., Frolking, S., Betts, R. A., Feddema, J., Fischer, G., ... & Jones, C. D. (2011). Harmonization of land-use scenarios for the period 1500–2100: 600 years of global gridded annual land-use transitions, wood harvest, and resulting secondary lands. Climatic change, 109(1-2), 117.

Hurtt, G. C., Chini, L., Sahajpal, R., Frolking, S., Bodirsky, B. L., Calvin, K., ... & Hasegawa, T. (2020). Harmonization of global land use change and management for the period 850–2100 (LUH2) for CMIP6. Geoscientific Model Development, 13(11), 5425-5464.

Falcucci, A., Maiorano, L., & Boitani, L. (2007). Changes in land-use/land-cover patterns in Italy and their implications for biodiversity conservation. Landscape ecology, 22(4), 617-631.

Popp, A., Calvin, K., Fujimori, S., Havlik, P., Humpenöder, F., Stehfest, E., ... & Hasegawa, T. (2017). Land-use futures in the shared socio-economic pathways. Global Environmental Change, 42, 331-345.

Torres, R., Gasparri, N. I., Blendinger, P. G., & Grau, H. R. (2014). Land-use and land-cover effects on regional biodiversity distribution in a subtropical dry forest: a hierarchical integrative multi-taxa study. Regional Environmental Change, 14(4), 1549-1561.


