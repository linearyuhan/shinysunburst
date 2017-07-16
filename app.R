rm(list=ls())

withend=read.csv('actions with end.csv', header=T, stringsAsFactors = FALSE)
moredata=read.csv('500counts.csv', header = T, stringsAsFactors = FALSE)
str(withend)
str(moredata)
library(sunburstR)
#install.packages('sunburstR')
sunburst(withend)
sunburst(moredata)
#library(shiny)


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

#delpoy to shinyIO
#install.packages('rsconnect')
#library(rsconnect)
rsconnect::setAccountInfo(name='linyuhan', token='DFF647357646A269BF76F6F52195B4D1', secret='EUm63pk+VxYAMiTCjPL6nOlHeXuSGs8kfQyY3p1r')
deployApp()
