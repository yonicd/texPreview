shinyUI(
  fluidPage(
    sidebarPanel(
      actionButton('goBtn','add table')
    ),
    mainPanel(uiOutput('cars'))
    
    )
)