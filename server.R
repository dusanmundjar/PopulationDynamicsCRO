library(shiny)
library(UsingR)
library(pyramid)

#Projekcije stanovništa RH 2010-2061, Izvor: DZS
DZS_p10.61 <- read.table("./data/DZS_p10-61.txt", header=TRUE, quote="\"")

piramida<-function(godina=2015){
  piramida=pyramid(data.frame(DZS_p10.61[c(1:96),3+(godina-2010)*3],DZS_p10.61[c(1:96),(godina-2010)*3],DZS_p10.61[c(1:96),1]),
                   Llab="Men",Rlab="Women",
                   Clab="Age",Laxis=seq(0,40,len=5),
                   AxisFM="d", AxisBM=",", Csize=0.75,  Cstep=10 ,
                   main=paste("Year: ",godina)
  )
}

##############################################################
###DATA AND FUNCTIONS
##############################################################

#####pyramid plot for desired year
piramida<-function(godina=2015){
  piramida=pyramid(data.frame(DZS_p10.61[c(1:96),3+(godina-2010)*3],DZS_p10.61[c(1:96),(godina-2010)*3],DZS_p10.61[c(1:96),1]),
                   Llab="Men",Rlab="Women",
                   Clab="Age",Laxis=seq(0,40,len=5),
                   AxisFM="d", AxisBM=",", Csize=0.75,  Cstep=10 ,
                   main=paste("Year: ",godina)
  )
}


####vector of size of generations in each year
population.count<-function(godina=2015){
  populacija=DZS_p10.61[1:96,(godina-2010)*3+2]
}       

####plot of size of generations in each year
population.draw<-function(godina=2015){
  qplot(x=c(0:95),y=population.count(godina), 
        geom="line",
        main=paste("year",godina),
        xlab="age",ylab="population size (thsd.)")
}

##plot of difference in years  (apsolute)
population.draw.diff.aps<-function(godina=2015){
  qplot(x=c(0:95),y=population.count(godina)-population.count(2015), 
        geom="line",
        main=paste("Apsolute difference in population size:",godina,"-",2015),
        xlab="age",ylab="Population change (thsd.)")
}


##plot of difference in years  (relative)
population.draw.diff.rel<-function(godina=2015){
  qplot(x=c(0:95),y=100*((population.count(godina)-population.count(2015))/population.count(2015)), 
        geom="line",
        main=paste("Relative difference in population size:",godina,"-",2015),
        xlab="age",ylab="Population change (%)")
}


shinyServer(
  function(input,output) {
    
    output$myPiramid <-renderPlot({
      year <- input$Year1
      par(mfrow = c(1,2))
      piramida(2015)
      piramida(year)  
    })
    output$Plot1 <-renderPlot({
      year <- input$Year1
      population.draw(year)
    })
    
    output$Plot2 <-renderPlot({
      year <- input$Year1
      population.draw.diff.aps(year)
    })
    
    output$Plot3 <-renderPlot({
      year <- input$Year1
      population.draw.diff.rel(year)
    })
  }
)
