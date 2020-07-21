### install regular packages

install.packages("reticulate") # python support in RMarkdown
install.packages("ggplot2") # for plotting
install.packages(c("rmarkdown", "caTools", "bitops")) # for knitting

# Widget demos
install.packages("leaflet") # for maps
install.packages("dygraphs") # for timeseries

### install bioconductor packages
# install.packages("BiocManager")
# BiocManager::install("package")

### install GitHub packages (tag = commit, branch or release tag)
# install.packages("devtools")
# devtools::install_github("user/repo", ref = "tag")
