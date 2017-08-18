#
# This is the user-interface definition of a Shiny web application
# to predict body fat percentage for males and provides a 
# BMI calculator on the side
#

library(shiny)
library(UsingR)
library(ggplot2)
suppressPackageStartupMessages(library(googleVis))
library(plotly)

data(fat)

# Define server logic
shinyServer(function(input, output) {

    # Derive predictive model for body fat
    fit<-lm(body.fat~abdomen,data=fat)
    
    # Predict body fat with given abdomen circumference
    bfpred <- reactive({ 
        absInput <- input$sliderAbs
        round(
            predict(fit, newdata = data.frame(abdomen = absInput)),1) 
        })
        
    # Plot abdomen circumference vs body fat   
    output$fatplot <- renderPlotly({

        absInput <- input$sliderAbs

        p<-
            ggplot(fat,aes(abdomen,body.fat))+
            geom_point(aes(colour=(weight*0.4536),
                           text=paste("weight(kg):",(weight*0.4536))),
                       size=2)+
            scale_color_gradientn(name="Weight (kg)",
                                  colors=rainbow(7))+
            scale_x_continuous(name="Abdomen Circumference (cm)",
                               breaks=seq(0,200,10))+
            scale_y_continuous(name="Body Fat (%)",
                               breaks=seq(0,50,10))+
            geom_smooth(method=lm)+
            geom_point(aes(absInput,bfpred()),shape=21,size=4,
                       colour="steelblue",fill="black",stroke=1)

        ggplotly(p,tooltip=c("x","y","text")) 
        
        })
    
    # Display predicted body fat %
    output$predBF <- renderText({ bfpred() })
    

    # Compute & display BMI
    bmi_calc<-reactive({
        round((input$wt)/((input$ht)^2),1)
    })
    output$bmi_text<-renderText({bmi_calc()})

    # Display BMI gauge   
    output$bmigauge <- renderGvis({
        
        bmi_dat<-data.frame(lab="BMI",bmi=bmi_calc())
        gvisGauge(bmi_dat, options=list(min=0,max=60,
                                        greenFrom=0,
                                        greenTo=25, 
                                        yellowFrom=25, 
                                        yellowTo=30,
                                        redFrom=30, 
                                        redTo=60,
                                        height=400,width=400))

    })
        
})
