shinyServer(function(input, output, session) {
 
  observeEvent(input$goBtn,{
      texPreview(obj = xtable(head(iris,floor(runif(1,min = 5,max = 40)))),
                 stem = paste0('eq',input$goBtn),
                 fileDir = outDir,
                 imgFormat = 'png',
                 returnType = 'shiny')  
    
    output$lors<-renderLoryR({
      
      lapply(tail(list.files(outDir,pattern = 'png',full.names = T),1),
             function(x) base64enc::dataURI(file = x, mime="image/png"))%>%
        loryR( images_per_page = 2, 
               options = list(rewind=TRUE))
      
     })  
  })
  
  
  

    
  
  
})