################################################################################
# Some examples of code to be used to manage axis properties
################################################################################

library(ggplot2)

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line() +
  scale_x_continuous(breaks = seq(0, 10, by = 2),
                     expand = expansion(mult = c(.02, .02))) +
  scale_y_continuous(breaks = seq(0, 15, by = 3),
                     limits = c(0, 15),
                     expand = expansion(mult = 0))
