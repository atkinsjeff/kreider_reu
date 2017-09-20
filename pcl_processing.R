# PCL processing file
#devtools::install_github("atkinsjeff/forestr")

require(forestr)

data_dir <- "./data/pcl/"

process_multi_pcl(data_dir, 1.05, 10, 8)


# Merging script

#multimerge script

####merge files
output_directory <- "./output/output/"

# 
# multmerge = function(output_directory){
#   filenames=list.files(path=output_directory, full.names=TRUE)
#   datalist = lapply(filenames, function(x){read.csv(file=x,header=TRUE)})
#   Reduce(function(x,y) {merge(x,y)}, datalist)
# }
# 
# #bob_data = multmerge(output_directory)
# 
# file_names <- output_directory #where you have your files
# 
# your_data_frame <- do.call(rbind,lapply(output_directory, read.csv))
# #
library(dplyr)
library(readr)
df <- list.files(path = output_directory, full.names = TRUE) %>%
  lapply(read_csv) %>%
  bind_rows

df <- data.frame(df)
write.csv(df, "./data/mark_csc.CSV")