library(tidyverse)
library(stringi)
library(rvest)
library(XML)

load("C:/news/package/textwork/data/news.rda")

cleanString(news$text)

text <- news$text

tmp <- text %>%
  stri_encode(., from = NULL, to = "UTF-8") %>%
  str_remove_all("-\r\n\t|\t|\r|\n|\n$|^\n|-\n|  |;|           |â|, ,|
                   ^ ,  , ,  , |^ , , |^ , |^, |^, , |^, , , , |^, , , , , |
                   ^, , , , , , , ,|^, , , , , , , , , , , , , , , , , , , |
                   ^, , , , , , , , , , , , , |^, , , , , , , , , |^, , , , , , , |
                   ^, , , , , , |^, , , , , |^, , , , |^, , , |^, , |^, |^,|^: |
                   ^\\?, |^ |^ |^  , |^ , |^, |") %>%
  str_replace_all("\n+", "\n") %>%
  str_replace_all("‘", "'") %>%
  str_replace_all("’", "'") %>%
  str_replace_all("“", "\"") %>%
  str_replace_all("”", "\"") %>%
  str_replace_all("–", "-") %>%
  str_replace_all("Ã¶", "oe") %>%
  str_replace_all("Â", "") %>%
  str_replace_all("Ã©", "é") %>%
  str_remove_all("\"|,|\\\\|\\n|&nbsp") %>%
  gsub("([a-zA-Z0-9]\\.)([A-Z])", "\\1 \\2", .) %>%
  gsub("([a-z]\\.\\))([A-Z])", "\\1 \\2", .) %>%
  trimws()
