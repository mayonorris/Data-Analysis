library(shiny)
shinyUI(fluidPage(
     titlePanel(h2("Submit button in shiny-Part II", align = "center")),
     sidebarLayout(sidebarPanel(
          selectInput("dataset", "select a dataset", choices = c("iris", "mtcars", "pressure")),
          numericInput("frac", "Enter the proportion of the dataset that must be displayed. Range : 0-1: ", 
                       value = 0.05, min = 0.01, max = 1),
          submitButton("Update!"),
          p("Click on the update button to update your choices")
     ),
     mainPanel(
          h3(textOutput("dataname")),
          verbatimTextOutput("structure"),
          h4(textOutput("observation")),
          tableOutput("view")
     ))
)
)