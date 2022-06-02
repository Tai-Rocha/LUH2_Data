### GLOBAL LAND-USE AND LAND-COVER DATA: HISTORICAL, CURRENT AND FUTURE SCENARIOS  
#### The complete product will freely available at [zenodo](https://zenodo.org/record/6570919?fbclid=IwAR0-xOZDqmjAUvVDL2Se5zIDycGg9kAQjA5_ajrA11p0GWKt1h2bhVOctfs#.YpjhENLMLiF)  as soon as possible.


### [Webpage](https://tai-rocha.github.io/LUH2_Data/) of this repo .



## Introduction
Changes in land cover derived from human-mediated land use changes, particularly conversion of native vegetation to agriculture, is still among the greatest threats to biodiversity (Maxwell et al. 2016). Mapping land-use land-cover (LULC) changes through time is, therefore, important and desirable to predict these threats and propose effective conservation policies (Jetz et al. 2007). LULC is also an important predictor of species’ occurrence and, thus extensively used in ecological studies (Eyringet al. 2016; Ruiz-Benito et al. 2020; Sobral-Souza et al. 2021).
   
As part of the WCRP, The Land use Harmonization Project (LUH2 https://luh.umd.edu/index.shtml) provide a dataset of harmonized set of land-use scenarios that smoothly connects the historical reconstructions of land-use with the future projections in the format required for Earth System Models (ESM). The data is global with a spatial resolution of ~ 50 km, cover years from 850-2300 including land-use states, transitions and mgt layers for several representative concentration paths (RCPs) and shared social-economic paths (SSP). For more detail about the data please see the REAMDE of the raw data (https://gsweb1vh2.umd.edu/LUH2/LUH2_v2f_README_v6.pdf) and  Hurtt et al. 2006, 2011,2020 and Popp et al 2017.

Here I managed the LUH2 data from years 850 to 2100 for the latest version of the model earth system, called CMIP6 (Coupled Model Intercomparison Project Phase 6). I built R scripts to extract the "States" from NetCDF files and convert them as a Tagged Image Format File (.tif extension) that is commonly input for ecological and biogeographic analysis. I also create a new categorical data that is a land use land cover (LULC) based on twelve raw states, this LULC is important data for several spatial analysis as post-processing for species distribution models (or ecological niche models), conservation plans and many others in which it's important to incorporate them (Torres et al 2014, Falcucci et al 2017, Hanna et al 2020).

## Methods

The workflow has 4 steps, as follow: 



   - [x] 1- Extract one by one of twelve states per year from 850 to 2100 and for two future scenarios (RCP 4.5/SSP2 and RCP 8.5/SSP5)
    
      States:
        <img align="right" width="380" height="380" src="https://user-images.githubusercontent.com/11633554/109347278-aae8ce00-7851-11eb-945a-2ad8e50d6352.png" >        
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
   



## Results
Total of 17394 files, of which 16.056 are original states of LUH2 in tiff format. These are continuous raster (Fig.1). Other 1338 files are new data created by the combination of 12 original states, which are categorical data (Fig 2). <br />

<img style="float: right;" src="https://user-images.githubusercontent.com/11633554/116018875-5d9e9800-a619-11eb-858f-05daa50d0cdc.png" width="550"> <br />
Figure 1. Maps of forested primary lan states for 2020 and 2100 as originally provided by the Land-Use Harmonization project.  State values range from 0 to 1, roughly representing the likelihood that the pixel is occupied by the land use/land cover class. All other states have this structure.<br /><br /><br />


<img src="https://user-images.githubusercontent.com/11633554/115323712-fd15e380-a15e-11eb-9ac7-a3d58178f6cd.png" width="550"><br />
Figure 2. Land-use land-cover for 2020 and 2100 (LULC files). The maps are the result of a combination of the twelve land-use land-cover states of the Land-Use Harmonization dataset (LULC files) into a single file. States are represented in categorical format (state name).The data for 2100 is under a fossil-fueled development scenario (SSP5)<br /><br /><br />


<img src="https://i.imgur.com/P9J0LSS.jpg" width="530"><br />
Figure 3.  Land-use land cover comparison among years and scenarios. Data for the LULC-files for year 2020 and 2100 for the optimistic (SSP2, top) and pessimistic (SSP5, bottom) greenhouse gas scenarios, arranged in decreasing order of class area in 2020.<br /><br /><br />
<br /><br /><br />


## Acknowledgment
This initiative was only possible because the high-quality data is maintained and made publicly available by Land-Use Harmonization (https://luh.umd.edu/).
This study was developed in the context of the Brazilian Network on Global Climate Change Research (Rede CLIMA) and the National Institute for Science and Technology in Ecology, Evolution and Conservation of Biodiversity (INCT EECBio,  CNPq Grant n 465610|2014-5, FAPEG 201810267000023) and Coordination for the Improvement of Higher Education Personnel (CAPES - Grant No. 88887.373031/2019-00)

## References 

Hanna, D. E., Raudsepp‐Hearne, C., & Bennett, E. M. (2020). Effects of land use, cover, and protection on stream and riparian ecosystem services and biodiversity. Conservation Biology, 34(1), 244-255.

Hurtt, G. C., Frolking, S., Fearon, M. G., Moore, B., Shevliakova, E., Malyshev, S., ... & Houghton, R. A. (2006). The underpinnings of land‐use history: Three centuries of global gridded land‐use transitions, wood‐harvest activity, and resulting secondary lands. Global Change Biology, 12(7), 1208-1229.

Hurtt, G. C., Chini, L. P., Frolking, S., Betts, R. A., Feddema, J., Fischer, G., ... & Jones, C. D. (2011). Harmonization of land-use scenarios for the period 1500–2100: 600 years of global gridded annual land-use transitions, wood harvest, and resulting secondary lands. Climatic change, 109(1-2), 117.

Hurtt, G. C., Chini, L., Sahajpal, R., Frolking, S., Bodirsky, B. L., Calvin, K., ... & Hasegawa, T. (2020). Harmonization of global land use change and management for the period 850–2100 (LUH2) for CMIP6. Geoscientific Model Development, 13(11), 5425-5464.

Falcucci, A., Maiorano, L., & Boitani, L. (2007). Changes in land-use/land-cover patterns in Italy and their implications for biodiversity conservation. Landscape ecology, 22(4), 617-631.

Popp, A., Calvin, K., Fujimori, S., Havlik, P., Humpenöder, F., Stehfest, E., ... & Hasegawa, T. (2017). Land-use futures in the shared socio-economic pathways. Global Environmental Change, 42, 331-345.

Torres, R., Gasparri, N. I., Blendinger, P. G., & Grau, H. R. (2014). Land-use and land-cover effects on regional biodiversity distribution in a subtropical dry forest: a hierarchical integrative multi-taxa study. Regional Environmental Change, 14(4), 1549-1561.


