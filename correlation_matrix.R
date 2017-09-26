# Inputting csc data for correlation

#packages
require(corrplot)
require(tidyr)
require(plyr)
require(dplyr)

# inputting data
csc <- read.csv("./data/mark_csc_clean.csv")

##### Revised this now to just a clean import df
# # we want to remove specific sites including the plantation and the late successional
# rm.plot.list <- c("bp_98_1.CSV", "bp_98_2.CSV","bs_42a.CSV", "bs_42b.CSV", "bs_42c.CSV", "bs_40_e.CSV", "bs_40f.CSV", "bs_40x.CSV",
#                   "cp_2.CSV", "cp_3.CSV")

#Let's look at the structure here
str(csc)

csc$dg.fraction <- csc$deep.gaps / csc$transect.length

rp <- subset(csc, csc$class == "red pine")
mix <- subset(csc, csc$class == "mixed")
# Let's make a new df for a correlation matrix. We have to get rid of all of the columns that 
#will interfere

#columsn to drop
drops <- c( "plot", "plot_1", "class")

rp <- rp[, !(names(rp) %in% drops)]
mix <- mix[, !(names(mix) %in% drops)]


# let's runn the correlation matrix
m.rp <- cor(rp)
m.mix <- cor(mix)
n <- m[,1] 

# Now let's do a correlation matrix
# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
x11(width = 10, height = 10)
corrplot(m.mix,  method = "color")

corrplot(n)

