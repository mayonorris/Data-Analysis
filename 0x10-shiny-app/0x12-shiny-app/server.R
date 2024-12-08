library(shiny)

shinyServer(function(input, output){
     output$tabs <- renderUI({
          Tabs<- lapply(paste("Tab n°.", 1:input$n, sep = " "), tabPanel)
          do.call(tabsetPanel, Tabs)
     })
})