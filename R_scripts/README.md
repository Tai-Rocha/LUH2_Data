## Instruction to run scripts.

- 1- Execute Functions.R script to create the functions which extracting layer from netCDF and then saving as TIFF format. This script also has a function that renames the variables. 
- 2- Execute 2_get_vars_t_series.R script to apply the functions in the netCDF file.
- 3- Execute the 3_Accuracy_Mask_out_Greenland.R script to remove Greeland from reference map GLC-SHARE and LUH2
- 4- Execute the 4_reclass.R script to reclassify reference map GLC-SHARE and LUH2
- 5- Execute the 5_Remove_Greeland.R script to remove Greeland for all layers
- 6- Execute the 6_SSPscompare.R script to build plots of scenarios comparison. [Input here](https://github.com/Tai-Rocha/LUH2_Data/tree/master/ssp_data_results)
