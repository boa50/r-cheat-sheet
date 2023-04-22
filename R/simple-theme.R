################################################################################
# Minimalist theme to be used by my charts
################################################################################

library(ggplot2)

app_colours <- list(
  title = "#474747",
  axis = "#757575",
  legend_title = "#474747",
  legend_text = "#757575",
  subtitle = "#757575",
  caption = "#8f8f8f",
  main = "#1976d2",
  no_emphasis = "#8f8f8f",
  divergent = "#f57c00",
  line_main = "#42a5f5",
  line_complementary = "#78909c"
)

theme_minimalistic <- function() {
  theme_classic() +
    theme(plot.title = element_text(hjust = 0, colour = app_colours$title),
          plot.title.position = "plot",
          axis.line = element_line(colour = app_colours$axis),
          axis.ticks = element_line(colour = app_colours$axis),
          axis.text = element_text(colour = app_colours$axis),
          axis.title = element_text(colour = app_colours$axis),
          legend.title = element_text(colour = app_colours$legend_title),
          legend.text = element_text(colour = app_colours$legend_text),
          plot.subtitle = element_text(colour = app_colours$subtitle,
                                       margin = margin(b = 15)),
          plot.caption = element_text(colour = app_colours$caption),
          plot.caption.position = "plot",
          panel.background = element_rect(fill = "transparent"),
          plot.background = element_rect(fill = "transparent", color = NA)
    )
}

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
type <- sample(rep(c("a", "b", "c"), 5), size = 11)
df <- data.frame(x, y, type)

# For setting a global theme
# theme_set(theme_minimalistic())
# could be used

ggplot(df, aes(x, y)) +
  geom_line(aes(colour = type)) +
  scale_colour_manual(values = c(app_colours$main,
                                 rep(app_colours$no_emphasis, 2))) +
  labs(title = "Title Test",
       subtitle = "Subtitle Test",
       caption = "Caption Test") +
  theme_minimalistic() +
  ### More interesting customizations that could be used
  theme(
    # legend.position = "none",
    plot.margin = unit(rep(1.5, times = 4), "lines"),
    axis.title.y = element_text(margin = margin(r = 7), hjust = 1),
    axis.title.x = element_text(margin = margin(t = -12), size = 11),
    axis.line = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_text(colour = app_colours$axis, size = 13),
    axis.title = element_text(colour = app_colours$axis),
    axis.title.y.left = element_blank(),
    axis.text.y = element_blank()
  )
