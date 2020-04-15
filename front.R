library(shiny)
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
server <- function(input,output) {}
shinyApp(ui = ui , server = server)
