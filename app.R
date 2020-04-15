#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    inputPanel(
        radioButtons("radio", h3("Language"),
                     choices = list("Anglais bigramme" = 1, "Anglais Trigramme" = 2,
                                    "Francais trigramme" = 3),selected = 1),
        fileInput("file", h3("Corpus")),
        textInput("caption", "Texte à crypté", "Taper votre texte ici"),
        textInput("caption2", "Texte à decrypté", "Taper votre texte ici"),
        actionButton("go", "Crypté!"),
        actionButton("go2", "Dérypté!")
    ),
    
    mainPanel(
        textOutput("texte_crypte")
    )
)

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
