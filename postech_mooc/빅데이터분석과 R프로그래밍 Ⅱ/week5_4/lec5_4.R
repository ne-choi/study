# lec5_4.R

#install.packages("ggplot2")
library(ggplot2)

#install.packages("dplyr")
library(dplyr)

# maps : world map
install.packages("maps")
library(maps)

# mapdata : more world map 
#install.packages("mapdata")
library(mapdata)

# mapdata : latitude and longitude
install.packages("mapproj")
library(mapproj)

# set working directory
setwd("D:/tempstore/moocr")

# 1. Korea Map 
par(mfrow = c(1, 2),mar=c(2,2,2,2))
map(database = 'world', region = c('South Korea','North Korea'), col='green', fill = TRUE)
title("Korea")
# using mapdata package
map(database = 'worldHires', region = c('South Korea','North Korea'), col='green', fill = TRUE)
title("Korea")

# 2.Italy 
par(mfrow = c(1, 1),mar=c(2,2,2,2))
map(database = 'world', region = c('Italy'), col='coral', fill = TRUE)
title("Italy")

# 3. Dokdo using mapproj package
library(mapproj)
par(mfrow = c(1, 1),mar=c(2,2,2,2))
map('world', proj = 'azequalarea', orient = c(37.24223, 131.8643, 0))
map.grid(col = 2)
points(mapproject(list(y = 37.24223, x = 131.8643)), col = "blue", pch = "x", cex = 2)
title("Dokdo")
# for reading Korean : encoding to UTF-8 
# file menu: Tools_global options_code_saving

# 4. Airport & route data (source : https://www.data.go.kr/)
airport<-read.csv("airport.csv")
route = read.csv("route.csv")
head(airport)
head(route)

head(route[order(route$id),])

# Korea map (kr.map) - using dplyr
world.map <- map_data("world")
kr.map <- world.map %>% filter(region == "South Korea")

# ------------------------------------ #
# Korea map using ggplot
# ------------------------------------ #
# 5. Domestic airport location 
ggplot() + 
  geom_polygon(data=kr.map, aes(x=long, y=lat, group=group)) +
  geom_label(data=airport, aes(x = lon, y = lat, label=iata)) +
  labs(title = "south korea airports")

# 6. Assault in US (1973)
par(mfrow = c(1, 1), mar=c(1,1,1,1))
# library(maps)
# excluding Alaska, Hawaii 
sub.usa <- subset(USArrests,!rownames(USArrests) %in% c("Alaska", "Hawaii"))
# data with State name, Assult count
usa.data <- data.frame(states = rownames(sub.usa), Assault = sub.usa$Assault)
# legend
col.level <- cut(sub.usa[, 2], c(0, 100, 150, 200, 250, 300, 350))
legends <- levels(col.level)
# displaying color for the size  
levels(col.level) <- sort(heat.colors(6), decreasing = TRUE)
usa.data <- data.frame(usa.data, col.level = col.level)
# Map 
map('state', region = usa.data$states, fill = TRUE, col = as.character(usa.data$col.level))
title("USA Assault map")
legend(-77, 34, legends, fill = sort(heat.colors(6), decreasing = TRUE), cex = 0.7)

help(USArrests)
head(USArrests)

#
par(mfrow = c(1, 2),mar=c(2,2,2,2))
map(database = 'world', region = c('South Korea'), col='green', fill = TRUE)
title("Korea")
