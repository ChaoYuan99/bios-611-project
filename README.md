***BIOS 611 PROJECT***
***

***Video Games Sales***

***Abstract***

This dataset contains a list of video games with sales greater than 100,000 copies. It was generated by a scrape of [vgchartz.com](http://www.vgchartz.com/).

Fields include

Rank - Ranking of overall sales

Name - The games name

Platform - Platform of the games release (i.e. PC,PS4, etc.)

Year - Year of the game's release

Genre - Genre of the game

Publisher - Publisher of the game

NA_Sales - Sales in North America (in millions)

EU_Sales - Sales in Europe (in millions)

JP_Sales - Sales in Japan (in millions)

Other_Sales - Sales in the rest of the world (in millions)

Global_Sales - Total worldwide sales.
***
***Environment Configuration***
1. Build docker image with local Dockerfile path
```
docker build .  -f /Users/ycapp/611dockerfile/Dockerfile.txt  -t 611chao
```

2. Creat a container based on new image
```
docker run -v /$(pwd):/home/rstudio/work -e PASSWORD=mypassword --rm -p 8787:8787 611chao
```
***
***Create Report***

Create report with Makefile
```
make report.pdf
```
***
***Shiny Configuration***
```
docker run -p 8080:8080 -p 8787:8787 -e PASSWORD=mypassword -v /$(pwd):/home/rstudio/project -t 611chao
```
***Run Shiny App***
```
Rscript shiny-hello.R
```
