library(shiny)


shinyUI(fluidPage(
  titlePanel("Word Prediction - Data Science Specialization Capstone Project"),
  
  sidebarLayout(
    sidebarPanel(
      
      textInput("textEntry", "Loading data...please wait!", ""),
      

      br()
      
      
    ),
    
    mainPanel(
              h4("Predicted word:"), 
              verbatimTextOutput("text1"), 
              tags$head(tags$style("#text1{color: blue;font-size: 20px;font-style: normal;}")),
              h5("Additonal Suggestion(s)"),
              verbatimTextOutput("text2"))
                        
  )  
))

