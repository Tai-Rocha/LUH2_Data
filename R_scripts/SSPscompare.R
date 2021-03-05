#######################################
## SSPs comparison
## Author Tainá Rocha
#######################################


# library
library(ggplot2)
### 2020

ssps_2020 <- read.csv("./data/Accuracy/ssps_ggplot_2020.csv")

# create a dataset
tiff(file="SSPs_2020",
     width=12, height=10, units="in", res=150)
ggplot(ssps_2020, aes(fill=SSPs, y=ha, x=States)) + 
  geom_bar(position="dodge", stat="identity")

dev.off()

### 2100

ssps_100 <- read.csv("./data/Accuracy/ssps_ggplot_2100.csv")

tiff(file="SSPs_2100",
     width=12, height=10, units="in", res=150)
ggplot(ssps_100, aes(fill=SSPs, y=ha, x=States)) + 
  geom_bar(position="dodge", stat="identity")

dev.off()

## SSP_45 2020 and 2100

SSP_2_45 <- read.csv("./data/Accuracy/ssps2_45.csv")

# create a dataset
tiff(file="SSP_2_45",
     width=12, height=10, units="in", res=150)
ggplot(SSP_2_45, aes(fill=Year, y=ha, x=States)) + 
  geom_bar(position="dodge", stat="identity")

dev.off()

## SSP_45 2020 and 2100

SSP_5_85 <- read.csv("./data/Accuracy/ssps5_85.csv")

# create a dataset
tiff(file="SSP_5_85",
     width=12, height=10, units="in", res=150)
ggplot(SSP_5_85, aes(fill=Year, y=ha, x=States)) + 
  geom_bar(position="dodge", stat="identity")

dev.off()