### install regular packages

install.packages("remotes")

install.packages("reticulate") # python support in RMarkdown
install.packages("kableExtra")
install.packages("hablar")

install.packages("ggplot2") # for plotting
install.packages("plotly") # for interactive plotting

install.packages(c("rmarkdown", "caTools", "bitops")) # for knitting

install.packages("revealjs") #presentation

# Widget demos
install.packages("leaflet") # for maps
install.packages("dygraphs") # for timeseries

library(devtools)
install_github("ajrgodfrey/BrailleR")

### install bioconductor packages
# install.packages("BiocManager")
# BiocManager::install("package")

### install GitHub packages (tag = commit, branch or release tag)
# install.packages("devtools")
# devtools::install_github("user/repo", ref = "tag")
