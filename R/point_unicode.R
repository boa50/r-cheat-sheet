library(ggplot2)

df <- data.frame(
  x = c(0, 1, 2),
  y = c(0, 2, 5)
)

# Got the snow unicode representation from here: https://www.compart.com/en/unicode/search?q=snow#characters
df %>%
  ggplot(aes(x = x, y = y)) +
  geom_point(shape = "\u2744",
             size = 5,
             colour = "#82a4b3",
             alpha = 1) +
  theme_classic()
