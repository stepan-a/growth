using ExcelFiles, DataFrames

MADDISON="mpd2018.xlsx"
PWT="pwt90.xlsx"

MADDISON_PATH="https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/mpd2018.xlsx"
PWT_PATH="https://www.rug.nl/ggdc/docs/pwt90.xlsx"

if !isfile(MADDISON)
    download(MADDISON_PATH, MADDISON)
end

if !isfile(PWT)
    download(PWT_PATH, PWT)
end

maddison = DataFrame(load(MADDISON,"Full data"))

pwt = DataFrame(load(PWT, "Data"))
