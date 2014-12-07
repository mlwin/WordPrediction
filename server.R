library(shiny)
library(tm)
library("RWeka")
library(RWekajars)
library(stringr)
library(plyr)

loaded = FALSE
load("wf4.rda", .GlobalEnv)
load("pf3.rda", .GlobalEnv)
load("pf2.rda", .GlobalEnv)
loaded = TRUE

shinyServer(function(input, output) 
{
  lookUp2Gram <-function(str1word)
  {
    return (pf2[pf2$gram == str1word,])
  }
  
  lookUp3Gram <-function(str2words)
  {
    return (pf3[pf3$gram == str2words,])
  }
  
  lookUp4Gram <-function(str3words)
  {
    return (wf4[wf4$gram == str3words,])
  }
  
  lookUp <- function(words)
  {
    words = str_trim(words)
    c = Corpus(VectorSource(words))
    
    c <- tm_map(c, removeNumbers)
    c <- tm_map(c, removePunctuation)
    c <- tm_map(c, stripWhitespace)
    c <- tm_map(c, tolower)
    
    words = c[[1]]
    
    len = length(strsplit(words,' ')[[1]])
    
    if(len >= 3)
    {
      w3 = word(c[[1]], -3, -1)
      print("4 gram")
      # look up 3 words
      l = lookUp4Gram(w3)
      if(dim(l)[1] > 0)
      {
        # order based on freq
        l = arrange(l,desc(freq))
        return (l[1,'word'])
      }
    }
    
    if(len >= 2)
    {
      w2 = word(c[[1]], -2, -1)
      print("3 gram")
      
      # look up 2 words
      l = lookUp3Gram(w2)
      if(dim(l)[1] > 0)
      {
        # order based on freq
        l = arrange(l,desc(freq))
        return (l[1,'word'])
      }
    }
    
    if(len >= 1)
    {
      w1 = word(c[[1]], -1, -1)
      print("2 gram")
      
      # look up 1 word
      l = lookUp2Gram(w1)
      if(dim(l)[1] > 0)
      {
        # order based on freq
        l = arrange(l,desc(freq))
        return (l[1,'word'])
      }
    }
    
    print("Not found.")
    return ("the")
  }
  
  output$text1 <- renderText({ 
    
    if(loaded == TRUE)
    {
      if(input$textEntry == '' || input$textEntry == ' ')
      {
        ptext = ""
      }
      else
      {
        ptext = lookUp(input$textEntry)
      }
      
      paste("", ptext)
    }
    
  })
  
  
})

