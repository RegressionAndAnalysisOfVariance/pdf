# Create a new file: thank_you.R

create_thank_you_ui <- function(language) {
  if (language == "English") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Thank You!"),
          p("Thank you for participating in our Compressed Work Schedule Self-Assessment Tool!"),
          p("In the report you are about to download, you will find:"),
          tags$ul(
            tags$li("A detailed analysis of how a compressed work schedule might fit with your life stage and living situation"),
            tags$li("An evaluation of how it aligns with your job characteristics"),
            tags$li("An assessment of work-life balance considerations"),
            tags$li("Specific recommendations based on your responses"),
            tags$li("Potential risk factors to consider")
          ),
          p("Please take your time to read through the report. You can use it to have meaningful discussions with HR, your manager, or someone you trust about exploring a compressed work schedule."),
          p("The report is not meant to be a definitive answer, but rather a tool to help you make an informed decision."),
          
          div(style = "margin-top: 30px;",
              downloadButton("download_pdf", "Download Your Personal Report", 
                             class = "btn btn-primary btn-lg", 
                             style = "width: 100%;")
          )
      )
    )
  } else if (language == "Français") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Merci !"),
          p("Merci d'avoir participé à notre outil d'auto-évaluation des horaires de travail comprimés !"),
          p("Dans le rapport que vous allez télécharger, vous trouverez :"),
          tags$ul(
            tags$li("Une analyse détaillée de la façon dont un horaire de travail comprimé pourrait s'adapter à votre stade de vie et à votre situation de vie"),
            tags$li("Une évaluation de son adéquation avec les caractéristiques de votre emploi"),
            tags$li("Une évaluation des considérations relatives à l'équilibre travail-vie personnelle"),
            tags$li("Des recommandations spécifiques basées sur vos réponses"),
            tags$li("Les facteurs de risque potentiels à prendre en compte")
          ),
          p("Prenez le temps de lire le rapport. Vous pouvez l'utiliser pour avoir des discussions constructives avec les RH, votre responsable ou une personne de confiance concernant l'exploration d'un horaire de travail comprimé."),
          p("Le rapport n'est pas destiné à être une réponse définitive, mais plutôt un outil pour vous aider à prendre une décision éclairée."),
          
          div(style = "margin-top: 30px;",
              downloadButton("download_pdf", "Télécharger Votre Rapport Personnel", 
                             class = "btn btn-primary btn-lg", 
                             style = "width: 100%;")
          )
      )
    )
  } else {  # Nederlands
    fluidPage(
      div(class = "consent-language-section",
          h3("Bedankt!"),
          p("Bedankt voor je deelname aan onze zelfreflectietool voor gecomprimeerde werkroosters!"),
          p("In het rapport dat je gaat downloaden, vind je:"),
          tags$ul(
            tags$li("Een gedetailleerde analyse van hoe een gecomprimeerd werkrooster zou kunnen passen bij je levensfase en leefsituatie"),
            tags$li("Een evaluatie van hoe het aansluit bij je jobkenmerken"),
            tags$li("Een beoordeling van werk-privé balans overwegingen"),
            tags$li("Specifieke aanbevelingen op basis van je antwoorden"),
            tags$li("Potentiële risicofactoren om rekening mee te houden")
          ),
          p("Neem de tijd om het rapport door te lezen. Je kunt het gebruiken om zinvolle gesprekken te voeren met HR, je leidinggevende of iemand die je vertrouwt over het verkennen van een gecomprimeerd werkrooster."),
          p("Het rapport is niet bedoeld als definitief antwoord, maar als hulpmiddel om een weloverwogen beslissing te nemen."),
          
          div(style = "margin-top: 30px;",
              downloadButton("download_pdf", "Download Je Persoonlijk Rapport", 
                             class = "btn btn-primary btn-lg", 
                             style = "width: 100%;")
          )
      )
    )
  }
}