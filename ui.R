# Developing Dat Procucts- project -part 1
#
# This is the user-interface definition of a Shiny Car WebApp.
#
# uses mtcars database in R to search and sort/select a car according input parameters:
# trip Distance,
# gazoline prize
# expenditure on Gazoline
# displacement, HP,and
# num cylinders, transmission.
#
#

library(shiny)

# Define UI for application that choses a car according prefered parameters
shinyUI(navbarPage("Car WebApp",
                   tabPanel("Table",

                            # Sidebar
                            sidebarLayout(
                                    sidebarPanel(
                                            helpText("Select car and trip parameters: "),
                                            numericInput('dis', 'Trip Distance (in miles):', 100, min = 1, max = 1000),
                                            numericInput('cost', 'Gasoline Price (per gallon):', 1.75, min = 1, max = 4, step=0.01),
                                            numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=1000),
                                            sliderInput('disp', 'Displacement', min=70, max=700, value=c(70,700), step=50),
                                            sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                                            checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(8)),
                                            checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(1))
                                    ),

                                    mainPanel(
                                            dataTableOutput('table')
                                    )
                            )
                   ),
                   tabPanel("About",
                            mainPanel(
                                    includeMarkdown("about.Rmd")
                            )
                   )
        )
)

