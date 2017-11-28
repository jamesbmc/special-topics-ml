# Introductory example using the housing data used here
# http://www.r2d3.us/visual-intro-to-machine-learning-part-1/

library(rpart)
library(rpart.plot)
library(shiny)

# Read in data
source('decision_tree.R')
shinyServer(function(input, output){
  # Use a reactive expression so that you only run the code once
  GetResults <- reactive ({
    return(SimpleTree(input$features))
  })
  output$plot <- renderPlot({
    results <- GetResults()
    return(results$tree)
  })
  output$accuracy <- renderText({
    results <- GetResults()
    return(results$accuracy)
  })
})
