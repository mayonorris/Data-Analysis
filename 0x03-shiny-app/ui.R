library(shiny)

shinyUI(
     fluidPage(
          titlePanel("Slider in shiny"),
          sidebarLayout(
               sidebarPanel(
                    sliderInput("slide", "Select a number", min = 0.5,
                                max = 10.5, value = 5, step = 0.5)
                    
               ),
               mainPanel(
                    textOutput("val")
               )
          )
     )
)