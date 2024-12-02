library(shiny)

shinyUI(fluidPage(
     titlePanel(h2("Download base in Shiny *** Example", align = "center")),
     sidebarLayout(
          sidebarPanel(
               selectInput("var1", "Select X variable", choices = colnames(iris)[-5]),
               selectInput("var2", "Select Y variable", choices = colnames(iris)[-5]),
               radioButtons("type", "Download output", choices = c("png", "pdf"))
          ),
          mainPanel(
               plotOutput("plot"),
               downloadButton("dw")
          )
     )
)
     
)