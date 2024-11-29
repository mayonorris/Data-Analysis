library(shiny)

shinyUI(
     fluidPage(
          titlePanel(title =  "Hello Shiny!!!"
               
          ),
     sidebarLayout(
          sidebarPanel("Here is the sidebar panel"),
          mainPanel("This is the main Panel text, output is displayed here")
     )
     )
)