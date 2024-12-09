library(shiny)

shinyUI(
     fluidPage(
          titlePanel(h2("File Input with Shiny", align = "center")),
          sidebarLayout(
               sidebarPanel(
                    fileInput("file", "Upload the data file"),
                    helpText("Default max file size: 5Mb"),
                    tags$hr(),
                    h5(helpText("Select the read.table parameters below")),
                    checkboxInput("header", "Header", value = FALSE),
                    checkboxInput("stringsAsFactors", "stringsAsFactors", value = FALSE),
                    br(),
                    radioButtons(
                         "sep", "Separator",
                         choices = c(
                              Comma = ",",
                              Semicolon = ";",
                              Tab = "\t",
                              Space = " "
                         )
                    )
               ),
               mainPanel(
                    uiOutput("tb")
               )
          )
     )
)
