library(shiny)


shinyUI(fluidPage(
  titlePanel("Word Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Please enter text"),
      
      textInput("symb1", "Stock 1", "XLI"),
      

      br(),
      
      actionButton("get", "Submit")
      
      
    ),
    
    mainPanel(verbatimTextOutput("text1"))
  )  
))

