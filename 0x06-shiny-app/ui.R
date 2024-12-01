library(shiny)

#file.copy("../0x05-shiny-app/ui.R", "./ui.R", overwrite = TRUE)
shinyUI(
     fluidPage(
          titlePanel(h2("Tabsets Shiny", align = "center")),
          sidebarLayout(
               sidebarPanel(
                    selectInput("var", "1. Select a variable from the iris dataset",
                                choices = colnames(iris[-5])),
                    sliderInput("slide", "2. Select the number of bins for the histogram",
                                min = 5, max = 15, value = 10),
                    radioButtons("color", "3. Select the color of the histogram",
                                 choices = c("Green", "Blue", "Yellow"), selected = "Blue")
               ),
               mainPanel(
                    tabsetPanel(type = "pills",
                         tabPanel("Summary", verbatimTextOutput("sum")),
                         tabPanel("Structure", verbatimTextOutput("str")),
                         tabPanel("Data", tableOutput("data")),
                         tabPanel("Visualization", plotOutput("hist")) # Place plotOutput inside a valid tabPanel
                    )
               )
          )
     )
)
