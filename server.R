library(shiny)

shinyServer(function(input, output){
     output$text1 <- renderText({
          paste("My first name is :", input$text1)
     })
     
     output$text2 <- renderText({
          paste("My last name is :", input$text2)
     })
})