library(shiny)

shinyServer(
     function(input, output) {
          output$val <-renderText(paste(
               "The value you've selected is : ==>", input$slide)
               )
     }
)