## Kognitív Tudományi Tanszék Laborgyakorlat

**Fontos dátumok**

1. március 7: labgyak választás
2. március 28: előregisztráció első verzió határideje (ld lentebb)
3. projekt leadás határideje (ld lentebb)

**Jegyszerzéshez kell**

- időben leadott előregisztráció, amire azt írtam, hogy okés
- Github repository a felhasznált kódokkal és a végső adattáblával
- Beszámoló __pdf__-ben, felhasznált irodalommal, legalább három ábrával, legalább két oldal.

Ez a repo demonstrálja azt a fajta minimális megoldást, amit a laborgyakorlat órán az adatelemzős projektemre várok, R-ben és pythonban. Lent a feladat részletesebb leírását találjátok.

__A megfejtést a labgyak határidejéig [ide](https://docs.google.com/forms/d/e/1FAIpQLSeuWb9V5Hj1VeuG_8V47HYaJI6WNuJ8BobjakvXmnvQo66CUA/viewform?usp=dialog) kell feltöltened.__

Tartalom:

- helper.R: adatokat kombináló helper file, R-ben
- beszamolo.Rmd: beszámoló, Rmarkdownban
- helper.py:  adatokat kombináló helper file, pythonban
- beszamolo.ipynb: beszámoló, jupyter notebookban
- d_long, d_wide: adatfájl, a helper fájlok kimenete, a beszamolo fájlok bemenete

## Krosszkulturális kutatások

- Igaz-e az, hogy x dolog és y dolog együttállnak a rendelkezésre álló néprajzi adatokban?
- Nehéz: x-et és y-t is lehet többféleképpen meghatározni
- Nehéz: sokféle néprajzi adat van

## Példák

| x | y |
| --- | --- |
| egy kultúra milyen családmodelleket fogad el | milyen szavai vannak a rokonokra |
| milyen rugalmatlan és komplex egy kultúra | mennyire vannak jelen megszállottságra és transzra épülő vallási kultuszok | 
| mennyire zord az éghajlat | mennyire hisszük azt, hogy az istenek adnak / elvesznek kaját | 
| mennyire összetett egy kultúra | mennyire hiszünk morális felsőbbrendű lényekben | 
| milyen száraz a klíma | milyen nyelvet beszélnek az emberek | 
| milyen a kulturális szerkezet | mennyire vágják ki a fákat | 
| kulturális szervezettség | női együttműködés formái |

## Linkek a példákhoz

- [család](https://onlinelibrary.wiley.com/doi/full/10.1111/tops.12430),
- [transz](https://www.tandfonline.com/doi/full/10.1080/2153599X.2023.2224447),
- [kaja](https://link.springer.com/article/10.1007/s12110-020-09371-8#Sec24),
- [istenek](https://www.pnas.org/doi/full/10.1073/pnas.1408701111),
- [klíma](https://www.pnas.org/doi/full/10.1073/pnas.1417413112),
- [fa](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0156340#sec009),
- [nők](https://royalsocietypublishing.org/doi/full/10.1098/rstb.2021.0425#d1e924)

## Labgyak

1. Kitalálsz valami kérdést a fenti x-y formátumban
2. Előregisztrálod a kutatást as [aspredicted.org](https://aspredicted.org/)-on, és megadsz engem társszerzőnek
     Ha leokéztam, akkor:
4. Összeraksz egy adatbázist, amin vizsgálni tudod a kérdésedet
5. Csinálsz egy kis vizsgálódó adatelemzést (Exploratory Data Analysis, EDA), statisztika most nem köll

## Kitalálsz valami kérdést a fenti x-y formátumban

Hipotézisek [itt](https://hraf.yale.edu/ehc/hypotheses)
Kereshető adatok [itt](https://d-place.org/)

## Előregisztrálod a kutatást

Előregisztráció [itt](https://aspredicted.org/)
A formátumot elsősorban kísérletes vizsgálatoknak találták ki, de a tiédhez hasonló kutatásokoz is lehet használni.
Az előregisztrációban minél kevesebb dolgot kell megmondanod minél pontosabban. Az elemzés egyedisége és relevanciája nem számít, az viszont igen, hogy milyen adatokat elemzel hogyan.

## Összeraksz egy adatbázist, amin vizsgálni tudod a kérdésedet

Letölthető adatok [itt](https://github.com/D-PLACE/dplace-data)
Standard Krosszkulturális Minta [itt](https://github.com/D-PLACE/dplace-data/tree/master/datasets/SCCS)
Etnográfiai Atlasz [itt](https://github.com/D-PLACE/dplace-data/tree/master/datasets/EA)
Klíma Adatbázis [itt](https://github.com/D-PLACE/dplace-data/tree/master/datasets/ecoClimate)

## Saját adatbázis összelegózása

```
staff     23644 Feb  7  2022 societies_mapping.csv
staff    163640 Feb  7  2022 societies.csv
staff  11395801 Feb  7  2022 data.csv
staff       297 Feb  7  2022 README.md
staff     29982 Feb  7  2022 variables.csv
staff     77538 Feb  7  2022 codes.csv
```

## Saját adatbázis összelegózása

data.csv

| __soc_id__ | sub_case | year | __var_id__ | __code__ |
| --- | --- | --- | --- | --- |
| Aa1 | Nyai Nyae region | 1950 | EA001 | 8 |

## Saját adatbázis összelegózása

variables.csv

| __id__ | category | title | __definition__ | type |
| --- | --- | --- | --- | --- |
| EA001 | "Subsistence Economy" | Subsistence economy: gathering | "Dependence on the gathering of wild plants and small land fauna relative to other subsistence activities." | Ordinal... |

## Saját adatbázis összelegózása

codes.csv

| var_id | code | description | name |
| --- | --- | --- | --- |
| EA001 | 0 | Zero to 5 percent dependence | 0-5% |
| EA001 | 1 | 6 to 15 percent dependence | 6-15% |
| EA001 | 2 | 16 to 25 percent dependence | 16-25% |
| EA001 | 3 | 26 to 35 percent dependence | 26-35% |
| EA001 | 4 | 36 to 45 percent dependence | 36-45% |
| EA001 | 5 | 46 to 55 percent dependence | 46-55% |
| EA001 | 6 | 56 to 65 percent dependence | 56-65% |
| EA001 | 7 | 66 to 75 percent dependence | 66-75% |
| EA001 | 8 | 76 to 85 percent dependence | 76-85% |
| EA001 | 9 | 86 to 100 percent dependence | 86-100% |
| EA001 | NA | Missing data | Missing data |

## Saját adatbázis összelegózása

societies.csv, elforgatva

| name | value |
| --- | --- |
| id | Aa1 |
| xd_id | xd1 |
| pref_name_for_society | !Kung |
| glottocode | juho1239 |
| ORIG_name_and_ID_in_this_dataset | Kung (Aa1) |
| alt_names_by_society | "Kung Bushmen | !Kung (Was Nyae) | Was Nyae" |
| main_focal_year | 1950 |
| HRAF_name_ID | San (FX10) |
| HRAF_link | link |
| origLat | -20 |
| origLong | 21 |
| Lat | -20 |
| Long | 21 |
| Comment | Original |
| glottocode_comment |  |

## Saját adatbázis összelegózása

1. A data, variables, codes, societies táblázatokból kiszedegeted azokat az oszlopokat, amikre szükséged van. Összejoinolod őket. Figyelsz, hogy ugyanannak a dolognak lehet, hogy más a neve két különböző táblázatban, és akkor valahol át kell nevezni.
2. Ezt minden olyan adatbázisra megcsinálod, amit használni akarsz.
3. Ha több adatbázist akarsz használni, akkor ezeket is össze kell kombinálni egymással. Itt figyelned kell, hogy hogyan azonosítja a két adatbázis ugyanazokat a kultúrákat.
4. Példa: Az ecoClimate adathalmaz SCCS azonosítókat használ. Az EA adathalmaz nem használ SCCS azonosítókat. De az EA és az SCCS is használ glottocode azonosítókat, és így össze lehet rakni az ecoClimate-et az EA-val.

## Ötletek: 

1. Kitalálod, hogy mi x és y ("milyen változók mérik jól azt, hogy egy társadalom egyszerű vagy bonyolult?")
2. Egyszerűsítsd le a kódokat. Ha skála, akkor kezeld rendezett kategóriaként (ordered category). Ha multinomiális (sok diszkrét kategória), akkor ezeket kezeld külön. Vigyázz, hogy bizonyos változóknál egy csomó adat hiányzik (lakosság mérete)
3. Csinálj táblázatokat, hogy milyen gyakran van a is és b is az adatokban -- akkor ezek lehet, hogy összefüggenek!
4. Csinálj sok-sok ábrát. Lelkeseknek: térkép!

## Beszámoló szerkezete

- helper fájl
  - letöltögeti az adatokat
  - összerakosgatja az adatokat egy adattáblába
  - esetleg meghatároz függvényeket, amiket használni akar
- beszámoló fájl
  - benne van az előregisztrációra mutató link!!!
  - végigvezeti az olvasót az elemzésen
  - bevezetés: mi a kérdés
  - mik az adatok, mik a változók, amiket vizsgálunk
  - olvasó végigsétáltatása ábrákon
  - hivatkozások!
  
fontos kérdések:

0. mik a prediktorváltozók és kimeneti változó(k)
1. miért ezek a prediktorváltozók tudnak válaszolni a kérdésemre
2. hogyan néz ki a kimeneti változó 
3. hogyan néznek ki a prediktorváltozók, milyen a viszonyuk egymáshoz
4. milyen a prediktorváltozók viszonya a kimeneti változóhoz

## Mi kell a teljesítéshez

- előregisztráció, amit én leokéztam
- helper fájl a GITHUBON
- beszámolóhoz használt kód vagy a beszámoló Rmd-ben / munkafüzet formátumban (jupyter notebook etc) ugyanott a GITHUBON
- beszámoló pdf-ben. 

## Példák

-ez. (^^)
- https://github.com/petyaracz/RaczPassmoreJordan2018
- https://github.com/petyaracz/Racz2023trance
