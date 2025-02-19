source("functions/raioMatrixInput.R")

section5 <- function(language) {
  if (language == "English") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Psychosocial conditions I"),
          
          radioMatrixInput("psych_work_env1", c(
            "Is there a good atmosphere between you and your colleagues?",
            "Do you have a major influence on decisions concerning your work?",
            "How often do you consider looking for work elsewhere?",
            "How often do you get help and support from your supervisor if needed?",
            "How often do you get help and support from your colleagues if needed?",
            "I plan my personal appointments (e.g., visiting the doctor, dentist, physiotherapist) during my official working hours."
          ), c("Never", "Rarely", "Sometimes", "Often", "Always"),
          .required = TRUE),
          
          h3("Psychosocial conditions II"),
          
          radioMatrixInput("psych_work_env2", c(
            "Do you like talking about your work with others?",
            "Do you feel that your workplace is of great importance to you?",
            "Would you recommend others to apply for a job at your organization?",
            "Are you proud to be part of this organization?",
            "To what extent would you say your immediate supervisor is good at work planning?",
            "To what extent would you say your immediate supervisor is good at solving conflicts?"
          ), c("To a very limited extent", "To a limited extent", "Somewhat", "To a large extent", "To a very large extent"),
          .required = TRUE),
          
          h3("Psychosocial conditions III"),
          
          radioMatrixInput("psych_work_env3", c(
            "Does management trust employees to do their work well?",
            "Can employees trust information that comes from management?",
            "Are conflicts resolved in a fair way?",
            "Is work distributed fairly?"
          ), c("To a very limited extent", "To a limited extent", "Somewhat", "To a large extent", "To a very large extent"),
          .required = TRUE),
          
          h3("Compressed work schedule (CWS) - work environment fit"),
          
          radioMatrixInput("cws_work_env_fit", c(
            "The flexibility I receive from my employer",
            "Constraint on general planning",
            "Relations with colleagues",
            "Constraint on the team",
            "Relations with the employer in general"
          ), c("Would decrease...", "Would not affect...", "Would increase..."),
          .required = TRUE),
          
          actionButton("back6", "Back", class = "btn btn-primary"),
          actionButton("submit", "Submit", class = "btn btn-primary"),
          
          h3("End"),
          p("You will first need to submit, before downloading the PDF-raport"),
          
          fluidRow(
            column(6, actionButton("submit", "Submit", class = "btn btn-primary btn-lg")),
            column(6, downloadButton("download_pdf", "Download PDF", class = "btn btn-primary btn-lg", style = "width: 100%;"))
          ),
          div(class = "text-output", textOutput("warning6")),
          
          div(class = "response-message",
              textOutput("warning6"),
              style = "margin-top: 15px; font-weight: bold;"
          ),
      )
    )
  } else if (language == "Français") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Conditions psychosociales I"),
          
          radioMatrixInput("psych_work_env1", c(
            "Y a-t-il une bonne ambiance entre vous et vos collègues ?",
            "Avez-vous une grande influence sur les décisions concernant votre travail ?",
            "À quelle fréquence envisagez-vous de chercher du travail ailleurs ?",
            "À quelle fréquence obtenez-vous l'aide et le soutien de votre supérieur hiérarchique, si nécessaire ?",
            "À quelle fréquence obtenez-vous l'aide et le soutien de vos collègues, si nécessaire ?",
            "Je planifie mes rendez-vous personnels (par exemple, visite chez le médecin, le dentiste, le kinésithérapeute) pendant mon temps de travail officiel."
          ), c("Jamais", "Rarement", "Parfois", "Souvent", "Toujours"),
          .required = TRUE),
          
          h3("Conditions psychosociales II"),
          
          radioMatrixInput("psych_work_env2", c(
            "Vous aimez parler de votre travail avec autres ?",
            "Avez-vous le sentiment que votre lieu de travail revêt une grande importance pour vous ?",
            "Recommanderiez-vous à d'autres personnes de postuler à un emploi sur votre organisation ?",
            "Êtes-vous fier/fière de faire partie de cette organisation ?",
            "Dans quelle mesure diriez-vous que votre supérieur hiérarchique direct est doué pour la planification du travail ?",
            "Dans quelle mesure diriez-vous que votre supérieur hiérarchique direct sait résoudre les conflits ?"
          ), c("Dans une mesure très limitée", "Dans une mesure limitée", "En partie", "Dans une large mesure", "Dans une très large mesure"),
          .required = TRUE),
          
          h3("Conditions psychosociales III"),
          
          radioMatrixInput("psych_work_env3", c(
            "La direction fait-elle confiance aux employés pour qu'ils fassent bien leur travail ?",
            "Les employés peuvent-ils faire confiance aux informations émanant de la direction ?",
            "Les conflits sont-ils résolus de manière équitable ?",
            "Le travail est-il réparti équitable-ment ?"
          ), c("Dans une mesure très limitée", "Dans une mesure limitée", "En partie", "Dans une large mesure", "Dans une très large mesure"),
          .required = TRUE),
          
          h3("Horaire de travail comprimé - adaptation à l'environnement de travail"),
          
          radioMatrixInput("cws_work_env_fit", c(
            "La flexibilité dont je bénéficie de la part de mon employeur",
            "Contrainte sur la planification générale",
            "Relations avec les collègues",
            "Contrainte sur l'équipe",
            "Relations avec l'employeur en général"
          ), c("Un tel horaire diminuerait...", "Un tel horaire n'affecterait pas...", "Un tel horaire augmenterait..."),
          .required = TRUE),
          
          actionButton("back6", "Retour", class = "btn btn-primary"),
          actionButton("submit", "Soumettre", class = "btn btn-primary"),
          
          div(class = "response-message",
              textOutput("warning6"),
              style = "margin-top: 15px; font-weight: bold;"
          ),
      )
    )
  } else {  # Nederlands
    fluidPage(
      div(class = "consent-language-section",
          h3("Psychosociale omstandigheden I"),
          
          radioMatrixInput("psych_work_env1", c(
            "Is er een goede sfeer tussen u en uw collega's?",
            "Heeft u grote invloed op beslissingen over uw werk?",
            "Hoe vaak overweegt u om elders werk te zoeken?",
            "Hoe vaak krijgt u hulp en steun van uw leidinggevende indien nodig?",
            "Hoe vaak krijgt u hulp en steun van uw collega's indien nodig?",
            "Ik plan mijn persoonlijke afspraken (bijvoorbeeld bezoek aan arts, tandarts, fysiotherapeut) tijdens mijn officiële werktijd."
          ), c("Nooit", "Zelden", "Soms", "Vaak", "Altijd"),
          .required = TRUE),
          
          h3("Psychosociale omstandigheden II"),
          
          radioMatrixInput("psych_work_env2", c(
            "Praat u graag over uw werk met anderen?",
            "Heeft u het gevoel dat uw werkplek van groot belang voor u is?",
            "Zou u anderen aanraden om te solliciteren bij uw organisatie?",
            "Bent u er trots op om deel uit te maken van deze organisatie?",
            "In welke mate zou u zeggen dat uw directe leidinggevende goed is in werkplanning?",
            "In welke mate zou u zeggen dat uw directe leidinggevende goed is in het oplossen van conflicten?"
          ), c("In zeer beperkte mate", "In beperkte mate", "Gedeeltelijk", "In grote mate", "In zeer grote mate"),
          .required = TRUE),
          
          h3("Psychosociale omstandigheden III"),
          
          radioMatrixInput("psych_work_env3", c(
            "Vertrouwt het management erop dat medewerkers hun werk goed doen?",
            "Kunnen medewerkers vertrouwen op informatie die van het management komt?",
            "Worden conflicten op een eerlijke manier opgelost?",
            "Wordt het werk eerlijk verdeeld?"
          ), c("In zeer beperkte mate", "In beperkte mate", "Gedeeltelijk", "In grote mate", "In zeer grote mate"),
          .required = TRUE),
          
          h3("Gecomprimeerde werkweek - werkomgeving fit"),
          
          radioMatrixInput("cws_work_env_fit", c(
            "De flexibiliteit die ik krijg van mijn werkgever",
            "Beperking op algemene planning",
            "Relaties met collega's",
            "Beperking op het team",
            "Relaties met de werkgever in het algemeen"
          ), c("Zou verminderen...", "Zou niet beïnvloeden...", "Zou vermeerderen..."),
          .required = TRUE),
          
          actionButton("back6", "Terug", class = "btn btn-primary"),
          actionButton("submit", "Indienen", class = "btn btn-primary"),
          
          div(class = "response-message",
              textOutput("warning6"),
              style = "margin-top: 15px; font-weight: bold;"
          ),
      )
    )
  }
}