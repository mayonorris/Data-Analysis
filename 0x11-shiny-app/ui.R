library(shiny)

shinyUI(fluidPage(
     titlePanel(h2("Dynamic User interface with shiny - RenderUI()", align = "center")),
     sidebarLayout(
          sidebarPanel(
          selectInput(inputId = "data", "Select a dataset", choices = c("iris", "mtcars", "trees")),
          br(),
          helpText("The following selectinput drop down choices are dynamically populated based on the selected dataset"),
          uiOutput("vx"),
          br(),
          uiOutput("vy")
     ),
     mainPanel(
          plotOutput("p")
     )
     )
))