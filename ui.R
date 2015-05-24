library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
    
    # Application header
    headerPanel("Earthquakes"),
    
    sidebarPanel(        
        # textInput to specify the min and max of the desired magnitude
        textInput("min", "lower range of the magnitude:", 4.0),
        textInput("max", "upper range of the magnitude:", 6.4),
        
        # selectInput to select the histgram you want to draw
        selectInput("dataset", "Choose an earthquake variable:", 
                   choices = c("latitude", "longitude", "depth", "magnitude", "stations"))
    ),    
        
    mainPanel(
        # summary statistics of the earthquake
        verbatimTextOutput("summary"),
        # number of earthquake that reside in the range you specified
        textOutput("number"),
        # A plot of the histgram
        plotOutput("histPlot")               
    )
))