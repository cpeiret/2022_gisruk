# load libraries

library(tmap)
library(spData)
library(dplyr)

# load data

destinations = st_read('C:/Users/b9066009/Documents/PhD/conferences/2022_GISRUK/2022_gisruk/2022_gisruk/data/destinations.gpkg',
               layer = 'destinations')

# fill in NAs
destinations$groupname = ifelse(is.na(destinations$refToGreenspaceSite), destinations$groupname, 'Park entrance')
destinations$categoryname = ifelse(is.na(destinations$refToGreenspaceSite), destinations$categoryname, 'Park entrance')
destinations$classname = ifelse(is.na(destinations$refToGreenspaceSite), destinations$classname, 'Park entrance')

# plot data
tmap_mode('view')

tm_shape(destinations) +
  tm_dots(col = 'groupname', palette = c('#F94144', '#577590','#F8961E','#43AA8B','#F9C74F','#90BE6D'),
          popup.vars = c('Category' = 'groupname', 'Amenity' = 'classname'),
          id = 'classname',
          size = 0.05) +
  tm_view(dot.size.fixed = FALSE)
