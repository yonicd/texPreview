shinyUI(
  fluidPage(
    sidebarPanel(
      actionButton('goBtn','add table')
    ),
    mainPanel(
      loryROutput('lors')
      )
    
    )
)