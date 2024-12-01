library(shiny)

shinyServer(
     function(input, output) {
          output$hist <- renderPlot({
               req(input$var)
               hist(
                    iris[[input$var]], 
                    breaks = seq(0, max(iris[[input$var]]), length.out = input$slide + 1),
                    col = input$color,
                    main = paste("Histogram of", input$var),
                    xlab = input$var
               )
          })
     }
)
