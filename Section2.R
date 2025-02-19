section2 <- function(language) {
  if (language == "English") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Job characteristics"),
          
          div(class = "form-group",
              radioButtons("professional_status", "Professional status", 
                           choices = c("Labourer (blue collar)", 
                                       "Clerk (white collar)", 
                                       "Other"), selected = character(0))
          ),
          
          div(class = "form-group",
              radioButtons("work_system", "Work system", 
                           choices = c("Day work: predictable schedule",
                                       "Day work: flexible schedule",
                                       "Shift work: predictable schedule",
                                       "Shift work: flexible schedule"), selected = character(0))
          ),
          
          div(class = "form-group",
              numericInput("seniority", "Seniority", min = 0, value = 0)
          ),
          
          actionButton("back3", "Back", class = "btn btn-primary"),
          actionButton("next3", "Next", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning3"))
      )
    )
  } else if (language == "Français") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Caractéristiques du poste"),
          
          div(class = "form-group",
              radioButtons("professional_status", "Statut professionnel", 
                           choices = c("Ouvrier (col bleu)", 
                                       "Employé (col blanc)", 
                                       "Autre"), selected = character(0))
          ),
          
          div(class = "form-group",
              radioButtons("work_system", "Système de travail", 
                           choices = c("Travail de jour : horaires prévisibles",
                                       "Travail de jour : horaires flexibles",
                                       "Travail posté : horaires prévisibles",
                                       "Travail posté : horaires flexibles"), selected = character(0))
          ),
          
          div(class = "form-group",
              numericInput("seniority", "Ancienneté", min = 0, value = 0)
          ),
          
          actionButton("back3", "Retour", class = "btn btn-primary"),
          actionButton("next3", "Suivant", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning3"))
      )
    )
  } else {  # Nederlands
    fluidPage(
      div(class = "consent-language-section",
          h3("Baan kenmerken"),
          
          div(class = "form-group",
              radioButtons("professional_status", "Professionele status", 
                           choices = c("Arbeider (blauwboord)", 
                                       "Kantoorwerknemer (witboord)", 
                                       "Anders"), selected = character(0))
          ),
          
          div(class = "form-group",
              radioButtons("work_system", "Werksysteem", 
                           choices = c("Dagwerk: voorspelbaar schema",
                                       "Dagwerk: flexibel schema",
                                       "Ploegendienst: voorspelbaar schema",
                                       "Ploegendienst: flexibel schema"), selected = character(0))
          ),
          
          div(class = "form-group",
              numericInput("seniority", "Anciënniteit", min = 0, value = 0)
          ),
          
          actionButton("back3", "Terug", class = "btn btn-primary"),
          actionButton("next3", "Volgende", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning3"))
      )
    )
  }
}