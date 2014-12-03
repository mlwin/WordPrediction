library(shiny)


shinyServer(function(input, output) 
{
  
  
  output$text1 <- renderText({ 
    
    ptext = ""
    paste("The predicted text is ", ptext)
    
  })
  
  
})