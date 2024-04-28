# -- fejlec -- #

# en ide teszem a dolgokat:
setwd('~/Work/BME/Egyéb/labgyag/krosszkulturalis/pelda')

# a fuggvenyek, amiket hasznalok, ebben a csomagban vannak:
library(tidyverse)

# -- beolvasas -- #

# betoltom a Binford Hunter-Gatherer adathalmaz kulonbozo reszeit a dplace-rol:
# a konkret adatok: milyen kulturalis kozosseg / torzs milyen tipusu tulajdonsaga milyen erteket vesz fol
data = read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/data.csv')
# a kulturalis kozossegek / torzsek reszletes adatai
societies = read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/societies.csv')
# a tulajdonsagok reszletes ismertetoi
variables = read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/variables.csv')
# a tulajdonsagok ertekeinek a reszletes ismertetoi
codes = read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/datasets/Binford/codes.csv')

# az, hogy ki hol lakik, egy masik fajlban van.
locations = read_csv('https://raw.githubusercontent.com/D-PLACE/dplace-data/master/legacy/society_locations.csv')

# -- oszlopokra szures -- #

# nem kell minden tablazatbol minden oszlop, csak a lenyeg:
# data: a torzs azonositoja, a valtozo azonositoja, a valtozo altal felvett ertek.
data = data %>% 
  select(soc_id,var_id,code)
# felulirjuk a data tablazatot az uj, kevesebb oszlopot tartalmazo tablazattal, mivel a regi nem kell majd. lent ugyanez:
# societies: a torzs azonositoja, a torzs neve, a torzs nyelvi kodja, a torzs koordinatai
societies = societies %>% 
  select(id,pref_name_for_society,glottocode,Lat,Long)
# variables: a valtozo azonositoja, kategoriaja, neve, leirasa
variables = variables %>% 
  select(id,category,title,definition)  
# oke a codes-bol kell mind a negy oszlop
# a locations-bol most csak a region kell.
locations = locations %>% 
  select(soc_id,region)

# -- oszlopok atnevezese -- #

# vigyazat! a data-ban "var_id" es "soc_id" van, de a societies-ben es a variables-ben csak "id".
# meg kell mondani az R-nek, hogy a data$soc_id oszlopa es a societies$id oszlopa ugyanaz. variables-el ugyanez.
societies = societies %>% 
  rename(soc_id = id)
variables = variables %>% 
  rename(var_id = id)

# -- osszegyuras nagy tablazatba -- #

# tablazatokat kettesevel kombinalunk.

# data es valtozok adatai:
d_long = left_join(data,variables)
# az uj, kombinalt tablazat es a societies adatai
d_long = left_join(d_long,societies)
# az uj, kombinalt tablazat es a codes adatok
d_long = left_join(d_long,codes)
# a data-t es a codes-t nem lehet osszerakni, de a data-t es a variables-t igen es a variables-t es a codes-t is igen. igy ez a sorrend a logikus.
# mar csak a locations hianyzik!
d_long = left_join(d_long,locations)
# d_long, hiszen egy hosszu adatformatum: egy meres egy sor.

# -- sorokra szures -- #

# ez most minden adat minden torzsrol. ez sok. engem konkret dolgok erdekelnek:
# gyujtogetes formaja:
# Subsistence economy: Gathering [B001]
# Subsistence economy: Hunting [B002]
# Subsistence economy: Fishing [B003]
# es:
# anyagi dolgok!
# Use of money [B033]
# Ownership of resource locations [B037]

# a d_long-ban minden sor egy konkret meres. tehat ha valtozokat akarok kivalasztani, akkor sorokra kell szurnom:

d_long = d_long %>% 
  filter(
    var_id %in% c('B001', 'B002', 'B003', 'B033', 'B037'),
    # es csak az ausztralok erdekelnek:
    region == 'Australia'
  )

# ha ossze akarom hasonlitani egymassal a kulonbozo tulajdonsagokat, akkor kell egy olyan adattabla is, ahol nem egymas ALATT vannak (long), hanem egymas MELLETT (wide). ezt ket lepcsoben tudom megcsinalni:

d_wide = d_long %>% 
  # csak a feltetlenul szukseges oszlopokat tartom meg: par info a torzsrol / kozossegrol, es a tulajdonsagok NEVE es FELVETT ERTEKE (title, code):
  select(soc_id,pref_name_for_society,title,code) %>% 
  # es most kulon title es code oszlop helyett lesz ot olyan oszlop, aminek a neve a title, es az ertekei a code:
  pivot_wider(names_from = title, values_from = code)

# itt most egy meres egy sor:
d_long
# itt pedig egy torzs / kozosseg egy sor:
d_wide

# -- kiirjuk -- #

write_tsv(d_long, 'd_long.tsv')
write_tsv(d_wide, 'd_wide.tsv')
