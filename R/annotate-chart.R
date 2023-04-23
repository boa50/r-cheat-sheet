################################################################################
# Function to annotate single points inside a chart
################################################################################

library(ggplot2)

annotate_point <- function(x, y, colour = "black") {
  list(
    annotate(
      "point",
      x = {{ x }},
      y = {{ y }},
      size = 7,
      colour = {{ colour }}
    ),
    annotate(
      "text",
      label = {{ y }},
      x = {{ x }},
      y = {{ y }},
      colour = "white"
    )
  )
}

annotate_line <- function(position, colour = "ivory4") {
  list(
    geom_segment(x = -0.52, xend = Inf,
                 y = position, yend = position,
                 linetype = "longdash",
                 colour = colour,
                 size = .37),
      annotate("text", label = "GOAL", hjust = 0.5, vjust = -0.5,
               size = 4, colour = colour,
               x = 11, y = position)
  )
}

line_legend <- function(label, x, y, colour = "black") {
  annotate("text", label = {{label}}, hjust = -0.1,
           size = 3, colour = {{colour}}, fontface = "bold",
           x = {{x}}, y = {{y}})
}

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line() +
  annotate_point(x[5], y[5]) +
  line_legend("LINE NAME", x[11], y[11], "dodgerblue4") +
  annotate_line(position = 9) +
  coord_cartesian(clip = "off") +
  theme(plot.margin = margin(c(15, 45, 15, 15)))
