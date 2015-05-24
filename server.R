library(shiny)

shinyServer(function(input, output) {
    
    # reactive programming to get the varaible the user want to plot
    variableInput <- reactive({
        switch(input$dataset,
               "latitude" = "lat",
               "longitude" = "long",
               "depth" = "depth",
               "magnitude" = "mag",
               "stations" = "stations")
    })
    
    # Plot the histgram the user want to plot
    output$histPlot <- renderPlot(
        hist(quakes[quakes$mag >= input$min & quakes$mag <= input$max,variableInput()],
             xlab = variableInput(), main = paste("Histogram of", variableInput()), col = "yellow") 
    )
    
    # Get the number of the earthquakes that resides in the specified range
    output$number <- renderText(paste("There are", nrow(quakes[quakes$mag >= input$min & quakes$mag <= input$max, ]), 
                                      "earthquakes that have magnitude in this range."))
    
    # Get the summary statistics of the earthquake that resides in the specific range
    output$summary <- renderPrint({
        summary(quakes[quakes$mag >= input$min & quakes$mag <= input$max,])
    })
    
})