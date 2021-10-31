clean_Year:
	vgsales <- vgsales[,-1]
	vgsales <- vgsales[vgsales$Year!='NA',]
	vgsales <- vgsales[vgsales$Year!=2017,]
	vgsales <- vgsales[vgsales$Year!=2020,]
	vgsales <- vgsales[vgsales$Year!='Adventure',]

clean_Publisher:
	vgsales <- vgsales[,-1]
	vgsales <- vgsales[vgsales$Publisher!='NA',]
