shinyUI(fluidPage(
    titlePanel("Calculating stopping distance of a car"),
    
    sidebarLayout(
        sidebarPanel(h2("Inputs"),
            helpText("Give the speed of the car and the distance which is 
                     required for the car to stop is returned"),
            br(),
            radioButtons("dist_unit", "Choose the units of distance",
                    choices = list("Feet (ft)"="ft", "Meter (m)"="m"), 
                    selected = "ft"),
            br(),
            selectInput("speed_unit", "Choose the units of velocity", 
                    choices = list("Miles per hour (mph)"="mph", 
                        "Kilometers per hour (kmph)"="kmph"), 
                    selected = "mph"),
            br(),
            numericInput("speed", "Give the speed", value=50, min=0),
            br(),
            sliderInput("limits", "Set the range of velocity", min=0, max=200,
                        value=c(50, 100)),
            br(),
            submitButton("Apply changes")
        ),
        
        mainPanel(h2("Outputs"),
            h4("The initial speed"),
            br(),
            h3(textOutput("text1")),
            br(),
            h4("results into a stopping distance"),
            br(),
            h3(textOutput("distance")),
            br(),
            br(),
            br(),
            h4("The next figure plots the stopping distance vs. the initial
               speed with minimum and maximum speeds given in the slider"),
            br(),
            plotOutput("plot")
        )
    )
))
