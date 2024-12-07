library(shiny)
library(datasets )
shinyServer(function(input, output){
     output$dataname <- renderText(
          paste("Structure of the dataset", input$dataset)
     )
     output$observation <- renderText(
          paste("One sample of", input$frac * 100,"%", "of the", input$dataset, "dataset","is :")
     )
     output$structure <- renderPrint(str(get(input$dataset)))
     output$view <- renderTable(
          dplyr::sample_frac(get(input$dataset), size = input$frac)
     )
})