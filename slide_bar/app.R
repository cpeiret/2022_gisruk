#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ricv)

# Define UI for application that draws a histogram
ui <- ricv(img1 = "https://github.com/cpeiret/2022_gisruk/raw/main/slide_bar/image1.png", 
           img2 = "https://github.com/cpeiret/2022_gisruk/raw/main/slide_bar/image1.png",
           options = list(addCircle = T, hoverStart = T, fluidMode = T))

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
