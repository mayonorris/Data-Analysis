library(shiny)

# Increasing shiny file input max size limit
options(shiny.maxRequestSize = 200 * 1024^2) # 200Mb

shinyServer(function(input, output) {
     # Reactive expression to read the uploaded file
     data <- reactive({
          file1 <- input$file
          if (is.null(file1)) {
               return(NULL)
          }
          read.table(
               file = file1$datapath,
               sep = input$sep,
               header = input$header,
               stringsAsFactors = input$stringsAsFactors
          )
     })
     
     # Render file information
     output$filedf <- renderTable({
          if (is.null(input$file)) {
               return(NULL)
          }
          input$file
     })
     
     # Render dataset
     output$table <- renderTable({
          if (is.null(data())) {
               return(NULL)
          }
          data()
     })
     
     # Render summary of the dataset
     output$sum <- renderTable({
          if (is.null(data())) {
               return(NULL)
          }
          summary(data())
     })
     
     # Dynamic UI for tabs
     output$tb <- renderUI({
          if (is.null(data())) {
               h5("Powered by", tags$img(src = "RStudio_logo.png", height = 300, width = 300))
          } else {
               tabsetPanel(
                    tabPanel("About the file", tableOutput("filedf")),
                    tabPanel("Data", tableOutput("table")),
                    tabPanel("Summary", tableOutput("sum"))
               )
          }
     })
})
