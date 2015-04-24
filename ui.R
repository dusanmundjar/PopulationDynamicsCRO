
library(shiny)

##############################################################
###USER INTERFACE
##############################################################

shinyUI(fluidPage(pageWithSidebar(
  ##headerPanel
  headerPanel(p("Population dynamics - Croatia"))
  ##mainPanel
  ,mainPanel(
    hr(),
    p(span(strong("Data source")),
      span(": Population projections of the Republic of Croatia 2010-2061,\n"),
      span(" Croatian Bureau of Statistics, 2011")),
    p(span(strong("How to  use?")), span("Selects desired year.")),
    p(span(strong("Results?")), 
      span("Population pyramid, 
           Age structure of population, 
           Apsolute change in structure of population by age  and 
           Relative change in structure of population by age")),
    p("Prepared by: Dušan Munđar", style = "color:blue"),
    p("Contact e-mail:",
      a("dusan.mundjar@gmail.com:", 
        href = "mailto:dusan.mundjar@gmail.com")),
    code("QQP - MORE, BETTER AND WITH  SMILE"),
    hr(),
    plotOutput('myPiramid', height = 500, width = 800),
    hr(),
    plotOutput('Plot1', height = 400, width = 600),
    hr(),
    plotOutput('Plot2', height = 400, width = 600),
    hr(),
    plotOutput('Plot3', height = 400, width = 600)
    
      )
  ##sidebarpanel
  ,sidebarPanel(
    sliderInput('Year1', 'Select  desired year',
                value = 2015, min = 2015, max = 2060, step = 1,),hr()
  )
    ))
)