.PHONY: clean

clean:
	rm -f Figures/*
	rm -f 611report.pdf

clean_data: Data/vgsales.csv Scripts/data_clean.R
	Rscript Scripts/data_clean.R

Figures/Year_sales.png: Data/vgsales.csv Scripts/Year_sales.R
	mkdir -p Figures
	Rscript Scripts/Year_sales.R

Figures/Genre_sales.png: Data/vgsales.csv Scripts/Genre_sales.R
	mkdir -p Figures
	Rscript Scripts/Genre_sales.R

Figures/TOP10Platform.png: Data/vgsales.csv Scripts/TOP10Platform_sales.R
	mkdir -p Figures
	Rscript Scripts/TOP10Platform_sales.R

Figures/TOP10Publisher.png: Data/vgsales.csv Scripts/TOP10Publisher_sales.R
	mkdir -p Figures
	Rscript Scripts/TOP10Publisher_sales.R

Figures/Genre_year.png: Data/vgsales.csv Scripts/Genre_year.R
	mkdir -p Figures
	Rscript Scripts/Genre_year.R

Figures/TOP10Game_each_market.png: Data/vgsales.csv Scripts/TOP10Game_each_market.R
	mkdir -p Figures
	Rscript Scripts/TOP10Game_each_market.R


report.pdf: Data/vgsales.csv clean_data Figures/Year_sales.png Figures/Genre_sales.png Figures/TOP10Platform.png Figures/TOP10Publisher.png Figures/Genre_year.png Figures/TOP10Game_each_market.png 611Report.tex
	R -e "tinytex::pdflatex('611Report.tex')"
