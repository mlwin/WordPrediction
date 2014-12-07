library(shiny)


shinyUI(fluidPage(
  titlePanel("Word Prediction"),
  
  sidebarLayout(
    sidebarPanel(

      
      textInput("textEntry", "Please enter text:", ""),
      

      br()
      
      
    ),
    
    mainPanel(h4("Predicted word:"), verbatimTextOutput("text1"))
    
    #fluidRow(
    #     column(3, wellPanel(
    #     h4("Predicted word:"),
    #     verbatimTextOutput("text1")
    #  ))
  )  
))


# library(shiny)
# setwd("C:/NLP/")
# runApp("ShinyApp")

# setwd("C:/NLP/ShinyApp")
# library(shinyapps)
# deployApp()

