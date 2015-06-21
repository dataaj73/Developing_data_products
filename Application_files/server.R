shinyServer(function(input, output) {
    output$text1 <- renderText({paste(input$speed, input$speed_unit)})

    modelFit <- reactive({
        if (input$speed_unit=="kmph") {
            speed <- cars$speed * 1.609344
        }
        else {
            speed <- cars$speed
        }
        
        speed_sq <- speed^2
        
        if (input$dist_unit=="m") {
            dist <- cars$dist * 0.3048
        }
        else {
            dist <- cars$dist
        }
        
        lm(dist ~ speed + speed_sq -1)
    })
    
    output$distance <- renderText({
        speed <- input$speed
        speed_sq <- speed^2
        
        paste(round(predict(modelFit(), 
                newdata=data.frame(speed, speed_sq)), 2), input$dist_unit)
    })
    
    output$plot <- renderPlot({
        min <- input$limits[1]
        max <- input$limits[2]
        
        speed <- min:((max-min)/100):max
        speed_sq <- speed^2
        
        fittedvals <- predict(modelFit(), newdata=data.frame(speed, speed_sq))
        
        plot(speed, fittedvals, type="l", xlab=paste("Speed (", 
                    input$speed_unit,")"), ylab=paste("Distance (", 
                input$dist_unit, ")"))
    })
})
