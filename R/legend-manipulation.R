library(ggplot2)
library(ggtext)

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
type <- sample(rep(c("a", "b", "c"), 5), size = 11)
df <- data.frame(x, y, type)
plot_colours <- c("dodgerblue4", "firebrick4", "lightgoldenrod4")

ggplot(df, aes(x, y)) +
  geom_line(aes(colour = type)) +
  scale_colour_manual(values = plot_colours,
                      labels = paste0("<span style='color:",
                                      plot_colours,
                                      "'>",
                                      c("a", "b", "c"),
                                      "</span>",
                                      "<span> </span>",
                                      "<span> </span>",
                                      "<span style='color:",
                                      c("#474747",
                                        "#474747",
                                        "transparent"),
                                      "'>",
                                      "|",
                                      "</span>")) +
  theme(legend.position = "top",
        legend.text = element_markdown(face = "bold"),
        legend.justification = c(0, 0),
        legend.margin = margin(),
        legend.key.size = unit(1, units = "pt"),
        legend.spacing.x = unit(3, units = "pt")) +
  guides(colour = guide_legend(title = NULL,
                             # reverse = TRUE,
                             label.position = "left",
                             override.aes = list(alpha = 0)))
