---
title: "Homework 7"
author: "Maya Medina"
date: "2024-02-12"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(skimr)
library(naniar)
```

## Data
**1. For this homework, we will use two different data sets. Please load `amniota` and `amphibio`.**  

`amniota` data:  
Myhrvold N, Baldridge E, Chan B, Sivam D, Freeman DL, Ernest SKM (2015). “An amniote life-history
database to perform comparative analyses with birds, mammals, and reptiles.” _Ecology_, *96*, 3109.
doi: 10.1890/15-0846.1 (URL: https://doi.org/10.1890/15-0846.1).

```r
amniota <- read_csv("data/amniota.csv") %>% 
  clean_names()
```

```
## Rows: 21322 Columns: 36
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (6): class, order, family, genus, species, common_name
## dbl (30): subspecies, female_maturity_d, litter_or_clutch_size_n, litters_or...
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

`amphibio` data:  
Oliveira BF, São-Pedro VA, Santos-Barrera G, Penone C, Costa GC (2017). “AmphiBIO, a global database
for amphibian ecological traits.” _Scientific Data_, *4*, 170123. doi: 10.1038/sdata.2017.123 (URL:
https://doi.org/10.1038/sdata.2017.123).

```r
amphibio <- read_csv("data/amphibio.csv") %>% 
  clean_names()
```

```
## Rows: 6776 Columns: 38
## ── Column specification ────────────────────────────────────────────────────────
## Delimiter: ","
## chr  (6): id, Order, Family, Genus, Species, OBS
## dbl (31): Fos, Ter, Aqu, Arb, Leaves, Flowers, Seeds, Arthro, Vert, Diu, Noc...
## lgl  (1): Fruits
## 
## ℹ Use `spec()` to retrieve the full column specification for this data.
## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

## Questions  
**2. Do some exploratory analysis of the `amniota` data set. Use the function(s) of your choice. Try to get an idea of how NA's are represented in the data.**  

```r
glimpse(amniota)
```

```
## Rows: 21,322
## Columns: 36
## $ class                                 <chr> "Aves", "Aves", "Aves", "Aves", …
## $ order                                 <chr> "Accipitriformes", "Accipitrifor…
## $ family                                <chr> "Accipitridae", "Accipitridae", …
## $ genus                                 <chr> "Accipiter", "Accipiter", "Accip…
## $ species                               <chr> "albogularis", "badius", "bicolo…
## $ subspecies                            <dbl> -999, -999, -999, -999, -999, -9…
## $ common_name                           <chr> "Pied Goshawk", "Shikra", "Bicol…
## $ female_maturity_d                     <dbl> -999.000, 363.468, -999.000, -99…
## $ litter_or_clutch_size_n               <dbl> -999.000, 3.250, 2.700, -999.000…
## $ litters_or_clutches_per_y             <dbl> -999, 1, -999, -999, 1, -999, -9…
## $ adult_body_mass_g                     <dbl> 251.500, 140.000, 345.000, 142.0…
## $ maximum_longevity_y                   <dbl> -999.00000, -999.00000, -999.000…
## $ gestation_d                           <dbl> -999, -999, -999, -999, -999, -9…
## $ weaning_d                             <dbl> -999, -999, -999, -999, -999, -9…
## $ birth_or_hatching_weight_g            <dbl> -999, -999, -999, -999, -999, -9…
## $ weaning_weight_g                      <dbl> -999, -999, -999, -999, -999, -9…
## $ egg_mass_g                            <dbl> -999.00, 21.00, 32.00, -999.00, …
## $ incubation_d                          <dbl> -999.00, 30.00, -999.00, -999.00…
## $ fledging_age_d                        <dbl> -999.00, 32.00, -999.00, -999.00…
## $ longevity_y                           <dbl> -999.00000, -999.00000, -999.000…
## $ male_maturity_d                       <dbl> -999, -999, -999, -999, -999, -9…
## $ inter_litter_or_interbirth_interval_y <dbl> -999, -999, -999, -999, -999, -9…
## $ female_body_mass_g                    <dbl> 352.500, 168.500, 390.000, -999.…
## $ male_body_mass_g                      <dbl> 223.000, 125.000, 212.000, 142.0…
## $ no_sex_body_mass_g                    <dbl> -999.0, 123.0, -999.0, -999.0, -…
## $ egg_width_mm                          <dbl> -999, -999, -999, -999, -999, -9…
## $ egg_length_mm                         <dbl> -999, -999, -999, -999, -999, -9…
## $ fledging_mass_g                       <dbl> -999, -999, -999, -999, -999, -9…
## $ adult_svl_cm                          <dbl> -999.00, 30.00, 39.50, -999.00, …
## $ male_svl_cm                           <dbl> -999, -999, -999, -999, -999, -9…
## $ female_svl_cm                         <dbl> -999, -999, -999, -999, -999, -9…
## $ birth_or_hatching_svl_cm              <dbl> -999, -999, -999, -999, -999, -9…
## $ female_svl_at_maturity_cm             <dbl> -999, -999, -999, -999, -999, -9…
## $ female_body_mass_at_maturity_g        <dbl> -999, -999, -999, -999, -999, -9…
## $ no_sex_svl_cm                         <dbl> -999, -999, -999, -999, -999, -9…
## $ no_sex_maturity_d                     <dbl> -999, -999, -999, -999, -999, -9…
```


```r
str(amniota)
```

```
## spc_tbl_ [21,322 × 36] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ class                                : chr [1:21322] "Aves" "Aves" "Aves" "Aves" ...
##  $ order                                : chr [1:21322] "Accipitriformes" "Accipitriformes" "Accipitriformes" "Accipitriformes" ...
##  $ family                               : chr [1:21322] "Accipitridae" "Accipitridae" "Accipitridae" "Accipitridae" ...
##  $ genus                                : chr [1:21322] "Accipiter" "Accipiter" "Accipiter" "Accipiter" ...
##  $ species                              : chr [1:21322] "albogularis" "badius" "bicolor" "brachyurus" ...
##  $ subspecies                           : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ common_name                          : chr [1:21322] "Pied Goshawk" "Shikra" "Bicolored Hawk" "New Britain Sparrowhawk" ...
##  $ female_maturity_d                    : num [1:21322] -999 363 -999 -999 363 ...
##  $ litter_or_clutch_size_n              : num [1:21322] -999 3.25 2.7 -999 4 -999 2.7 4.25 3.25 4.35 ...
##  $ litters_or_clutches_per_y            : num [1:21322] -999 1 -999 -999 1 -999 -999 1 -999 1 ...
##  $ adult_body_mass_g                    : num [1:21322] 252 140 345 142 204 ...
##  $ maximum_longevity_y                  : num [1:21322] -999 -999 -999 -999 -999 ...
##  $ gestation_d                          : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ weaning_d                            : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ birth_or_hatching_weight_g           : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 28 ...
##  $ weaning_weight_g                     : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ egg_mass_g                           : num [1:21322] -999 21 32 -999 21.9 ...
##  $ incubation_d                         : num [1:21322] -999 30 -999 -999 32.5 ...
##  $ fledging_age_d                       : num [1:21322] -999 32 -999 -999 42.5 ...
##  $ longevity_y                          : num [1:21322] -999 -999 -999 -999 -999 ...
##  $ male_maturity_d                      : num [1:21322] -999 -999 -999 -999 -999 -999 -999 365 -999 730 ...
##  $ inter_litter_or_interbirth_interval_y: num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ female_body_mass_g                   : num [1:21322] 352 168 390 -999 230 ...
##  $ male_body_mass_g                     : num [1:21322] 223 125 212 142 170 ...
##  $ no_sex_body_mass_g                   : num [1:21322] -999 123 -999 -999 -999 ...
##  $ egg_width_mm                         : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ egg_length_mm                        : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ fledging_mass_g                      : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ adult_svl_cm                         : num [1:21322] -999 30 39.5 -999 33.5 -999 39.5 29 32.5 42 ...
##  $ male_svl_cm                          : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ female_svl_cm                        : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ birth_or_hatching_svl_cm             : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ female_svl_at_maturity_cm            : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ female_body_mass_at_maturity_g       : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ no_sex_svl_cm                        : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  $ no_sex_maturity_d                    : num [1:21322] -999 -999 -999 -999 -999 -999 -999 -999 -999 -999 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   class = col_character(),
##   ..   order = col_character(),
##   ..   family = col_character(),
##   ..   genus = col_character(),
##   ..   species = col_character(),
##   ..   subspecies = col_double(),
##   ..   common_name = col_character(),
##   ..   female_maturity_d = col_double(),
##   ..   litter_or_clutch_size_n = col_double(),
##   ..   litters_or_clutches_per_y = col_double(),
##   ..   adult_body_mass_g = col_double(),
##   ..   maximum_longevity_y = col_double(),
##   ..   gestation_d = col_double(),
##   ..   weaning_d = col_double(),
##   ..   birth_or_hatching_weight_g = col_double(),
##   ..   weaning_weight_g = col_double(),
##   ..   egg_mass_g = col_double(),
##   ..   incubation_d = col_double(),
##   ..   fledging_age_d = col_double(),
##   ..   longevity_y = col_double(),
##   ..   male_maturity_d = col_double(),
##   ..   inter_litter_or_interbirth_interval_y = col_double(),
##   ..   female_body_mass_g = col_double(),
##   ..   male_body_mass_g = col_double(),
##   ..   no_sex_body_mass_g = col_double(),
##   ..   egg_width_mm = col_double(),
##   ..   egg_length_mm = col_double(),
##   ..   fledging_mass_g = col_double(),
##   ..   adult_svl_cm = col_double(),
##   ..   male_svl_cm = col_double(),
##   ..   female_svl_cm = col_double(),
##   ..   birth_or_hatching_svl_cm = col_double(),
##   ..   female_svl_at_maturity_cm = col_double(),
##   ..   female_body_mass_at_maturity_g = col_double(),
##   ..   no_sex_svl_cm = col_double(),
##   ..   no_sex_maturity_d = col_double()
##   .. )
##  - attr(*, "problems")=<externalptr>
```

**3. Do some exploratory analysis of the `amphibio` data set. Use the function(s) of your choice. Try to get an idea of how NA's are represented in the data.**  

```r
str(amphibio)
```

```
## spc_tbl_ [6,776 × 38] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ id                     : chr [1:6776] "Anf0001" "Anf0002" "Anf0003" "Anf0004" ...
##  $ order                  : chr [1:6776] "Anura" "Anura" "Anura" "Anura" ...
##  $ family                 : chr [1:6776] "Allophrynidae" "Alytidae" "Alytidae" "Alytidae" ...
##  $ genus                  : chr [1:6776] "Allophryne" "Alytes" "Alytes" "Alytes" ...
##  $ species                : chr [1:6776] "Allophryne ruthveni" "Alytes cisternasii" "Alytes dickhilleni" "Alytes maurus" ...
##  $ fos                    : num [1:6776] NA NA NA NA NA 1 1 1 1 1 ...
##  $ ter                    : num [1:6776] 1 1 1 1 1 1 1 1 1 1 ...
##  $ aqu                    : num [1:6776] 1 1 1 1 NA 1 1 1 1 1 ...
##  $ arb                    : num [1:6776] 1 1 1 1 1 1 NA NA NA NA ...
##  $ leaves                 : num [1:6776] NA NA NA NA NA NA NA NA NA NA ...
##  $ flowers                : num [1:6776] NA NA NA NA NA NA NA NA NA NA ...
##  $ seeds                  : num [1:6776] NA NA NA NA NA NA NA NA NA NA ...
##  $ fruits                 : logi [1:6776] NA NA NA NA NA NA ...
##  $ arthro                 : num [1:6776] 1 1 1 NA 1 1 1 1 1 NA ...
##  $ vert                   : num [1:6776] NA NA NA NA NA NA 1 NA NA NA ...
##  $ diu                    : num [1:6776] 1 NA NA NA NA NA 1 1 1 NA ...
##  $ noc                    : num [1:6776] 1 1 1 NA 1 1 1 1 1 NA ...
##  $ crepu                  : num [1:6776] 1 NA NA NA NA 1 NA NA NA NA ...
##  $ wet_warm               : num [1:6776] NA NA NA NA 1 1 NA NA NA NA ...
##  $ wet_cold               : num [1:6776] 1 NA NA NA NA NA 1 NA NA NA ...
##  $ dry_warm               : num [1:6776] NA NA NA NA NA NA NA NA NA NA ...
##  $ dry_cold               : num [1:6776] NA NA NA NA NA NA NA NA NA NA ...
##  $ body_mass_g            : num [1:6776] 31 6.1 NA NA 2.31 13.4 21.8 NA NA NA ...
##  $ age_at_maturity_min_y  : num [1:6776] NA 2 2 NA 3 2 3 NA NA NA ...
##  $ age_at_maturity_max_y  : num [1:6776] NA 2 2 NA 3 3 5 NA NA NA ...
##  $ body_size_mm           : num [1:6776] 31 50 55 NA 40 55 80 60 65 NA ...
##  $ size_at_maturity_min_mm: num [1:6776] NA 27 NA NA NA 35 NA NA NA NA ...
##  $ size_at_maturity_max_mm: num [1:6776] NA 36 NA NA NA 40.5 NA NA NA NA ...
##  $ longevity_max_y        : num [1:6776] NA 6 NA NA NA 7 9 NA NA NA ...
##  $ litter_size_min_n      : num [1:6776] 300 60 40 NA 7 53 300 1500 1000 NA ...
##  $ litter_size_max_n      : num [1:6776] 300 180 40 NA 20 171 1500 1500 1000 NA ...
##  $ reproductive_output_y  : num [1:6776] 1 4 1 4 1 4 6 1 1 1 ...
##  $ offspring_size_min_mm  : num [1:6776] NA 2.6 NA NA 5.4 2.6 1.5 NA 1.5 NA ...
##  $ offspring_size_max_mm  : num [1:6776] NA 3.5 NA NA 7 5 2 NA 1.5 NA ...
##  $ dir                    : num [1:6776] 0 0 0 0 0 0 0 0 0 0 ...
##  $ lar                    : num [1:6776] 1 1 1 1 1 1 1 1 1 1 ...
##  $ viv                    : num [1:6776] 0 0 0 0 0 0 0 0 0 0 ...
##  $ obs                    : chr [1:6776] NA NA NA NA ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   id = col_character(),
##   ..   Order = col_character(),
##   ..   Family = col_character(),
##   ..   Genus = col_character(),
##   ..   Species = col_character(),
##   ..   Fos = col_double(),
##   ..   Ter = col_double(),
##   ..   Aqu = col_double(),
##   ..   Arb = col_double(),
##   ..   Leaves = col_double(),
##   ..   Flowers = col_double(),
##   ..   Seeds = col_double(),
##   ..   Fruits = col_logical(),
##   ..   Arthro = col_double(),
##   ..   Vert = col_double(),
##   ..   Diu = col_double(),
##   ..   Noc = col_double(),
##   ..   Crepu = col_double(),
##   ..   Wet_warm = col_double(),
##   ..   Wet_cold = col_double(),
##   ..   Dry_warm = col_double(),
##   ..   Dry_cold = col_double(),
##   ..   Body_mass_g = col_double(),
##   ..   Age_at_maturity_min_y = col_double(),
##   ..   Age_at_maturity_max_y = col_double(),
##   ..   Body_size_mm = col_double(),
##   ..   Size_at_maturity_min_mm = col_double(),
##   ..   Size_at_maturity_max_mm = col_double(),
##   ..   Longevity_max_y = col_double(),
##   ..   Litter_size_min_n = col_double(),
##   ..   Litter_size_max_n = col_double(),
##   ..   Reproductive_output_y = col_double(),
##   ..   Offspring_size_min_mm = col_double(),
##   ..   Offspring_size_max_mm = col_double(),
##   ..   Dir = col_double(),
##   ..   Lar = col_double(),
##   ..   Viv = col_double(),
##   ..   OBS = col_character()
##   .. )
##  - attr(*, "problems")=<externalptr>
```


**4. How many total NA's are in each data set? Do these values make sense? Are NA's represented by values?**   

```r
amniota %>% 
  summarize_all(~sum(is.na(.)))
```

```
## # A tibble: 1 × 36
##   class order family genus species subspecies common_name female_maturity_d
##   <int> <int>  <int> <int>   <int>      <int>       <int>             <int>
## 1     0     0      0     0       0          0           0                 0
## # ℹ 28 more variables: litter_or_clutch_size_n <int>,
## #   litters_or_clutches_per_y <int>, adult_body_mass_g <int>,
## #   maximum_longevity_y <int>, gestation_d <int>, weaning_d <int>,
## #   birth_or_hatching_weight_g <int>, weaning_weight_g <int>, egg_mass_g <int>,
## #   incubation_d <int>, fledging_age_d <int>, longevity_y <int>,
## #   male_maturity_d <int>, inter_litter_or_interbirth_interval_y <int>,
## #   female_body_mass_g <int>, male_body_mass_g <int>, …
```


```r
amphibio %>% 
  summarize_all(~sum(is.na(.)))
```

```
## # A tibble: 1 × 38
##      id order family genus species   fos   ter   aqu   arb leaves flowers seeds
##   <int> <int>  <int> <int>   <int> <int> <int> <int> <int>  <int>   <int> <int>
## 1     0     0      0     0       0  6053  1104  2810  4347   6752    6772  6772
## # ℹ 26 more variables: fruits <int>, arthro <int>, vert <int>, diu <int>,
## #   noc <int>, crepu <int>, wet_warm <int>, wet_cold <int>, dry_warm <int>,
## #   dry_cold <int>, body_mass_g <int>, age_at_maturity_min_y <int>,
## #   age_at_maturity_max_y <int>, body_size_mm <int>,
## #   size_at_maturity_min_mm <int>, size_at_maturity_max_mm <int>,
## #   longevity_max_y <int>, litter_size_min_n <int>, litter_size_max_n <int>,
## #   reproductive_output_y <int>, offspring_size_min_mm <int>, …
```
Amniota does not have NAs but there should be as there are -999 observations.

**5. Make any necessary replacements in the data such that all NA's appear as "NA".**   

```r
amniota_tidy <- amniota %>% 
 replace_with_na_all(condition = ~.x == -999)
```


```r
amphibio_tidy <- amphibio %>% 
  replace_with_na_all(condition = ~.x == -999)
```


**6. Use the package `naniar` to produce a summary, including percentages, of missing data in each column for the `amniota` data.**  

```r
naniar::miss_var_summary(amniota_tidy)
```

```
## # A tibble: 36 × 3
##    variable                       n_miss pct_miss
##    <chr>                           <int>    <dbl>
##  1 subspecies                      21322    100  
##  2 female_body_mass_at_maturity_g  21318    100. 
##  3 female_svl_at_maturity_cm       21120     99.1
##  4 fledging_mass_g                 21111     99.0
##  5 male_svl_cm                     21040     98.7
##  6 no_sex_maturity_d               20860     97.8
##  7 egg_width_mm                    20727     97.2
##  8 egg_length_mm                   20702     97.1
##  9 weaning_weight_g                20258     95.0
## 10 female_svl_cm                   20242     94.9
## # ℹ 26 more rows
```

**7. Use the package `naniar` to produce a summary, including percentages, of missing data in each column for the `amphibio` data.**

```r
naniar::miss_var_summary(amphibio_tidy)
```

```
## # A tibble: 38 × 3
##    variable n_miss pct_miss
##    <chr>     <int>    <dbl>
##  1 fruits     6774    100. 
##  2 flowers    6772     99.9
##  3 seeds      6772     99.9
##  4 leaves     6752     99.6
##  5 dry_cold   6735     99.4
##  6 vert       6657     98.2
##  7 obs        6651     98.2
##  8 wet_cold   6625     97.8
##  9 crepu      6608     97.5
## 10 dry_warm   6572     97.0
## # ℹ 28 more rows
```

**8. For the `amniota` data, calculate the number of NAs in the `egg_mass_g` column sorted by taxonomic class; i.e. how many NA's are present in the `egg_mass_g` column in birds, mammals, and reptiles? Does this results make sense biologically? How do these results affect your interpretation of NA's?**  

```r
names(amniota)
```

```
##  [1] "class"                                
##  [2] "order"                                
##  [3] "family"                               
##  [4] "genus"                                
##  [5] "species"                              
##  [6] "subspecies"                           
##  [7] "common_name"                          
##  [8] "female_maturity_d"                    
##  [9] "litter_or_clutch_size_n"              
## [10] "litters_or_clutches_per_y"            
## [11] "adult_body_mass_g"                    
## [12] "maximum_longevity_y"                  
## [13] "gestation_d"                          
## [14] "weaning_d"                            
## [15] "birth_or_hatching_weight_g"           
## [16] "weaning_weight_g"                     
## [17] "egg_mass_g"                           
## [18] "incubation_d"                         
## [19] "fledging_age_d"                       
## [20] "longevity_y"                          
## [21] "male_maturity_d"                      
## [22] "inter_litter_or_interbirth_interval_y"
## [23] "female_body_mass_g"                   
## [24] "male_body_mass_g"                     
## [25] "no_sex_body_mass_g"                   
## [26] "egg_width_mm"                         
## [27] "egg_length_mm"                        
## [28] "fledging_mass_g"                      
## [29] "adult_svl_cm"                         
## [30] "male_svl_cm"                          
## [31] "female_svl_cm"                        
## [32] "birth_or_hatching_svl_cm"             
## [33] "female_svl_at_maturity_cm"            
## [34] "female_body_mass_at_maturity_g"       
## [35] "no_sex_svl_cm"                        
## [36] "no_sex_maturity_d"
```


```r
anyNA(amniota_tidy$egg_mass_g)
```

```
## [1] TRUE
```


```r
amniota_egg_mass <- amniota_tidy %>% 
  select(class, egg_mass_g)
```


```r
amniota_egg_mass %>% 
  group_by(class) %>% 
  summarize_all(~(sum(is.na(.))))
```

```
## # A tibble: 3 × 2
##   class    egg_mass_g
##   <chr>         <int>
## 1 Aves           4914
## 2 Mammalia       4953
## 3 Reptilia       6040
```
T

**9. The `amphibio` data have variables that classify species as fossorial (burrowing), terrestrial, aquatic, or arboreal.Calculate the number of NA's in each of these variables. Do you think that the authors intend us to think that there are NA's in these columns or could they represent something else? Explain.**

```r
names(amphibio)
```

```
##  [1] "id"                      "order"                  
##  [3] "family"                  "genus"                  
##  [5] "species"                 "fos"                    
##  [7] "ter"                     "aqu"                    
##  [9] "arb"                     "leaves"                 
## [11] "flowers"                 "seeds"                  
## [13] "fruits"                  "arthro"                 
## [15] "vert"                    "diu"                    
## [17] "noc"                     "crepu"                  
## [19] "wet_warm"                "wet_cold"               
## [21] "dry_warm"                "dry_cold"               
## [23] "body_mass_g"             "age_at_maturity_min_y"  
## [25] "age_at_maturity_max_y"   "body_size_mm"           
## [27] "size_at_maturity_min_mm" "size_at_maturity_max_mm"
## [29] "longevity_max_y"         "litter_size_min_n"      
## [31] "litter_size_max_n"       "reproductive_output_y"  
## [33] "offspring_size_min_mm"   "offspring_size_max_mm"  
## [35] "dir"                     "lar"                    
## [37] "viv"                     "obs"
```


```r
amphibio_tidy <- janitor::clean_names(amphibio)
names(amphibio_tidy)
```

```
##  [1] "id"                      "order"                  
##  [3] "family"                  "genus"                  
##  [5] "species"                 "fos"                    
##  [7] "ter"                     "aqu"                    
##  [9] "arb"                     "leaves"                 
## [11] "flowers"                 "seeds"                  
## [13] "fruits"                  "arthro"                 
## [15] "vert"                    "diu"                    
## [17] "noc"                     "crepu"                  
## [19] "wet_warm"                "wet_cold"               
## [21] "dry_warm"                "dry_cold"               
## [23] "body_mass_g"             "age_at_maturity_min_y"  
## [25] "age_at_maturity_max_y"   "body_size_mm"           
## [27] "size_at_maturity_min_mm" "size_at_maturity_max_mm"
## [29] "longevity_max_y"         "litter_size_min_n"      
## [31] "litter_size_max_n"       "reproductive_output_y"  
## [33] "offspring_size_min_mm"   "offspring_size_max_mm"  
## [35] "dir"                     "lar"                    
## [37] "viv"                     "obs"
```


```r
amphibio_tidy_selection <- amphibio_tidy %>% 
  select(fos, ter, aqu, arb)
```


```r
amphibio_tidy_selection %>% 
  summarize_all(~sum(is.na(.)))
```

```
## # A tibble: 1 × 4
##     fos   ter   aqu   arb
##   <int> <int> <int> <int>
## 1  6053  1104  2810  4347
```


**10. Now that we know how NA's are represented in the `amniota` data, how would you load the data such that the values which represent NA's are automatically converted?**

```r
amniota_new <- read.csv("data/amniota.csv", na = c("-999"))
glimpse(amniota_new)
```

```
## Rows: 21,322
## Columns: 36
## $ class                                 <chr> "Aves", "Aves", "Aves", "Aves", …
## $ order                                 <chr> "Accipitriformes", "Accipitrifor…
## $ family                                <chr> "Accipitridae", "Accipitridae", …
## $ genus                                 <chr> "Accipiter", "Accipiter", "Accip…
## $ species                               <chr> "albogularis", "badius", "bicolo…
## $ subspecies                            <lgl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ common_name                           <chr> "Pied Goshawk", "Shikra", "Bicol…
## $ female_maturity_d                     <dbl> NA, 363.468, NA, NA, 363.468, NA…
## $ litter_or_clutch_size_n               <dbl> NA, 3.250, 2.700, NA, 4.000, NA,…
## $ litters_or_clutches_per_y             <dbl> NA, 1, NA, NA, 1, NA, NA, 1, NA,…
## $ adult_body_mass_g                     <dbl> 251.500, 140.000, 345.000, 142.0…
## $ maximum_longevity_y                   <dbl> NA, NA, NA, NA, NA, NA, NA, 19.9…
## $ gestation_d                           <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ weaning_d                             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ birth_or_hatching_weight_g            <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ weaning_weight_g                      <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ egg_mass_g                            <dbl> NA, 21.00, 32.00, NA, 21.85, NA,…
## $ incubation_d                          <dbl> NA, 30.00, NA, NA, 32.50, NA, NA…
## $ fledging_age_d                        <dbl> NA, 32.00, NA, NA, 42.50, NA, NA…
## $ longevity_y                           <dbl> NA, NA, NA, NA, NA, NA, NA, 12.5…
## $ male_maturity_d                       <dbl> NA, NA, NA, NA, NA, NA, NA, 365,…
## $ inter_litter_or_interbirth_interval_y <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ female_body_mass_g                    <dbl> 352.500, 168.500, 390.000, NA, 2…
## $ male_body_mass_g                      <dbl> 223.000, 125.000, 212.000, 142.0…
## $ no_sex_body_mass_g                    <dbl> NA, 123.0, NA, NA, NA, NA, NA, 1…
## $ egg_width_mm                          <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ egg_length_mm                         <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ fledging_mass_g                       <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ adult_svl_cm                          <dbl> NA, 30.00, 39.50, NA, 33.50, NA,…
## $ male_svl_cm                           <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ female_svl_cm                         <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ birth_or_hatching_svl_cm              <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ female_svl_at_maturity_cm             <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ female_body_mass_at_maturity_g        <int> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ no_sex_svl_cm                         <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
## $ no_sex_maturity_d                     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, …
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
