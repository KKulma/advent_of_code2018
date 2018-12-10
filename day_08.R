library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
library(purrr)



raw_input <- read_delim("day8-raw-input.txt", delim = '\t', col_names = FALSE) %>% 
  as.character()

nchar(raw_input)
glimpse(raw_input)
