section1 <- function(language) {
  if (language == "English") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Life Stage and Living Situation"),
          
          div(class = "form-group",
              numericInput("age", "Age", min = 15, max = 100, value = NA),
              helpText("Age in years between 15 and 100")
          ),
          div(class = "form-group",
              radioButtons("gender", "What is your gender?", 
                           choices = c("Female", "Male", "Prefer not to say", "Other"), selected = character(0))
          ),
          div(class = "form-group",
              radioButtons("relationship", "What is your relationship status?", 
                           choices = c("Single", 
                                       "In a relationship but not living together with my partner", 
                                       "In a relationship and living together with my partner"), selected = character(0))
          ),
          
          div(class = "form-group",
              numericInput("children", "How many children do you have?", min = 0, value = 0)
          ),
          
          conditionalPanel(
            condition = "input.children > 0",
            
            div(class = "form-group",
                numericInput("youngest_child_age", "Age of youngest child", min = 0, value = NA),
                helpText("Please answer in years.")
            ),
            
            conditionalPanel(
              condition = "input.youngest_child_age < 18",
              
              div(class = "form-group",
                  radioButtons("coparenting", "Are you currently in a coparenting regulation?", 
                               choices = c("Not applicable (e.g. my children are adults)",
                                           "No, I take care of my child(ren) most of the time",
                                           "No, the other parent takes care of my child(ren) most of the time",
                                           "Yes, I take care of the children most of the time (e.g. three weeks a month)",
                                           "Yes, we take care of the children equally (50-50 regulation or similar)",
                                           "Yes, I take care of the children sometimes (e.g. every other weekend)"), selected = character(0))
              )
            )
          ),
          
          actionButton("back2", "Back", class = "btn btn-primary"),
          actionButton("next2", "Next", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning2"))
      )
    )
  } else if (language == "Français") {
    fluidPage(
      div(class = "consent-language-section",
          h3("État de vie et situation familiale"),
          div(class = "form-group",
              numericInput("age", "Quel âge avez-vous ? ", min = 15, max = 100, value = NA),
              helpText("Âge en années entre 15 et 100")
          ),
          div(class = "form-group",
              radioButtons("gender", "Quel est votre sexe ?", 
                           choices = c("Femme", "Homme", "Préfère ne pas dire", "Autre"), 
                           selected = character(0))
          ),
          div(class = "form-group",
              radioButtons("relationship", "Quel est votre statut relationnel?", 
                           choices = c("Célibataire", 
                                       "En couple mais ne vivant pas avec mon partenaire", 
                                       "En couple et vivant avec mon partenaire"), selected = character(0))
          ),
          div(class = "form-group",
              numericInput("children", "Combien d'enfants avez-vous?", min = 0, value = 0)
          ),
          
          conditionalPanel(
            condition = "input.children > 0",
            
            div(class = "form-group",
                numericInput("youngest_child_age", "Quel est l'âge de votre plus jeune enfant ?", min = 0, value = NA),
                helpText("En années")
            ),
            
            conditionalPanel(
              condition = "input.youngest_child_age < 18",
              
              div(class = "form-group",
                  radioButtons("coparenting", "Êtes-vous actuellement dans une réglementation coparentale?", 
                               choices = c("Non applicable (par ex. mes enfants sont adultes)",
                                           "Non, je m'occupe de mon/mes enfant(s) la plupart du temps",
                                           "Non, l'autre parent s'occupe de mon/mes enfant(s) la plupart du temps",
                                           "Oui, je m'occupe des enfants la plupart du temps (par ex. trois semaines par mois)",
                                           "Oui, nous nous occupons des enfants également (réglementation 50-50 ou similaire)",
                                           "Oui, je m'occupe des enfants parfois (par ex. un week-end sur deux)")), selected = character(0)
              )
              
            )
          ),
          
          div(class = "text-output", textOutput("warning2")),
          actionButton("back2", "Retour", class = "btn btn-primary"),
          actionButton("next2", "Suivant", class = "btn btn-primary")
      )
    )
  } else {  # Nederlands
    fluidPage(
      div(class = "consent-language-section",
          h3("Levensfase en woonsituatie"),
          div(class = "form-group",
              numericInput("age", "Wat is uw leeftijd?", min = 15, max = 100, value = NA)
          ),
          div(class = "form-group",
              radioButtons("gender", "Wat is uw geslacht?", 
                           choices = c("Vrouw", "Man", "Wil ik niet zeggen", "Anders"), selected = character(0))
          ),
          div(class = "form-group",
              radioButtons("relationship", "Wat is uw relatiestatus?", 
                           choices = c("Single", 
                                       "In een relatie maar niet samenwonend", 
                                       "In een relatie en samenwonend"), selected = character(0))
          ),
          div(class = "form-group",
              numericInput("children", "Hoeveel kinderen hebt u?", min = 0, value = 0)
          ),
          
          conditionalPanel(
            condition = "input.children > 0",
            div(class = "form-group",
                numericInput("youngest_child_age", "Wat is de leeftijd van het jongste kind?", min = 0, value = NA),
                helpText("In jaren")
            ),
            
            conditionalPanel(
              condition = "input.youngest_child_age < 18",
              
              div(class = "form-group",
                  radioButtons("coparenting", "Bent u momenteel in een co-ouderregeling?", 
                               choices = c("Niet van toepassing (bijv. mijn kinderen zijn volwassenen)",
                                           "Nee, ik zorg het grootste deel van de tijd voor mijn kind(eren)",
                                           "Nee, de andere ouder zorgt het grootste deel van de tijd voor mijn kind(eren)",
                                           "Ja, ik zorg het grootste deel van de tijd voor de kinderen (bijv. drie weken per maand)",
                                           "Ja, we zorgen gelijkelijk voor de kinderen (50-50 regeling of vergelijkbaar)",
                                           "Ja, ik zorg soms voor de kinderen (bijv. elk ander weekend)"), selected = character(0))
              )
            )
          ),
  
          actionButton("back2", "Terug", class = "btn btn-primary"),
          actionButton("next2", "Volgende", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning2"))
      )
    )
  }
}