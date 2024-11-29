library(shiny)

shinyUI(
     fluidPage(
          titlePanel(title =  "Hello Shiny!!!"
               
          ),
     sidebarLayout(
          sidebarPanel(h3("Here is the sidebar panel"), h4("Okay")),
          mainPanel(h5("This is the main Panel text, output is displayed here")),
          position = "right"
     )
     )
)