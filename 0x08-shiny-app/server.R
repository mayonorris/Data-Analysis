library(shiny)

shinyServer(function(input, output) {
     # Reactive dataset based on user selection
     dataset <- reactive({
          switch(input$dataset,
                 "iris" = iris,
                 "mtcars" = mtcars,
                 "trees" = trees)
     })
     
     # Reactive file extension based on format selection
     fileexp <- reactive({
          switch(input$format,
                 "CSV" = "csv",
                 "Text(TSV)" = "txt",
                 "Text(Space separated)" = "txt",
                 "Doc" = "doc")
     })
     
     # Render the selected dataset as a table
     output$table <- renderTable({
          dataset()
     })
     
     # Download handler
     output$down <- downloadHandler(
          filename = function() {
               paste(input$dataset, fileexp(), sep = ".")
          },
          content = function(file) {
               sep <- switch(input$format,
                             "CSV" = ",",
                             "Text(TSV)" = "\t",
                             "Text(Space separated)" = " ",
                             "Doc" = " ")
               write.table(dataset(), file = file, sep = sep, row.names = FALSE)
          }
     )
})
