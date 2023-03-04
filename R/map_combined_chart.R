library(sf)
library(tmap)
library(cowplot)
library(ggplot2)
data(World, land)

df <- data.frame(
  Longitude = c(-90, 90),
  Latitude = c(-35, 35)
)

resorts_points <- st_as_sf(df, coords = c("Longitude", "Latitude"), crs = 4326)

map_grob <- (tm_shape(World) +
  tm_borders(col = "#c9c9c8") +
  tm_layout(frame = FALSE) +
  tm_shape(land) +
    tm_raster("elevation", palette = terrain.colors(10)) +
  tm_shape(resorts_points) +
    tm_bubbles(size = .2, col = "#82a4b3", alpha = 0.5, shape = 8)) %>%
  tmap_grob()

df_line <- data.frame(
  x = c(-100, 100),
  y = c(-50, 50)
)

line_chart <- df_line  %>%
  ggplot(aes(x = x, y = y)) +
  geom_line() +
  theme_classic() +
  theme(panel.background = element_rect(fill = "transparent"),
        plot.background = element_rect(fill = "transparent", colour = NA),
        plot.margin = margin(l = 19, t = 25, r = 20, b = 25),
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.line = element_line(colour = "transparent")
  )

ggdraw() +
  draw_plot(map_grob) +
  draw_plot(line_chart)
