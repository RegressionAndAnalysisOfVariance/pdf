downloadUI <- function(language) {
  if (language == "English") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Thank You for Participating!"),
          p("Thank you for participating in our survey. Your responses have been recorded successfully. We appreciate your time and effort in helping us with this research study."),
          p("You can now download your personalized PDF report below."),
          
          fluidRow(
            column(12, downloadButton("download_pdf", "Download PDF Report", class = "btn btn-primary btn-lg", style = "width: 100%;"))
          )
      )
    )
  } else if (language == "Français") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Merci de votre participation !"),
          p("Merci d'avoir participé à notre enquête. Vos réponses ont été enregistrées avec succès. Nous vous remercions pour votre temps et votre contribution à cette étude de recherche."),
          p("Vous pouvez maintenant télécharger votre rapport PDF personnalisé ci-dessous."),
          
          fluidRow(
            column(12, downloadButton("download_pdf", "Télécharger le rapport PDF", class = "btn btn-primary btn-lg", style = "width: 100%;"))
          )
      )
    )
  } else {  # Nederlands
    fluidPage(
      div(class = "consent-language-section",
          h3("Bedankt voor uw deelname!"),
          p("Bedankt voor uw deelname aan onze enquête. Uw antwoorden zijn succesvol opgeslagen. Wij waarderen uw tijd en inzet om ons te helpen met dit onderzoeksproject."),
          p("U kunt nu hieronder uw gepersonaliseerde PDF-rapport downloaden."),
          
          fluidRow(
            column(12, downloadButton("download_pdf", "Download PDF-rapport", class = "btn btn-primary", style = "width: 100%;"))
          )
      )
    )
  }
}
