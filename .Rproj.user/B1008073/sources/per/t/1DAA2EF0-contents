library(ggplot2)
library(leaflet)
library(dplyr)
library(tidyr)
library(leaflet.minicharts)
#library(jsonlite)
#library(curl)
#library(lubridate)


########---------------------------------------------------------------------#>>>
## Retrieve the data in JSON format from opendata.dc.gov using fromJson()

setwd("D:/NAOGONG/2017Fall/ProgrammingForAnalytics/Individual Project/Bike/")
MyData <- read.csv(file="Capital_Bike_Share_Locations.csv", header=TRUE, sep=",")
#MyData <- fromJSON('http://opendata.dc.gov/datasets/dc3289eab3d2400ea49c154863312434_8.geojson')
## use cbind() combine the list elements and create a dataframe
#bike_data <- MyData[,c("A","B","E")]


## Get distinct Offenses for shiny input
NOBike <- distinct(select(MyData,NUMBER_OF_BIKES))
row.names(NOBike) <- NOBike$NUMBER_OF_BIKES





#Shiny server
function(input, output, session) {
  
  
  filterData <- reactive({
    MyData[MyData$NUMBER_OF_BIKES >= input$range[1] & MyData$NUMBER_OF_BIKES <= input$range[2]&MyData$NUMBER_OF_EMPTY_DOCKS >= input$range1[1] & MyData$NUMBER_OF_EMPTY_DOCKS <= input$range1[2], ]
  })
  
  
  output$plotNOB <-  
    renderPlot({
      NOB <- as.data.frame(table(filterData()$NUMBER_OF_BIKES))
      NOB$Freq <- as.numeric(NOB$Freq)
      NOB$Var1 <- factor(NOB$Var1)
      colnames(NOB) <- c("NUMBER_OF_BIKES","COUNT")
      ggplot(NOB, aes(x=NUMBER_OF_BIKES,y=COUNT)) +
        geom_bar(stat="identity",alpha = 0.3,color='red',fill='red') +
        ggtitle("Number of Bikes by Stations") +
        geom_text(aes(label = NOB$COUNT), size = 5.5, hjust = .77, color = "black")+
        coord_flip()+
        theme(axis.title=element_text(size=10),
              axis.text.x = element_text(face = 'bold', size=10, hjust = 1)
        )
      
    })


  

  
  points <- reactive({cbind(filterData()$LONGITUDE,filterData()$LATITUDE)}) 
  
  bikedata <- reactive({cbind(Bikes = filterData()$NUMBER_OF_BIKES,Empty_Docks = filterData()$NUMBER_OF_EMPTY_DOCKS)}) 
  
  x<-reactive({input$Display})
  
  output$mymap <- renderLeaflet({
    
    
      
      if (x() == "mk") {
        leaflet() %>%
          addProviderTiles("OpenStreetMap.Mapnik",
                           options = providerTileOptions(noWrap = TRUE)
          ) %>%
          addMarkers(data = points(),
                     popup = paste0("<strong>Terminal Number: </strong>",
                                    filterData()$TERMINAL_NUMBER,
                                    "<br><strong>Bikes: </strong>", 
                                    filterData()$NUMBER_OF_BIKES, 
                                    "<br><strong>Empty Docks: </strong>", 
                                    filterData()$NUMBER_OF_EMPTY_DOCKS,
                                    "<br><strong>Installed: </strong>",
                                    filterData()$INSTALLED,
                                    "<br><strong>Address: </strong><br>",
                                    filterData()$ADDRESS
                     ),
                     clusterOptions = markerClusterOptions()
          )
        
      } else {
        colors <- c("#FF4500", "#FFD700")
        leaflet() %>%
          addProviderTiles("OpenStreetMap.Mapnik",
                           options = providerTileOptions(noWrap = TRUE)
          ) %>%
          addMinicharts(
            
            filterData()$LONGITUDE,filterData()$LATITUDE,
            type = "pie",
            chartdata = bikedata(), 
            colorPalette = colors,
            legend = TRUE,
            legendPosition ="bottomright"
            #width = 60 * sqrt(prod2016$total) / sqrt(max(prod2016$total)), transitionTime = 0
          )
          
        
        
      }
      
      
      
    
    
    
  })
  
  
 
  observeEvent(input$Display,{
    
    
    
      
    
    

    
    
    
  })
               
               
               
               
}