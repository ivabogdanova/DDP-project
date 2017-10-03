# DDP- Course project - part 1
#
# This is the server.R for the Car WebApp.
#
#

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
        output$table <- renderDataTable({
                disp_seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
                hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
                data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg,
                                  GasolineExpenditure = input$dis/mpg*input$cost,
                                   Displacement = disp, Horsepower = hp, Cylinders = cyl,
                                  Transmission = am)
                data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl,
                               Displacement %in% disp_seq, Horsepower %in% hp_seq, Transmission %in% input$am)
                data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
                data <- arrange(data, GasolineExpenditure)
                data
        },
        options = list(lengthMenu = c(1, 5, 10, 15), pageLength = 10))
})
