library(shiny)
library(ggplot2)

# 3d plot of diamonds data
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Check your baby height, weight and BMI "),
  
  # Sidebar with a slider input for number of samples and XYZ
  sidebarLayout(
    sidebarPanel(
      h2("Set all parametrs:"),
      textInput("DOB","Your baby date of birth", value = (Sys.Date()-365)),
      textInput("wght","Your baby weight in kgs", value = 11),
      textInput("hght","Your baby height in metrs", value= 75),
      selectInput("gender", "Gender", c("Female", "Male"), selected ="Male"),
      sliderInput("range","Choose time range for days", 
                  min=20, max=1850, value=60, step=1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Summary"),
      textOutput("days"),
      textOutput("sum_wght"),
      textOutput("sum_hght"),
      textOutput("BMI"),
      tabsetPanel(type="tabs",
                  tabPanel("Weight graph", br(),plotOutput("weight_plot")),
                  tabPanel("Height graph", br(),plotOutput("height_plot")),
                  tabPanel("BMI graph", br(),plotOutput("BMI_plot")))
    )
  )
))
