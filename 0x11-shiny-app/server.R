library(shiny)
library(ggplot2)

shinyServer(function(input, output){
     variables <- reactive(
          switch (input$data,
               "iris" = names(iris),
               "mtcars" = names(mtcars),
               "trees" = names(trees)
          )
     )
     output$vx <- renderUI(
          selectInput("varx", "Select the X variable", choices = variables())
     )
     
     output$vy <- renderUI(
          selectInput("vary", "Select the Y variable", choices = variables())
     )
     
     output$p <- renderPlot({
          attach(get(input$data))
          plot(x = get(input$varx), y = get(input$vary), 
               xlab = input$varx, ylab = input$vary) 
     })
     
     
})