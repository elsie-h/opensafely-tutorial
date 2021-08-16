library(tidyverse)

df_input <- read_csv(
    here::here("output", "input.csv"),
    col_types = cols(patient_id = col_integer(), age = col_double())
)

plot_age <- df_input %>%
    ggplot(aes(age)) +
    geom_histogram()

ggsave(plot = plot_age, filename="descriptive_gg.png", path=here::here("output"))