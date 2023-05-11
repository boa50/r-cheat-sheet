################################################################################
# Function to ad text annotations with HTML code inside a chart
################################################################################

library(ggplot2)

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line() +
  ggtext::geom_richtext(
    inherit.aes = FALSE,
    data = dplyr::tibble(),
    aes(
      x = 3.5,
      y = 15,
      lineheight = 1.7,
      hjust = 0,
      vjust = 1,
      text.colour = "black",
      label = "Some text with
      <br><b><span style='color:#1976d2; padding-top: 10px;'> a bit of
      <span style='font-size:30px;'>HTML</span> code</span></b>"),
    fill = NA,
    label.color = NA)
