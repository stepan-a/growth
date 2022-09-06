ROOT_PATH = .

.PHONY: all push clean-all data cours

all: data td-build ds-build cours

data: data/pwt100.mat data/mpd2020.csv data/fra_logged_rgdp_per_capita2.dat data/gbr_logged_rgdp_per_capita.dat data/usa_logged_rgdp_per_capita2.dat data/rgdpc-density-1960.dat data/fra_logged_population.dat data/fra_k_over_y_ratio.dat

data/pwt100.csv data/mpd2020.csv: data/build.py
	@echo "Download xlsx data files (PWT and Maddison databases) and convert to CSV..."
	@cd data; ./build.py

data/pwt100.mat: data/pwt100.csv routines/pwt/build.m
	@echo "Convert PWT data into a mat file..."
	@cd routines/pwt; matlab -nosplash -nodisplay -batch "build; quit" 2> /dev/null

data/fra_logged_rgdp_per_capita2.dat: data/mpd2020.csv routines/introduction/plt_fra_logged_rgdp_per_capita.m
	@echo "Prepare plot for France historical data..."
	@cd routines/introduction; matlab -nosplash -nodisplay -batch "plt_fra_logged_rgdp_per_capita; quit" 2> /dev/null

data/gbr_logged_rgdp_per_capita.dat: data/mpd2020.csv routines/introduction/plt_gbr_logged_rgdp_per_capita.m
	@echo "Prepare plot for UK historical data..."
	@cd routines/introduction; matlab -nosplash -nodisplay -batch "plt_gbr_logged_rgdp_per_capita; quit" 2> /dev/null

data/usa_logged_rgdp_per_capita2.dat: data/mpd2020.csv routines/introduction/plt_usa_logged_rgdp_per_capita.m
	@echo "Prepare plot for US historical data..."
	@cd routines/introduction; matlab -nosplash -nodisplay -batch "plt_usa_logged_rgdp_per_capita; quit" 2> /dev/null

data/rgdpc-density-1960.dat: routines/introduction/rgdppcdensity.m
	@echo "Prepare plot for 1960 and 2000 real gdp per capita..."
	@cd routines/introduction; matlab -nosplash -nodisplay -batch "rgdppcdensity; quit" 2> /dev/null

data/fra_logged_population.dat: routines/chapitre-1/plt_fra_population_growth.m
	@echo "Prepare plots for demography in France..."
	@cd routines/chapitre-1; matlab -nosplash -nodisplay -batch "plt_fra_population_growth; quit" 2> /dev/null

data/fra_k_over_y_ratio.dat: routines/chapitre-1/plt_fra_k_over_y_ratio.m
	@echo "Prepare plots for K/Y ratio in France..."
	@cd routines/chapitre-1; matlab -nosplash -nodisplay -batch "plt_fra_k_over_y_ratio; quit" 2> /dev/null

td-build:
	$(MAKE) -C $(ROOT_PATH)/td all

ds-build:
	$(MAKE) -C $(ROOT_PATH)/ds all

cours: data
	$(MAKE) -C $(ROOT_PATH)/cours all

td-clean:
	$(MAKE) -C $(ROOT_PATH)/td clean-all

ds-clean:
	$(MAKE) -C $(ROOT_PATH)/ds clean-all

cours-clean:
	$(MAKE) -C $(ROOT_PATH)/cours clean-all

data-clean:
	rm data/*.dat data/*xlsx data/*.mat data/*.csv

clean-all: td-clean ds-clean cours-clean data-clean

push: all
	rsync -vz --progress cours/introduction.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/cours/
	rsync -vz --progress cours/solow.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/cours/
	rsync -vz --progress ds/partiel-2013.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/exam/
	rsync -vz --progress ds/partiel-2014.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/exam/
	rsync -vz --progress ds/partiel-2018.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/exam/
	rsync -vz --progress ds/correction-partiel-2013.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/exam/
	rsync -vz --progress ds/correction-partiel-2014.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/exam/
	rsync -vz --progress ds/correction-partiel-2018.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/exam/
	rsync -vz --progress td/1/td1.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/td/1/
	rsync -vz --progress td/2/td2.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/td/2/
	rsync -vz --progress td/3/td3.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/td/3/
	rsync -vz --progress td/1/correction-td1.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/td/1/
	rsync -vz --progress td/2/correction-td2.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/td/2/
	rsync -vz --progress td/3/correction-td3.pdf ulysses:/home/www/le-mans.adjemian.eu/croissance/td/3/
