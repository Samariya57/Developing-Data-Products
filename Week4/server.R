library(shiny)
library(plotly)
library(ggplot2)
library(caret)
set.seed(3433)

download.file ("http://www.who.int/entity/childgrowth/standards/wfa_boys_z_exp.txt",
               "wfa_boys_z_exp.txt")    
wght_b <- read.table("wfa_boys_z_exp.txt", header=TRUE, sep="\t")
download.file ("http://www.who.int/entity/childgrowth/standards/wfa_girls_z_exp.txt",
               "wfa_girls_z_exp.txt")
wght_g <- read.table("wfa_girls_z_exp.txt", header=TRUE, sep="\t")
download.file ("http://www.who.int/entity/childgrowth/standards/lhfa_boys_z_exp.txt",
               "lhfa_boys_z_exp.txt")
hght_b <- read.table("lhfa_boys_z_exp.txt", header=TRUE, sep="\t")
download.file ("http://www.who.int/entity/childgrowth/standards/lhfa_girls_z_exp.txt",
               "lhfa_girls_z_exp.txt")
hght_g <- read.table("lhfa_girls_z_exp.txt", header=TRUE, sep="\t")
download.file ("http://www.who.int/entity/childgrowth/standards/bfa_boys_z_exp.txt",
               "bfa_boys_z_exp.txt")
bmi_b <- read.table("bfa_boys_z_exp.txt", header=TRUE, sep="\t")
download.file ("http://www.who.int/entity/childgrowth/standards/bfa_girls_z_exp.txt",
               "bfa_girls_z_exp.txt")
bmi_g <- read.table("bfa_girls_z_exp.txt", header=TRUE, sep="\t")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  .#output$sum_wght <- reactiveText({
  #  days = Sys.Date()-as.Date(input$DOB)
   # if (input$wght>wght_b[wght_b[,"Days"]=days, "SD4"]){
  #    
  #  }
  #})
  
  output$weight_plot <- renderPlot({

    days = Sys.Date()-as.Date(input$DOB)
    par(bg = "lightyellow")
    if (input$gender=="Female"){
    plot(wght_g$Day, wght_g$SD4, col="deeppink3", type = "l", 
         xlim = c(max(as.numeric(Sys.Date()-as.Date(input$DOB)-input$range),0),
                  min(as.numeric(Sys.Date()-as.Date(input$DOB)+input$range),1856)),
         ylim = c(-0.001,40),
         xlab = "Days", ylab="Weight in kgs")
    lines(wght_g$Day, wght_g$SD4neg, col="deeppink3")
    }
    if (input$gender=="Male"){
      plot(wght_b$Day, wght_b$SD4, col="blue", type = "l", 
           xlim = c(max(as.numeric(Sys.Date()-as.Date(input$DOB)-input$range),0),
                    min(as.numeric(Sys.Date()-as.Date(input$DOB)+input$range),1856)),
           ylim = c(-0.001,40),
           xlab = "Days", ylab="Weight in kgs")
      lines(wght_b$Day, wght_b$SD4neg, col="blue")
    }
    points( days , as.numeric(input$wght), col="black", pch=16)
    
  })
  
  output$height_plot <- renderPlot({
    
    days = Sys.Date()-as.Date(input$DOB)
    par(bg = "lightyellow")
    if (input$gender=="Female"){
      plot(hght_g$Day, hght_g$SD4, col="deeppink3", type = "l", 
           xlim = c(max(as.numeric(Sys.Date()-as.Date(input$DOB)-input$range),0),
                    min(as.numeric(Sys.Date()-as.Date(input$DOB)+input$range),1856)),
           ylim = c(40,100),
           xlab = "Days", ylab="Height in cms")
      lines(hght_g$Day, hght_g$SD4neg, col="deeppink3")
    }
    if (input$gender=="Male"){
      plot(hght_b$Day, hght_b$SD4, col="blue", type = "l", 
           xlim = c(max(as.numeric(Sys.Date()-as.Date(input$DOB)-input$range),0),
                    min(as.numeric(Sys.Date()-as.Date(input$DOB)+input$range),1856)),
           ylim = c(40,100),
           xlab = "Days", ylab="Height in cms")
      lines(hght_b$Day, hght_b$SD4neg, col="blue")
    }
    points( days , as.numeric(input$hght), col="black", pch=16)
  })
  
})
