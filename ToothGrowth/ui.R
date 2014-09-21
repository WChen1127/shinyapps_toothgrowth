library(shiny)
  
shinyUI(fluidPage(
  titlePanel("Tooth Growth in Guinea Pigs"),
  
  sidebarLayout(
  sidebarPanel(
    h3("Story"),
    helpText("Like other rodents, Guinea pigs have teeth that growth continuously 
             while gnawing on their surface. As such, Guniea pigs can keep their 
             teeth at a relatively constant length. It is well established that 
             Vitamin C has play a key role in the tooth growth and maintenance."),
    helpText("This app is used to show the effect of two different Vitamin C delivery
             methods on the steady-state length of teeth of Guinea pigs."),
    "---------",
    h3("Play"),
    helpText("Now it is time to play with the supplement type and the dose level you like!"),
    radioButtons("radio", label = h5("Delivery Method"),
                 choices = list("Orange Juice(OJ)" = "OJ", "Ascorbic Acid(VC)" = "VC"),
                 selected = "OJ"),
    sliderInput("slider", label = h5("Dose Level"), min = 0.5, max = 2.0, step = 0.1,
                value = 1),
    br(),
    submitButton("GO")
    ),
  
  mainPanel(
    h3("Results Comparison"),
    
    fluidRow(
      column(3, tags$p("Delivery Method:"), 
             verbatimTextOutput("input_radio_text")),
      column(3, tags$p("Dose Level:"), 
             verbatimTextOutput("input_slider_text")),
      column(3, tags$p("Expected Length:"), 
             verbatimTextOutput("exp_len"))
    ),
    
    fluidRow(
      column(6, plotOutput("plot1", height = "400px", width = "400px")),
      column(6, plotOutput("plot2", height = "400px", width = "400px"))
    ),
    br(),
    br(),
    em("* Note that the left plot is always your targeted plot. It means that the
       positions of VC and OJ plots will change once your targeted delivery method
       changes.")
    
    )
  )
  
 
  
))