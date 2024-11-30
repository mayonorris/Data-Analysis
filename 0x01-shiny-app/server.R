library(shiny)

shinyServer(
     function(input, output) {
          output$name <-renderText(input$name)
          output$age <- renderText(input$age)
     }
     
)