####################################################
## Script to create folders years from 850 to 2015
## Author: Tainá Rocha
####################################################

#1 Create directory per year. First a read the tables with de subfolders names
table_8502015 <- read.csv("./data/tables_to_write_in_rscripts/table_850_2015_subfolders.csv")
subfolder_names <- c(table_8502015[1:1166,])

#2 Loop to crate these folders in singles folder 

for (j in 1: length(subfolder_names)){
  dir.create(paste0("./Results/850_2015/",subfolder_names[j]))
}