library(readxl)

news <- read_xlsx("C:/news/package/news articles data/news.xlsx")

save(news, file = "C:/news/package/textwork/data/news.rda")
