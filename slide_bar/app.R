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
ui <- ricv(img1 = "https://github.com/cpeiret/2022_gisruk/raw/main/notebooks/image1.png", 
           img2 = "https://github.com/cpeiret/2022_gisruk/raw/main/notebooks/image2.png",
           options = list(addCircle = T, hoverStart = T, fluidMode = T))

# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
