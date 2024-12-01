library(shiny)

shinyUI(fluidPage(
     titlePanel(h3("RenderPlot in Shiny : Histogram", align = "center")),
     sidebarLayout(
          sidebarPanel(selectInput("var", "1. Select a variable from the iris dataset",
                                   choices = colnames(iris[-5])),
                       sliderInput("slide", "2. Select the number of bins for the histogram",
                                   min = 5, max = 15, value = 10),
                       radioButtons("color", "3. Select the color of the historam",
                                    choices = c("Green", "Blue", "Yellow"), selected = "Blue")
                       ),
          mainPanel(
               plotOutput("hist")
          )
     )
)
     
)