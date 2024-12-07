library(shiny)

shinyUI(fluidPage(
     titlePanel(h2("Submit button in shiny-Part I", align = "center")),
     sidebarLayout(sidebarPanel(
          textInput("text1", "Enter your first name here: ", value = "John"),
          textInput("text2", "Enter your last name here: ", value = "Doe"),
          submitButton("Update!"),
          p("Click on submit button in order to update!!!")
     ),
     mainPanel(
          textOutput("text1"),
          textOutput("text2")
     )
     )
))