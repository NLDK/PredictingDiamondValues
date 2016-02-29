library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Predicting Diamond Prices"),
  h4("Please select the diamond's carat and quality for which you are trying to estimate it's value. The predicted dollar value is displayed to the right, this value is generated from a linear model on the ggplot2 diamonds dataset."),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("Carats",
                  "Carat:",
                  min = 1,
                  max = 5,
                  value = 1.5,
                  step=0.1),
      selectInput('cut', 'Quality of Diamond Cut',choices=c("Fair", "Good", "Very Good", "Premium", "Ideal"), selected = "Fair")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h3('Predicted Diamond Value'),
      textOutput("predictedValue"),
      h3('Visualization of the Diamonds Dataset (training data)'),
      plotOutput("distPlot")
    )
  )
))
