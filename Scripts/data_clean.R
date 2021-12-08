vgsales <- read.csv("Data/vgsales.csv")
#view some information of this dataset

#data conversion and cleaning
vgsales <- data.frame(vgsales)
for (i in 3:6){
  vgsales[,i] <- as.factor(vgsales[,i])
}
vgsales <- vgsales[,-1] #rank makes no sense here
summary(vgsales)
# the attributes of Year and Publisher have N/A value
vgsales <- vgsales[vgsales$Year!='N/A',]
vgsales <- vgsales[vgsales$Publisher!='N/A',]

#Year_sales
#2017 and 2020 have too little data

vgsales <- vgsales[vgsales$Year!=2020,]
vgsales <- vgsales[vgsales$Year!='Adventure',]
