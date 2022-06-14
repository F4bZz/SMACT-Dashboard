# Fügen oder geben Sie hier Ihren Skriptcode ein:´

#load libraries
library(png)
library(grid)
library(ggplot2)

# get the url string from the imported data frame. Convert it to a character vector.
urlstring <- as.vector(dataset[1,1])
# if you use an image URL, you have to download the file first:
#z <- tempfile()
#download.file(url = urlstring,destfile = z,mode="wb")

#read the PNG image file
pic <- readPNG(urlstring)

# create a raster of the PNG file
g<-rasterGrob(pic,interpolate=TRUE)
# create a plot and add the image
p <- qplot(1:10,1:10,geom="blank") + annotation_custom(g,xmin=-Inf,xmax=Inf,ymin=-Inf,ymax=Inf)
# remove all clutter from the plot and display it
p + theme(axis.line=element_blank(),axis.text.x=element_blank(),
          axis.text.y=element_blank(),axis.ticks=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank(),legend.position="none",
          panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(),plot.background=element_blank())
