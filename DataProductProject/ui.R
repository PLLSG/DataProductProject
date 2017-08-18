#
# This is the user-interface definition of a Shiny web application
# to predict body fat percentage for males and provides a 
# BMI calculator on the side
#

library(shiny)
library(shinythemes)
suppressPackageStartupMessages(library(googleVis))
library(plotly)

# Define UI for application that draws a histogram
shinyUI(
 fluidPage(
    theme = shinythemes::shinytheme("cerulean"),
    
    # Application title
    title = "Body Fat Measurements",

    h1("Body Fat Measurements for Males"),

  fluidRow(
    column(5,
            
        wellPanel(
            titlePanel("Body Fat Predictor"),
            sliderInput("sliderAbs", 
                        "What is the abdomen circumference (cm)?", 
                        70, 150, value = 90),
            h5(paste0(
                "Use this Body Fat Predictor to estimate the body ",
                "fat percentage of a typical male with a specified ",
                "abdomen size (measured as circumference in cm). ")),
            h5(paste0(
                "This prediction model has been built from physical ",
                "measurements taken from 252 males."
                )),
            h5("Select the abdomen size using the slider above."),
            br(),
            h3("Predicted Body Fat:",
               textOutput("predBF",inline=TRUE))
            )
        ),
    column(7,
           h4("Body Fat vs Abdomen Size with Weight differentiation"),
           plotlyOutput("fatplot")
        )
    ),
        
  hr(),
  
  fluidRow(
    column(5,
                   
        # Section for BMI calculator
        wellPanel(
            titlePanel("BMI Calculator"),
            sliderInput("wt",
                        "Weight (in kg):",
                        min=0,max=200,value=75,step=1),
            sliderInput("ht",
                        "Height (in m):",
                        min=1,max=2.5,value=1.8,step=0.01),
            h5(paste0(
                "This BMI Calculator computes the Body Mass Index for",
                " given weight (in kilograms) and height (in metres)."
            )),
            h5(paste0(
                "Provide the weight & height dimensions using the ",
                "2 sliders above.")),
            h3("Computed BMI value :",
                textOutput("bmi_text",inline=TRUE))
            )
        ),
    column(7,
           uiOutput("bmigauge",inline=TRUE)
        )    
    )
    
))