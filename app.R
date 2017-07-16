rm(list=ls())
library(sunburstR)

withend=read.csv('actions with end.csv', header=T, stringsAsFactors = FALSE)
sunburst(withend)

server=shinyServer(function(input,output){
  output$sunburst=renderSunburst({
   sunburst(withend)
  })
})


ui=shinyUI(fluidPage(
  titlePanel(title=h3('Student Usage Flow', align='center')),
    
    mainPanel(
      sunburstOutput('sunburst') #the same name as output in server
    )
  ))

shinyApp(ui=ui, server=server)
