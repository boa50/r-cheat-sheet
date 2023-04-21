################################################################################
# Function to save plots in a good resolution and fidelity
################################################################################

library(ggplot2)

save_plot <- function(plot_name = "myplot", background = NULL) {
  ggsave(
    paste0(plot_name, ".png"),
    width = 3840,
    height = 2460,
    units = "px",
    dpi = 425,
    bg = {{ background }}
  )
}

set.seed(42)
x <- c(0:10)
y <- sample(1:15, size = 11)
df <- data.frame(x, y)

ggplot(df, aes(x, y)) +
  geom_line()

save_plot()
