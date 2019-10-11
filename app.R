#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

library(reticulate)
#import("pandas")
#import("random")
import("numpy", as = "np")

#source_python('python/random_vector.py')

ui <- fluidPage(
    #actionButton("runif", "Uniform"),
    actionButton("go", "go"), 
    hr(),
    plotOutput("plot")
)

server <- function(input, output){
    v <- reactiveValues(data = NULL)
    
    # observeEvent(input$runif, {
    #     v$data <- runif(100)
    # })
    
    observeEvent(input$go, {
        #v$data <- randomNumbers()
        v$data <- rnorm(100) # This is where I will call a python function to return random numbers
    })  
    
    output$plot <- renderPlot({
        if (is.null(v$data)) return()
        hist(v$data)
    })
}

shinyApp(ui, server)