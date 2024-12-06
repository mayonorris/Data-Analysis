library(shiny)

shinyUI(
     fluidPage(
          titlePanel(title = h2("Download Table in Different Formats in Shiny", align = "center")),
          sidebarLayout(
               sidebarPanel(
                    selectInput("dataset", "Select a dataset", choices = c("iris", "mtcars", "trees")),
                    br(),
                    helpText("Select the download format"),
                    radioButtons("format", "Format type:", choices = c("CSV", "Text(TSV)", "Text(Space separated)", "Doc")),
                    br(),
                    helpText("Click on the download button to download the dataset"),
                    downloadButton("down", "Download")
               ),
               mainPanel(
                    tableOutput("table")
               )
          )
     )
)
