library(shiny)
library(shinythemes)
library(leaflet)
library(leaflet.minicharts)

setwd("D:/NAOGONG/2017Fall/ProgrammingForAnalytics/Individual Project/Bike/")
MyData <- read.csv(file="Capital_Bike_Share_Locations.csv", header=TRUE, sep=",")
bootstrapPage(#theme = shinytheme("cerulean"),
              tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
              leafletOutput("mymap", width = '100%', height = '100%'),
              absolutePanel(top = 10, right = 10,
                            sliderInput("range", "Number of Bikes", min(MyData$NUMBER_OF_BIKES), max(MyData$NUMBER_OF_BIKES),
                                        value = range(MyData$NUMBER_OF_BIKES), step = 1.0
                            ),
                            sliderInput("range1", "Empty Docks", min(MyData$NUMBER_OF_EMPTY_DOCKS), max(MyData$NUMBER_OF_EMPTY_DOCKS),
                                        value = range(MyData$NUMBER_OF_EMPTY_DOCKS), step = 1.0
                            ),
                            selectInput("Display", "Display Type:",
                                        c("Markers" = "mk",
                                          "Pie" = "pie")),
                            tableOutput("data")
                            )
              )
            
          
