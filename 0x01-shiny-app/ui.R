library(shiny)

shinyUI(fluidPage(
     titlePanel("text input in shiny ==>"),
     sidebarLayout(
          sidebarPanel(h3("enter personal info"),
                       textInput("name", "Enter your name", value = "Doe"),
                       textInput("age", "Enter your age", value = NA)),
          mainPanel(h2("Personal information:"),
                    textOutput("name"),
                    textOutput("age")
                    )
     )
)
)