using ExcelFiles, DataFrames, CSV

#MADDISON_WORLD_POPULATION="maddison.xls"
MADDISON="mpd2018.xlsx"
PWT="pwt91.xlsx"

#MADDISON_WORLD_POPULATION_PATH="http://www.ggdc.net/maddison/Historical_Statistics/vertical-file_02-2010.xls"
MADDISON_PATH="https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/mpd2018.xlsx"
PWT_PATH="https://www.rug.nl/ggdc/docs/pwt91.xlsx"

#if !isfile(MADDISON_WORLD_POPULATION)
#    download(MADDISON_WORLD_POPULATION_PATH, MADDISON_WORLD_POPULATION)
#end

if !isfile(MADDISON)
    download(MADDISON_PATH, MADDISON)
end

if !isfile(PWT)
    download(PWT_PATH, PWT)
end

#population = DataFrame(load(MADDISON_WORLD_POPULATION, "Population!A3:GA203"))
#CSV.write("maddison-pop.csv", population)

maddison = DataFrame(load(MADDISON, "Full data"))
CSV.write("mpd2018.csv", maddison)

pwt = DataFrame(load(PWT, "Data"))
CSV.write("pwt91.csv", pwt)
