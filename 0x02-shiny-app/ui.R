library(shiny)

shinyUI(
     fluidPage(
          titlePanel("Shiny with widget, part 2"),
          sidebarLayout(
               sidebarPanel(h3("Enter personal details"),
                            textInput("name","Enter your name", value = "Mayo"),
                            textInput("age", "Enter your age", value = NULL),
                            radioButtons("gender", "Select your gender", 
                                         choices = c("Male", "Female"))),
               mainPanel(h2("Personal details"),
                         textOutput("myname"),
                         textOutput("myage"),
                         textOutput("mygender")
               )
          )
     )
)