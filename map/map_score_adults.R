# load libraries
library(tmap)
library(spData)
library(dplyr)


# load data
adults_i = st_read('C:/Users/b9066009/Documents/PhD/conferences/2022_GISRUK/2022_gisruk/2022_gisruk/results/access_score_adults.gpkg',
                   layer = 'access_score_adults')

seniors_i = st_read('C:/Users/b9066009/Documents/PhD/conferences/2022_GISRUK/2022_gisruk/2022_gisruk/results/access_score_seniors.gpkg',
                   layer = 'access_score_seniors')


# results adults
# prepare data (add quantiles)

adults_i$quartile = ntile(adults_i$access_score, 4)
adults_i$access_cat = ifelse(adults_i$quartile == 1, 'low access',
                         ifelse(adults_i$quartile == 2, 'mid-low access',
                         ifelse(adults_i$quartile == 3, 'mid-high access',
                         'high access')))


# separate into layers
low_access = adults_i %>% filter(access_cat == 'low access')
mid_low_access = adults_i %>% filter(access_cat == 'mid-low access')
mid_high_access = adults_i %>% filter(access_cat == 'mid-high access')
high_access = adults_i %>% filter(access_cat == 'high access')

# map
m_low = tm_shape(low_access) +
  tm_dots(col = '#ae2012', 
          popup.vars = c('Accessibility score' = 'access_score', 'Postcode' = 'Postcode'),
          id = 'Postcode')

m_midlow = tm_shape(mid_low_access) +
    tm_dots(col = '#ee9b00', 
            popup.vars = c('Accessibility score' = 'access_score', 'Postcode' = 'Postcode'),
            id = 'Postcode')

m_midhigh = tm_shape(mid_high_access) +
    tm_dots(col = '#94d2bd', 
            popup.vars = c('Accessibility score' = 'access_score', 'Postcode' = 'Postcode'),
            id = 'Postcode')

m_high = tm_shape(high_access) +
    tm_dots(col = '#005f73', 
            popup.vars = c('Accessibility score' = 'access_score', 'Postcode' = 'Postcode'),
            id = 'Postcode')

(map_adults = m_low + 
  m_midlow + 
  m_midhigh + 
  m_high +
  tm_add_legend(labels = c('Low access', 'Mid-low access', 'Mid-high access', 'High access'),
                col = c('#ae2012','#ee9b00','#94d2bd','#005f73')) +
  tm_view(symbol.size.fixed = TRUE))


