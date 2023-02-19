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

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line() +
  annotate_point(x[5], y[5])
