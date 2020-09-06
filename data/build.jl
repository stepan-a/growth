using ExcelFiles, DataFrames, CSV

MADDISON="mpd2018.xlsx"
PWT="pwt91.xlsx"

MADDISON_PATH="https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/mpd2018.xlsx"
PWT_PATH="https://www.rug.nl/ggdc/docs/pwt91.xlsx"

if !isfile(MADDISON)
    download(MADDISON_PATH, MADDISON)
end

if !isfile(PWT)
    download(PWT_PATH, PWT)
end

maddison = DataFrame(load(MADDISON,"Full data"))
CSV.write("mpd2018.csv", maddison)

pwt = DataFrame(load(PWT, "Data"))
CSV.write("pwt91.csv", pwt)
