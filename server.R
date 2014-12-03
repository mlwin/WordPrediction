library(shiny)
library(tm)
library("RWeka")
library(RWekajars)
library(stringr)


load("wf4.rda", .GlobalEnv)
load("wf3.rda", .GlobalEnv)
load("wf2.rda", .GlobalEnv)

shinyServer(function(input, output) 
{
  lookUp2Gram <-function(str1word)
  {
    return (wf2[wf2$gram == str1word,])
  }
  
  lookUp3Gram <-function(str2words)
  {
    return (wf3[wf3$gram == str2words,])
  }
  
  lookUp4Gram <-function(str3words)
  {
    return (wf4[wf4$gram == str3words,])
  }
  
  lookUp <- function(words)
  {
    c = Corpus(VectorSource(words))
    
    c <- tm_map(c, removeNumbers)
    c <- tm_map(c, removePunctuation)
    c <- tm_map(c, stripWhitespace)
    c <- tm_map(c, tolower)
    
    len = length(strsplit(words,' ')[[1]])
    
    if(len >= 3)
    {
      w3 = word(c[[1]], -3, -1)
      print("4 gram")
      print(w3)
      # look up 3 words
      l = lookUp4Gram(w3)
      if(dim(l)[1] > 0)
      {
        return (l[1,'word'])
      }
    }
    
    if(len >= 2)
    {
      w2 = word(c[[1]], -2, -1)
      print("3 gram")
      print(w2)
      
      # look up 2 words
      l = lookUp3Gram(w2)
      if(dim(l)[1] > 0)
      {
        return (l[1,'word'])
      }
    }
    
    if(len >= 1)
    {
      w1 = word(c[[1]], -1, -1)
      print("2 gram")
      print(w1)
      
      # look up 1 word
      l = lookUp2Gram(w1)
      if(dim(l)[1] > 0)
      {
        return (l[1,'word'])
      }
    }
    
    
    return ("Not found")
    
    
  }
  
  output$text1 <- renderText({ 
    if(input$textEntry == '' || input$textEntry == ' ')
    {
      ptext = ""
    }
    else
    {
      ptext = lookUp(input$textEntry)
    }
    
    paste("The predicted text is ", ptext)
    
  })
  
  
})

