shinyServer(function(input, output, session) {
 
  observeEvent(input$goBtn,{
      texPreview(obj = xtable(head(iris,floor(runif(1,min = 5,max = 40)))),
                 stem = paste0('eq',input$goBtn),
                 fileDir = outDir,
                 imgFormat = 'svg',
                 returnType = 'shiny')  
  })
  
  rUI<- eventReactive(input$goBtn,{
    baseUI=bs_carousel(id = "tabPrev", use_indicators = TRUE)
    file.nm=list.files(outDir,pattern = 'svg')
    
    if(length(file.nm)>0){
      for(nm in file.nm){
      baseUI%<>%
        bs_append(
          content = bs_carousel_image(src = nm)
        )  
      }
      }
    baseUI
  })
  
  output$cars<-renderUI({rUI()})
})