#!/usr/bin/python3

import pandas as pd

MADDISON = 'mpd2018'
PWT ='pwt91'

MADDISON_PATH = 'https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/'+MADDISON+'.xlsx'
PWT_PATH = 'https://www.rug.nl/ggdc/docs/'+PWT+'.xlsx'

data = pd.read_excel(PWT+'.xlsx', 'Data', dtype=str, index_col=None)
data.to_csv(PWT+'.csv', encoding='utf-8', index=False)

data = pd.read_excel(MADDISON+'.xlsx', 'Full data', dtype=str, index_col=None)
data.to_csv(MADDISON+'.csv', encoding='utf-8', index=False)
