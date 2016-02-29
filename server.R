
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(dplyr)
data("diamonds")

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    ggplot(diamonds, aes(x=carat, y=price, colour=cut)) + geom_point() + stat_smooth()
  })
  
  output$predictedValue <- renderPrint({
    fit <- lm(price ~ carat + cut, data=diamonds)
    selectedCut <- {input$cut}
    selectedCarat <- {input$Carats}
    df <- data.frame(c(selectedCut), c(as.numeric(selectedCarat)))
    names(df) <- c('cut', 'carat')
    round(predict(fit, df)[1], digits=2)
  })

})
