################################################################################
# Minimalist theme to be used by my charts
################################################################################

library(ggplot2)

my_colours <- list(
  title = "#616161",
  axis = "#9e9e9e",
  main = "#1976d2",
  no_emphasis = "#757575",
  divergent = "#f57c00",
  line_main = "#42a5f5",
  line_complementary = "#78909c"
)

theme_boa <- function() {
  theme_classic() +
    theme(plot.title = element_text(hjust = 0, colour = my_colours$title),
          plot.title.position = "plot",
          axis.line = element_line(colour = my_colours$axis),
          axis.ticks = element_line(colour = my_colours$axis),
          axis.text = element_text(colour = my_colours$axis),
          axis.title = element_text(colour = my_colours$axis),
          panel.background = element_rect(fill='transparent'),
          plot.background = element_rect(fill='transparent', color=NA)
    )
}

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line() +
  theme_boa() +
  ### More interesting customizations that could be used
  theme(legend.position = "none",
        plot.margin = unit(rep(1.5, times = 4), "lines"),
        axis.title.y = element_text(margin = margin(r = 7), hjust = 1),
        axis.title.x = element_text(margin = margin(t = -12), size = 11),
        axis.line = element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_text(colour = my_colours$axis, size = 13),
        axis.title = element_text(colour = my_colours$axis),
        axis.title.y.left = element_blank(),
        axis.text.y = element_blank()
  )
