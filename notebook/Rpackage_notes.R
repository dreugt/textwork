library(devtools)
library(roxygen2)  # Read in the roxygen2 R package

path <- "C:/news/package"

setwd(file.path(path, "textwork"))
document()                           # Builds the help files

# upload to Github and then install
install_github("dreugt/textwork")
