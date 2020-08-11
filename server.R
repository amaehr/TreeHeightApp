library(shiny)
library(tidyr)
library(datasets)



shinyServer(
    function(input, output){
        colnames(trees) <- c('Diameter', 'Height', 'Volume')
        
        model1 <- lm(Height~Diameter, data=trees)

        
        model1pred <- reactive({
            ginput <- input$sliderGirth
            predict(model1, newdata= data.frame(Diameter=ginput))
        })
        
        output$plot1 <- renderPlot({
            ginput <- input$sliderGirth

            plot(trees$Diameter,trees$Height, xlab='Diameter',
                 ylab='Height', bty='n', pch=16, xlim = c(5,25))
        
            if(input$showModel1){
                abline(model1, col="blue",lwd=2)
            }
            legend(25,250, c('Model Prediction'),pch=16, col= 'blue', bty='n',cex = 1.2)
            points(ginput, model1pred(),col='blue', pch=16, cex=2)
            
        
            })
        output$pred1 <- renderText({
            model1pred()
        
        })
        
        
    }
)