library(shiny)


shinyUI(fluidPage(
  titlePanel("Word Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Please enter text"),
      
      textInput("textEntry", "Input Text", ""),
      

      br(),
      
      actionButton("get", "Submit")
      
      
    ),
    
    mainPanel(verbatimTextOutput("text1"))
  )  
))

# library(shiny)
# setwd("C:/NLP/")
# runApp("ShinyApp")

# setwd("C:/NLP/ShinyApp")
# library(shinyapps)
# deployApp()
