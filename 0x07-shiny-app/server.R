library(shiny)

shinyServer(function(input, output){
     x <- reactive({
          iris[,input$var1]
     })
     y<-reactive({
         iris[,input$var2] 
     })
     title <- reactive({
          paste("Scatter plot of", input$var1, "and", input$var2, sep = " ")
          })
     output$plot <-renderPlot(plot(x(),y(), main = title(), col = "blue"))
     output$dw <-downloadHandler(
          filename = function(){
               paste("iris", input$type, sep = ".")
          },
          content = function(file){
               if(input$type == "png"){
                    png(file)
               } else {
                    pdf(file)
               }
               plot(x(), y())
               dev.off()
          }
     )
}
)