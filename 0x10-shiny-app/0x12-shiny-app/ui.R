library(shiny)

shinyUI(fluidPage(
     titlePanel(h2("Dynamically creating tabs based on user input - RenderUI()", align = "center")),
     sidebarLayout(
          sidebarPanel(
               numericInput("n", label = "Enter the numder of tabs you want: ",
                            value = 2)
               
          ),
          mainPanel(
               uiOutput("tabs")
          )
     )
))