# load libraries

import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# set working directory to '~/Work/BME/Egyéb/labgyag/krosszkulturalis/pelda'
os.chdir('~/Work/BME/Egyéb/labgyag/krosszkulturalis/pelda')

# -- read data from url -- #

# society - variable data
data = pd.read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/data.csv')
# society data
societies = pd.read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/societies.csv')
# variable data
variables = pd.read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/variables.csv')
# variable codes
codes = pd.read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/codes.csv')
# society locations
locations = pd.read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/legacy/society_locations.csv')

# -- filter for columns -- #

data = data[['soc_id', 'var_id', 'code']]
societies = societies[['id', 'pref_name_for_society', 'glottocode', 'Lat', 'Long']]
variables = variables[['id', 'category', 'title', 'definition']]
locations = locations[['soc_id', 'region']]

# -- rename columns -- #

societies = societies.rename(columns={'id':'soc_id'})
variables = variables.rename(columns={'id':'var_id'})

# -- merge dataframes -- #

# merge dataframes: data, variables, societies, codes, locations
d_long = pd.merge(data, variables, on='var_id', how='left')
d_long = pd.merge(d_long, societies, on='soc_id', how='left')
d_long = pd.merge(d_long, codes, how='left')
d_long = pd.merge(d_long, locations, on='soc_id', how='left')

# -- filter for rows -- #

d_long = d_long[d_long['var_id'].isin(['B001', 'B002', 'B003', 'B033', 'B037'])]
d_long = d_long[d_long['region'] == 'Australia']

# from d_long select soc_id, pref_name_for_society, title, code
d_wide = d_long[['soc_id', 'pref_name_for_society', 'title', 'code']]
# from d_wide pivot names from title values from code
d_wide = d_wide.pivot(index='soc_id', columns='title', values='code')

# -- write data to file -- #

d_long.to_csv('d_long.csv')
d_wide.to_csv('d_wide.csv')
