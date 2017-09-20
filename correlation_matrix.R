# Inputting csc data for correlation

#packages
require(corrplot)

# inputting data
csc <- read.csv("./data/mark_csc.csv")

corrplot(csc, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)