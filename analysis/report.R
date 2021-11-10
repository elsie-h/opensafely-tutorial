library(tidyverse)
library(glue)

## import command-line arguments
args <- commandArgs(trailingOnly=TRUE)

if(length(args)==0){
 # use for interactive testing
 bw <- 5
 bar_fill <- "blue"
} else {
 bw <- as.numeric(args[[1]])
 bar_fill <- as.character(args[[2]])
}

## import input data
df_input <- read_csv(
    here::here("output", "input.csv"),
    col_types = cols(
        patient_id = col_integer(), 
        age = col_double()
        )
)

## plot histogram
plot_age <- df_input %>%
    ggplot(aes(age)) +
    geom_histogram(binwidth = bw, fill = bar_fill)

## save histogram
ggsave(plot = plot_age,
       filename=glue("age_hist_{bw}_{bar_fill}.png"),
       path=here::here("output"))