#!/usr/bin/python3

import urllib.request as url
import pandas as pd

MADDISON = 'mpd2018'
PWT ='pwt91'

MADDISON_PATH = 'https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/'+MADDISON+'.xlsx'
PWT_PATH = 'https://www.rug.nl/ggdc/docs/'+PWT+'.xlsx'

File = url.urlopen(MADDISON_PATH)
data = File.read()
with open('./'+MADDISON+'.xlsx', 'wb') as f:
    f.write(data)

data = pd.read_excel(MADDISON+'.xlsx', 'Full data', dtype=str, index_col=None)
data.to_csv(MADDISON+'.csv', encoding='utf-8', index=False)

File = url.urlopen(PWT_PATH)
data = File.read()
with open('./'+PWT+'.xlsx', 'wb') as f:
    f.write(data)

data = pd.read_excel(PWT+'.xlsx', 'Data', dtype=str, index_col=None)
data.to_csv(PWT+'.csv', encoding='utf-8', index=False)
