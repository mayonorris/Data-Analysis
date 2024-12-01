library(shiny)
#file.copy("../0x05-shiny-app/server.R", "./server.R", overwrite = TRUE)

shinyServer(
     function(input, output) {
          
          output$sum <- renderPrint(summary(iris))
          output$str <- renderPrint(dplyr::glimpse(iris))
          output$data <- renderTable({
               iris
          })
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
