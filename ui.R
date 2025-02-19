library(shiny)
library(shinyjs)
source("generate_pdf.R")
source("tabs/ConsentAndEmail.R")
source("tabs/Section1.R")
source("tabs/Section2.R")
source("tabs/ThankYou.R")


ui <- fluidPage(
  
  useShinyjs(),
  
  tags$head(
    
    # Style sheet
    tags$style(HTML("
      .consent-language-section {
        margin: 20px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 10px;
        background-color: #f9f9f9;
      }
      .consent-language-section h3 {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #007bff;
      }
      .consent-language-section label {
        font-weight: bold;
      }
      .consent-language-section .btn-primary {
        margin-top: 20px;
        width: 100px;
      }
      .consent-language-section .form-group {
        margin-bottom: 15px;
      }
      .consent-language-section .checkbox {
        margin-top: 10px;
      }
      .consent-language-section .text-output {
        margin-top: 20px;
        font-weight: bold;
        color: #dc3545;
      }

      .form-group {
        margin: 20px 0;
      }
      label {
        font-weight: bold;
      }
      .btn-primary {
        margin-top: 20px;
        width: 100px;
      }
      .text-output {
        margin-top: 20px;
        font-weight: bold;
        color: #dc3545;
      }
      
    ")),
    
    #Deletes the menu-navigation 
    tags$head(
      tags$style(HTML("
      .nav-tabs { display: none !important; }
    ")))
  ),
  
  titlePanel("Compressed Schedule Reflection Tool"),
  
  # Consent and Language Selection Section
  tabsetPanel(
    id = "tabs",
    
    # Panel ONLY to ask for the respondent's preferred language 
    tabPanel("Language", 
             div(class = "consent-language-section",
                 h3("Language - Langue - Taal"),
                 selectInput("language", "Language", choices = c("Choose", "English", "Français", "Nederlands")),
                 actionButton("next0", "Next", class = "btn btn-primary"),
                 div(class = "text-output", textOutput("warning0"))
             )
    ),
    
    tabPanel("Consent and Language",
             div(class = "consent-language-section",
             create_intro_consent_ui()
             )
    ),
    
    #  Section 1: Life Stage and Living Situation
    tabPanel("Section 1",
             # If the language is English 
             conditionalPanel(
               condition = "input.language == 'English'",
               uiOutput("life_stage_ui_en")
             ),
             conditionalPanel(
               condition = "input.language == 'Français'",
               uiOutput("life_stage_ui_fr")
             ),
             conditionalPanel(
               condition = "input.language == 'Nederlands'",
               uiOutput("life_stage_ui_nl")
             )
    ),
    
    tabPanel("Section 2",
             # If the language is English 
             conditionalPanel(
               condition = "input.language == 'English'",
               uiOutput("job_characteristics_en")
             ),
             conditionalPanel(
               condition = "input.language == 'Français'",
               uiOutput("job_characteristics_fr")
             ),
             conditionalPanel(
               condition = "input.language == 'Nederlands'",
               uiOutput("job_characteristics_nl")
             )
  ),
  
  tabPanel("Section 3",
           
           # If the language is English 
           conditionalPanel(
             condition = "input.language == 'English'",
             uiOutput("schedule_en")
           ),
           conditionalPanel(
             condition = "input.language == 'Français'",
             uiOutput("schedule_fr")
           ),
           conditionalPanel(
             condition = "input.language == 'Nederlands'",
             uiOutput("schedule_nl")
           )
  ),
  
tabPanel("Section 4",
           
           conditionalPanel(
             condition = "input.language == 'English'",
             uiOutput("schedule_jobfit_en")
           ),
           conditionalPanel(
             condition = "input.language == 'Français'",
             uiOutput("schedule_jobfit_fr")
           ),
           conditionalPanel(
             condition = "input.language == 'Nederlands'",
             uiOutput("schedule_jobfit_nl")
           )
  ),

tabPanel("Section 5",
         
         conditionalPanel(
           condition = "input.language == 'English'",
           uiOutput("schedule_envfit_en")
         ),
         conditionalPanel(
           condition = "input.language == 'Français'",
           uiOutput("schedule_envfit_fr")
         ),
         conditionalPanel(
           condition = "input.language == 'Nederlands'",
           uiOutput("schedule_envfit_nl")
         )
         
    ),

tabPanel("Thank You",
         conditionalPanel(
           condition = "input.language == 'English'",
           create_thank_you_ui("English")
         ),
         conditionalPanel(
           condition = "input.language == 'Français'",
           create_thank_you_ui("Français")
         ),
         conditionalPanel(
           condition = "input.language == 'Nederlands'",
           create_thank_you_ui("Nederlands")
         )
),
    
  ),

)
