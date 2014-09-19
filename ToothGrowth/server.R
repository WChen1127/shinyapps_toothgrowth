library(shiny)
library(ggplot2)
ToothGrowth <- read.csv("data/ToothGrowth.csv")


shinyServer(function(input, output) {
  
  dataInput1 <- reactive({
    ToothGrowth[ToothGrowth$supp == input$radio, ]
  })
  
  dataInput2 <- reactive({
    ToothGrowth[ToothGrowth$supp != input$radio, ]
  })
  
  output$input_radio_text <- renderText({
    input$radio
  })
  
  output$input_slider_text <- renderText({
    input$slider
  })
  
  output$exp_len <- renderText({
    get_exp_len(dataInput1(), input$slider)
  })
  
  output$plot1 <- renderPlot({
    draw_plot(dataInput1(), input$radio, input$slider)   
  })
  
  output$plot2 <- renderPlot({
    draw_plot(dataInput2(), input$radio, input$slider) 
  })
  
}
)

# function to draw the plots
draw_plot <- function(dataset, inp_supp, inp_dose){
  g <-  qplot(dose, len, data=dataset, geom=c("point", "smooth"), method="lm", formula = y~x, 
              color= dose, main=paste("Length by Dose of", dataset$supp[1]), facets = . ~ supp,
              xlab="Dose Level", ylab="Length")
  if (dataset$supp[1] == inp_supp)
    g +geom_vline(xintercept = inp_dose, colour="red")
  else
    g  
}

# function to get the expected length
get_exp_len <- function(dataset, inp_dose){
  coefs <- coef(lm(len~dose, data=dataset))
  round(coefs[1] + coefs[2] * inp_dose, 2)
}

