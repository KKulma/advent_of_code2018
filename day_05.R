library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
library(purrr)
library(readr)

# load data from the csv file 

#raw_input <- read_csv("day5-raw-input.csv", col_names = FALSE) %>% 
#  as.character()

raw_input <- read_delim('day5-raw-input.txt', delim = '\t', col_names = FALSE) %>% 
  as.character()

glimpse(raw_input) 

# original length
nchar(raw_input) 

pattern <- c('Aa|aA|Bb|bB|Cc|cC|Dd|dD|Ee|eE|Ff|fF|Gg|gG|Hh|hH|Ii|iI|Jj|jJ|Kk|kK|Ll|lL|Mm|mM|Nn|nN|Oo|oO|Pp|pP|Qq|qQ|Rr|rR|Ss|sS|Tt|tT|Uu|uU|Vv|vV|Ww|wW|Xx|xX|Yy|yY|Zz|zZ') 
  #c('aA|Aa|bB|Bb|cC|Cc|dD|Dd|eE|Ee|fF|Ff|gG|Gg|hH|Hh|iI|Ii|jJ|Jj|kK|Kk|lL|Ll|mM|Mm|nN|Nn|oO|Oo|pP|Pp|qQ|Qq|rR|Rr|sS|Ss|tT|Tt|uU|Uu|vV|Vv|wW|Ww|xX|Xx|yY|Yy|zZ|Zz')

# test first iteration
test5<-str_replace_all(raw_input, pattern, '')  
nchar(test5)# output shorter than the original input - it works!


# test the example 

## dabAcCaCBAcCcaDA  The first 'cC' is removed.
#dabAaCBAcCcaDA    This creates 'Aa', which is removed.
#dabCBAcCcaDA      Either 'cC' or 'Cc' are removed (the result is the same).
#dabCBAcaDA 

expattern <- c('aA|Aa|Bb|bB|cC|Cc')
  
str_remove_all('dabAcCaCBAcCcaDA', expattern) %>% 
  str_remove_all(expattern) %>% nchar()

# now, put it in the repeat loop

# initialize

pattern <- c('Aa|aA|Bb|bB|Cc|cC|Dd|dD|Ee|eE|Ff|fF|Gg|gG|Hh|hH|Ii|iI|Jj|jJ|Kk|kK|Ll|lL|Mm|mM|Nn|nN|Oo|oO|Pp|pP|Qq|qQ|Rr|rR|Ss|sS|Tt|tT|Uu|uU|Vv|vV|Ww|wW|Xx|xX|Yy|yY|Zz|zZ')
input <- raw_input
repeat {   
  output <- str_remove_all(input, pattern) #%>% 
    #str_trim()
  if (nchar(input) == nchar(output)) {
    print(nchar(output));
    break
  } else input <- output;
}

str_detect(output, pattern)
