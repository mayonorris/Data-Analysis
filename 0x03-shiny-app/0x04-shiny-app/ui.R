library(shiny)

shinyUI(fluidPage(
     titlePanel("Select Input UI in Shiny"),
     sidebarLayout(
          sidebarPanel(
               selectInput("states", "Select the State", choices = 
                                c("California", "Texas", "Florida", "New York", "Arizona"),
                           selected = "Texas")
          ),
          mainPanel(
               textOutput("state")
          )
     )
)
     
)