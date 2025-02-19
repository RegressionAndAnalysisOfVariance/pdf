library(shiny)
library(shinyjs)
library(DBI)
library(RSQLite)
library(httr)      # Added this for POST function
library(jsonlite)  # Added this for JSON handling

source("generate_pdf.R")

source("tabs/Section1.R")
source("tabs/Section2.R")
source("tabs/Section3.R")
source("tabs/Section4.R")
source("tabs/Section5.R")
source("tabs/DownloadUI.R")
source("tabs/ThankYou.R")

if (!require(rmarkdown)) install.packages("rmarkdown")
if (!require(tinytex)) install.packages("tinytex")
# Install TinyTeX if not already installed
if (!(tinytex::is_tinytex())) tinytex::install_tinytex()

# Superbase API
SUPABASE_URL <- "https://stqmleomiublnmureibe.supabase.co"
SUPABASE_KEY <- "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN0cW1sZW9taXVibG5tdXJlaWJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzk0MzUzNjMsImV4cCI6MjA1NTAxMTM2M30.Q1edAfXG0H2tl1FCo2P8sEzFdfMHOpZ3DPxBHxYnQgQ"

server <- function(input, output, session) {
  responses_submitted <- reactiveVal(FALSE)
  
# Initialize Supabase headers
  headers <- c(
    "apikey" = SUPABASE_KEY,
    "Authorization" = paste("Bearer", SUPABASE_KEY),
    "Content-Type" = "application/json",
    "Prefer" = "return=minimal"
  )
  
  # Function to insert data into Supabase
  insert_to_supabase <- function(data) {
    endpoint <- paste0(SUPABASE_URL, "/rest/v1/responses")
    
    response <- tryCatch({
      POST(
        url = endpoint,
        add_headers(.headers = headers),
        body = toJSON(data, auto_unbox = TRUE),
        encode = "json"
      )
    }, error = function(e) {
      print(paste("Error:", e$message))
      return(NULL)
    })
    
    return(!is.null(response) && status_code(response) == 201)
  }
  
  # Disable the shiny button
  shinyjs::disable("download_pdf")
  
  # Function to check validity of email
  is_valid_email <- function(email) {
    grepl("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$", email)
  }
  
  
  ## SECTION 1 LANGUAGES DEPENDECY
  output$life_stage_ui_en <- renderUI({
    section1("English")
  })
  
  output$life_stage_ui_fr <- renderUI({
    section1("Français")
  })
  
  output$life_stage_ui_nl <- renderUI({
    section1("Nederlands")
  })
  
  ## SECTION 2 LANGUAGES DEPENDECY

  output$job_characteristics_en <- renderUI({
    section2("English")
  })
  
  output$job_characteristics_fr <- renderUI({
    section2("Français")
  })
  
  output$job_characteristics_nl <- renderUI({
    section2("Nederlands")
  })
  
  
  ## SECTION 3 LANGUAGE DEPENDENCY 
  output$schedule_en <- renderUI({
    section3("English")
  })
  
  output$schedule_fr <- renderUI({
    section3("Français")
  })
  
  output$schedule_nl <- renderUI({
    section3("Nederlands")
  })
  
  ## SECTION 4 LANGUAGES DEPENDENCY
  output$schedule_jobfit_en <- renderUI({
    section4("English")
  })
  
  output$schedule_jobfit_fr <- renderUI({
    section4("Français")
  })
  
  output$schedule_jobfit_nl <- renderUI({
    section4("Nederlands")
  })
  
  ## SECTION 5 LANGUAGES DEPENDENCY
  output$schedule_envfit_en <- renderUI({
    section5("English")
  })
  
  output$schedule_envfit_fr <- renderUI({
    section5("Français")
  })
  
  output$schedule_envfit_nl <- renderUI({
    section5("Nederlands")
  })
  
  ### NEXT LOGIC
  observeEvent(input$next0, {
    if (input$language == "Choose") {
      output$warning0 <- renderText("Please choose a language.")
    } else {
      updateTabsetPanel(session, "tabs", selected = "Consent and Language")
  }
    })
  
  observeEvent(input$next1, {
    if (input$consent == FALSE) {
      if (input$language == "English") {
        output$warning1 <- renderText("Without consent, we cannot proceed.")
      } else if (input$language == "Français") {
        output$warning1 <- renderText("Sans ce consentement, nous ne pouvons pas continuer.")
      } else {
        output$warning1 <- renderText("Zonder uw consent kunnen we niet verder gaan.")
      }
    } else if (is.null(input$email) || input$email == "") {
      if (input$language == "English") {
        output$warning1 <- renderText("Please fill in your email.")
      } else if (input$language == "Français") {
        output$warning1 <- renderText("Veuillez indiquer votre adresse électronique.")
      } else {
        output$warning1 <- renderText("Vul aub uw email in.")
      }
    } else if (!is_valid_email(input$email)){
      if (input$language == "English") {
        output$warning1 <- renderText("Please fill in a valid email.")
      } else if (input$language == "Français") {
        output$warning1 <- renderText("Veuillez indiquer un courriel valide.")
      } else {
        output$warning1 <- renderText("Vul aub een correct email adress in.")
      }
    }  else {
      output$warning1 <- renderText("")  # Clear any previous warnings
      updateTabsetPanel(session, "tabs", selected = "Section 1")
    }
  })
  
  observeEvent(input$next2, {
    
    # INPUT AGE
    if (is.na(input$age)) {
      if (input$language == "English") {
        output$warning2 <- renderText("Please fill in your age.")
      } else if (input$language == "Français") {
        output$warning2 <- renderText("Veuillez indiquer votre âge.")
      } else {
        output$warning2 <- renderText("Vul aub uw leeftijd in.")
      }
      
    # INPUT GENDER
    } else if (length(input$gender) == 0) {
      if (enc2utf8(input$language) == "English") {
        output$warning2 <- renderText("Please fill in your gender.")
      } else if (input$language == "Français") {
        output$warning2 <- renderText("Veuillez indiquer votre gender.")
        
        print(input$language)
      } else {
        output$warning2 <- renderText("Vul aub uw geslacht in.")
      }
    } else if (length(input$relationship) == 0) {
      
      if (enc2utf8(input$language) == "English") {
        output$warning2 <- renderText("Please fill in your relationship status.")
        
      } else if (input$language == "Français") {
        output$warning2 <- renderText("Veuillez indiquer votre statut relationnel.")
        
        print(input$language)
      } else {
        output$warning2 <- renderText("Vul aub uw relatiestatus in.")
      }
    } else {
      output$warning2 <- renderText("")  # Clear any previous warnings
      updateTabsetPanel(session, "tabs", selected = "Section 2")
    }
  })
  
  observeEvent(input$next3, {
    
    # INPUT PROFESSIONAL STATUS
    if (length(input$professional_status) == 0) {
      if (input$language == "English") {
        output$warning3 <- renderText("Please fill in your professional status.")
      } else if (input$language == "Français") {
        output$warning3 <- renderText("Veuillez indiquer votre statut professionnel.")
      } else {
        output$warning3 <- renderText("Vul aub uw professionele status aan.")
      }
      
      # INPUT WORK SYSTEM
    } else if (length(input$work_system) == 0) {
      if (input$language == "English") {
        output$warning3 <- renderText("Please fill in your work system.")
      } else if (input$language == "Français") {
        output$warning3 <- renderText("Veuillez indiquer votre système de travail.")
      } else {
        output$warning3 <- renderText("Vul aub uw werksysteem in.")
      }
      
      # INPUT SENIORITY
    } else if (is.na(input$seniority)) {
      if (input$language == "English") {
        output$warning3 <- renderText("Please fill in your seniority.")
      } else if (input$language == "Français") {
        output$warning3 <- renderText("Veuillez indiquer votre ancienneté.")
      } else {
        output$warning3 <- renderText("Vul aub uw anciënniteit in.")
      }
      
    } else {
      output$warning3 <- renderText("")  # Clear any previous warnings
      updateTabsetPanel(session, "tabs", selected = "Section 3")
    }
  })
  
  observeEvent(input$next4, {
    
    updateTabsetPanel(session, "tabs", selected = "Section 4")
  })
  
  observeEvent(input$next5, {
    
    updateTabsetPanel(session, "tabs", selected = "Section 5")
  })
  
  
  
  ### BACK LOGIC
  
  observeEvent(input$back1, {
    updateTabsetPanel(session, "tabs", selected = "Language")
  })
  
  observeEvent(input$back2, {
    updateTabsetPanel(session, "tabs", selected = "Consent and Language")
  })
  
  observeEvent(input$back3, {
    updateTabsetPanel(session, "tabs", selected = "Section 1")
  })
  
  observeEvent(input$back4, {
    updateTabsetPanel(session, "tabs", selected = "Section 2")
  })
  
  observeEvent(input$back5, {
    updateTabsetPanel(session, "tabs", selected = "Section 3")
  })
  
  observeEvent(input$back6, {
    updateTabsetPanel(session, "tabs", selected = "Section 4")
  })
  
  
  
  
  
  ### SUBMISSION LOGIC
  
  ### In server.R, update the submit handler:
  
  observeEvent(input$submit, {
    # Handle conditional child-related fields
    youngest_child_age <- if(input$children > 0) input$youngest_child_age else NULL
    coparenting <- if(input$children > 0 && !is.null(input$youngest_child_age) && input$youngest_child_age < 18) {
      input$coparenting
    } else {
      NULL
    }
    
    # Prepare data for Supabase
    supabase_data <- list(
      # Basic Info
      email = input$email,
      language = input$language,
      created_at = format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
      
      # Section 1
      age = input$age,
      gender = input$gender,
      relationship = input$relationship,
      children = input$children,
      youngest_child_age = youngest_child_age,
      coparenting = coparenting,
      
      # Section 2
      professional_status = input$professional_status,
      work_system = input$work_system,
      seniority = input$seniority,
      
      # Section 3
      # Recovery matrix inputs
      recovery_forget_work = input$recovery_1,
      recovery_not_think_work = input$recovery_2,
      recovery_distance_mentally = input$recovery_3,
      recovery_break_demands = input$recovery_4,
      recovery_relax_easily = input$recovery_5,
      recovery_do_relaxing = input$recovery_6,
      recovery_time_relax = input$recovery_7,
      recovery_leisure_time = input$recovery_8,
      
      # CWS Life Fit matrix inputs
      cws_life_leisure = input$cws_life_fit_1,
      cws_life_relax = input$cws_life_fit_2,
      cws_life_social = input$cws_life_fit_3,
      cws_life_stress = input$cws_life_fit_4,
      cws_life_balance = input$cws_life_fit_5,
      
      cws_free_time = input$cws_free_time,
      
      # Section 4
      # Psych Conditions 1
      psych1_time_complete = input$psych_conditions1_1,
      psych1_fall_behind = input$psych_conditions1_2,
      psych1_work_fast = input$psych_conditions1_3,
      psych1_personal_problems = input$psych_conditions1_4,
      psych1_energy = input$psych_conditions1_5,
      psych1_enthusiastic = input$psych_conditions1_6,
      psych1_immersed = input$psych_conditions1_7,
      psych1_work_home = input$psych_conditions1_8,
      
      # Psych Conditions 2
      psych2_high_pace = input$psych_conditions2_1,
      psych2_emotional_demands = input$psych_conditions2_2,
      psych2_learn_new = input$psych_conditions2_3,
      psych2_use_skills = input$psych_conditions2_4,
      psych2_energy_private = input$psych_conditions2_5,
      psych2_time_private = input$psych_conditions2_6,
      psych2_work_interfere = input$psych_conditions2_7,
      psych2_change_plans = input$psych_conditions2_8,
      
      job_performance = input$job_performance,
      
      # Psych Conditions 3
      psych3_mental_exhaustion = input$psych_conditions3_1,
      psych3_energy_recovery = input$psych_conditions3_2,
      psych3_physical_exhaustion = input$psych_conditions3_3,
      psych3_enthusiasm_trouble = input$psych_conditions3_4,
      psych3_work_aversion = input$psych_conditions3_5,
      psych3_others_value = input$psych_conditions3_6,
      psych3_focus_trouble = input$psych_conditions3_7,
      psych3_forget_distracted = input$psych_conditions3_8,
      psych3_mistakes_mind = input$psych_conditions3_9,
      psych3_emotion_control = input$psych_conditions3_10,
      psych3_emotional_reactions = input$psych_conditions3_11,
      psych3_overreact = input$psych_conditions3_12,
      
      general_health = input$general_health,
      
      # CWS Job Fit
      cws_job_commute = input$cws_job_fit_1,
      cws_job_satisfaction = input$cws_job_fit_2,
      cws_job_stress = input$cws_job_fit_3,
      cws_job_overtime = input$cws_job_fit_4,
      cws_job_burnout = input$cws_job_fit_5,
      cws_job_absence = input$cws_job_fit_6,
      cws_job_availability = input$cws_job_fit_7,
      cws_job_concentration = input$cws_job_fit_8,
      cws_job_physical = input$cws_job_fit_9,
      cws_job_mental = input$cws_job_fit_10,
      
      # Section 5
      # Psych Work Environment 1
      env1_atmosphere = input$psych_work_env1_1,
      env1_influence = input$psych_work_env1_2,
      env1_look_elsewhere = input$psych_work_env1_3,
      env1_supervisor_support = input$psych_work_env1_4,
      env1_colleague_support = input$psych_work_env1_5,
      env1_personal_appointments = input$psych_work_env1_6,
      
      # Psych Work Environment 2
      env2_talk_work = input$psych_work_env2_1,
      env2_workplace_importance = input$psych_work_env2_2,
      env2_recommend_others = input$psych_work_env2_3,
      env2_proud_organization = input$psych_work_env2_4,
      env2_supervisor_planning = input$psych_work_env2_5,
      env2_supervisor_conflicts = input$psych_work_env2_6,
      
      # Psych Work Environment 3
      env3_management_trust = input$psych_work_env3_1,
      env3_employee_trust = input$psych_work_env3_2,
      env3_conflict_resolution = input$psych_work_env3_3,
      env3_work_distribution = input$psych_work_env3_4,
      
      # CWS Work Environment Fit
      cws_env_flexibility = input$cws_work_env_fit_1,
      cws_env_planning = input$cws_work_env_fit_2,
      cws_env_relations = input$cws_work_env_fit_3,
      cws_env_team = input$cws_work_env_fit_4,
      cws_env_employer = input$cws_work_env_fit_5
    )
    
    # Remove NULL values before sending to Supabase
    supabase_data <- Filter(Negate(is.null), supabase_data)
    
    # Save to Supabase
    success <- insert_to_supabase(supabase_data)
    
    if (success) {
      # Update warning text based on language
      if (input$language == "English") {
        output$warning6 <- renderText("Your responses have been recorded successfully!")
      } else if (input$language == "Français") {
        output$warning6 <- renderText("Vos réponses ont été enregistrées avec succès!")
      } else {
        output$warning6 <- renderText("Uw antwoorden zijn succesvol geregistreerd!")
      }
      responses_submitted(TRUE)
      shinyjs::enable("download_pdf")
    } else {
      # Error message based on language
      if (input$language == "English") {
        output$warning6 <- renderText("There was an error saving your responses. Please try again.")
      } else if (input$language == "Français") {
        output$warning6 <- renderText("Une erreur s'est produite lors de l'enregistrement de vos réponses. Veuillez réessayer.")
      } else {
        output$warning6 <- renderText("Er is een fout opgetreden bij het opslaan van uw antwoorden. Probeer het opnieuw.")
      }
      responses_submitted(FALSE)
    }
    
    updateTabsetPanel(session, "tabs", selected = "Thank You")
  })
  
  
  
  # When download button is pressed
  output$download_pdf <- downloadHandler(
    filename = function() {
      paste0("survey_responses_", format(Sys.Date(), "%Y%m%d"), ".pdf")
    },
    content = function(file) {
      # Collect all responses
      responses <- list(
        # Basic Info
        email = input$email,
        language = input$language,
        age = input$age,
        gender = input$gender,
        relationship = input$relationship,
        children = input$children,
        youngest_child_age = if(!is.null(input$youngest_child_age)) input$youngest_child_age else NA,
        coparenting = if(!is.null(input$coparenting)) input$coparenting else NA,
        
        # Work Info
        professional_status = input$professional_status,
        work_system = input$work_system,
        seniority = input$seniority,
        
        # Recovery
        recovery_1 = input$recovery_1,
        recovery_2 = input$recovery_2,
        recovery_3 = input$recovery_3,
        recovery_4 = input$recovery_4,
        recovery_5 = input$recovery_5,
        recovery_6 = input$recovery_6,
        recovery_7 = input$recovery_7,
        recovery_8 = input$recovery_8
      )
      
      # Generate the PDF
      pdf_file <- generate_pdf(responses)
      
      # Copy the generated PDF to the target file
      file.copy(pdf_file, file, overwrite = TRUE)
    }
  )
}