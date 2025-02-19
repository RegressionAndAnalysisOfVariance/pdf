source("functions/raioMatrixInput.R")

section4 <- function(language) {
  if (language == "English") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Work demands"), 
          p("The following questions are about your work demands. Please indicate to what extent each statement applies to you by selecting the most appropriate response."),
          
          radioMatrixInput("psych_conditions1", c(
            "How often do you not have time to complete all your work tasks?",
            "Do you fall behind in your work?",
            "Do you have to work very fast?",
            "In your work, are you required to deal with other people's personal problems?",
            "At work, I feel full of energy.",
            "I am enthusiastic about my job.",
            "I am immersed in my work.",
            "Do you need to be both at work and at home?"
          ), c("Never/very rarely", "Rarely", "Sometimes", "Often", "Always"),
          .required = TRUE),
          
          h3("Work characteristics"),
          p("The following questions are about your work characteristics. Please indicate to what extent each statement applies to you by selecting the most appropriate response."),
          
          radioMatrixInput("psych_conditions2", c(
            "Do you work at a high pace throughout the day?",
            "Is your work emotionally demanding?",
            "Do you have the possibility to learn new things through your work?",
            "Can you use your skills or expertise in your work?",
            "Do you feel that your work drains so much of your energy that it has a negative effect on your private life?",
            "Do you feel that your work takes up so much time that it has a negative effect on your private life?",
            "The demands of my work interfere with my private and family life.",
            "Due to work-related duties, I have to make changes to my plans for private and family activities."
          ), c("To a very limited extent", "To a limited extent", "Somewhat", "To a large extent", "To a very large extent"),
          .required = TRUE),
          
          h3("Job performance"),
          div(class = "form-group",
              radioButtons("job_performance", "How satisfied are you with your current job performance as a whole?", 
                           choices = c("Very dissatisfied", 
                                       "Dissatisfied", 
                                       "Neutral", "Satisfied", "Very satisfied"), selected = character(0))
          ),
          
          h3("Well-being at work"),
          p("The following questions are about your well-being at work. Please indicate to what extent each statement applies to you by selecting the most appropriate response."),
          
          radioMatrixInput("psych_conditions3", c(
            "At work, I feel mentally exhausted.",
            "After a day at work, I find it hard to recover my energy.",
            "At work, I feel physically exhausted.",
            "I have trouble being enthusiastic about my work.",
            "I feel a strong aversion to my work.",
            "I don't think others value my work.",
            "At work, I have trouble staying focused.",
            "I forget things and get distracted at work.",
            "I make mistakes in my work because my mind is elsewhere.",
            "At work, I feel unable to control my emotions.",
            "I don't recognize myself in my emotional reactions at work.",
            "At work, I tend to overreact without meaning to."
          ), c("Never", "Rarely", "Sometimes", "Often", "Always"),
          .required = TRUE),
          
          h3("General health"),
          
          div(class = "form-group",
              radioButtons("general_health", "How would you describe your general health?", 
                           choices = c("Bad",
                                       "More bad than good",
                                       "Neutral",
                                       "More good than bad",
                                       "Good"), selected = character(0))
          ),
          
          h3("Compressed work schedule (CWS) - job fit"),
          p("The following questions are about your expectations regarding a compressed work schedule in relation to your job. How do you think a compressed work week would affect the following elements?"),
          
          radioMatrixInput("cws_job_fit", c(
            "My general commute time",
            "My work satisfaction",
            "My stress level on workdays",
            "Average number of overtime hours",
            "Overall risk of professional burnout",
            "Overall work absence",
            "General availability of the employer during workdays",
            "Average time to concentrate",
            "General physical ability to work",
            "General ability for mental work"
          ), c("Would decrease...", "Would not affect...", "Would increase..."),
          .required = TRUE),
          
          actionButton("back5", "Back", class = "btn btn-primary"),
          actionButton("next5", "Next", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning5"))
      )
    )
  } else if (language == "Français") {
    fluidPage(
      div(class = "consent-language-section",
          h3("22. Exigences du travail"),
          p("Les questions suivantes concernent vos exigences professionnelles. Veuillez indiquer dans quelle mesure chaque affirmation s'applique à vous en sélectionnant la réponse la plus appropriée."),
          
          radioMatrixInput("psych_conditions1", c(
            "Combien de fois n'avez-vous pas le temps d'accomplir toutes vos tâches professionnelles ?",
            "Avez-vous du retard dans votre travail ?",
            "Vous devez travailler très vite ?",
            "Dans le cadre de votre travail, êtes-vous amené à traiter les problèmes personnels d'autres personnes ?",
            "Au travail, je me sens plein d'énergie.",
            "Je suis enthousiaste dans mon travail.",
            "Je suis immergé dans mon travail.",
            "Vous arrive-t-il de devoir être à la fois au travail et à la maison ?"
          ), c("Jamais/très rarement", "Rarement", "Parfois", "Souvent", "Toujours"),
          .required = TRUE),
          
          h3("Caractéristiques du travail"),
          p("Les questions suivantes concernent les caractéristiques de votre travail. Veuillez indiquer dans quelle mesure chaque affirmation s'applique à vous en sélectionnant la réponse la plus appropriée."),
          
          radioMatrixInput("psych_conditions2", c(
            "Travaillez-vous à un rythme élevé tout au long de la journée ?",
            "Votre travail est-il exigeant sur le plan émotionnel ?",
            "Avez-vous la possibilité d'apprendre de nouvelles choses grâce à votre travail ?",
            "Pouvez-vous utiliser vos compétences ou votre expertise dans votre travail ?",
            "Avez-vous l'impression que votre travail vous draine tellement d'énergie qu'il a un effet négatif sur votre vie privée ?",
            "Avez-vous l'impression que votre travail vous prend tellement de temps qu'il a un effet négatif sur votre vie privée ?",
            "Les exigences de mon travail interfèrent avec ma vie privée et familiale.",
            "En raison de mes obligations professionnelles, je dois modifier mes projets d'activités privées et familiales."
          ), c("Dans une mesure très limitée", "Dans une mesure limitée", "En partie", "Dans une large mesure", "Dans une très large mesure"),
          .required = TRUE),
          
          h3("Performance professionnelle"),
          div(class = "form-group",
              radioButtons("job_performance", "Dans quelle mesure êtes-vous satisfait(e) de votre performance professionnelle actuelle dans son ensemble ?", 
                           choices = c("Très insatisfait(e)", 
                                       "Insatisfait(e)", 
                                       "Neutre", "Satisfait(e)", "Très satisfait(e)"), selected = character(0))
          ),
          
          h3("Bien-être au travail"),
          p("Les questions suivantes concernent votre bien-être au travail. Veuillez indiquer dans quelle mesure chaque affirmation s'applique à vous en sélectionnant la réponse la plus appropriée."),
          
          radioMatrixInput("psych_conditions3", c(
            "Au travail, je me sens mentalement épuisé/-e.",
            "Après une journée au travail, il m'est difficile de retrouver mon énergie.",
            "Au travail, je me sens épuisé/-e physiquement.",
            "J'ai du mal à être enthousiaste à propos de mon travail.",
            "Je ressens une profonde aversion pour mon travail.",
            "Je ne pense pas que les autres accordent de l'importance à mon travail.",
            "Au travail, j'ai du mal à rester attentif/-ve.",
            "J'oublie des choses et je suis distrait/-e au travail.",
            "Je fais des erreurs dans mon travail car mon esprit est ailleurs.",
            "Au travail, je me sens incapable de contrôler mes émotions.",
            "Je ne me reconnais pas dans mes réactions émotionnelles au travail.",
            "Au travail, il m'arrive de réagir avec excès sans en avoir l'intention."
          ), c("Jamais", "Rarement", "Parfois", "Souvent", "Toujours"),
          .required = TRUE),
          
          h3("Santé générale"),
          
          div(class = "form-group",
              radioButtons("general_health", "Comment décririez-vous votre état de santé général ?", 
                           choices = c("Mauvais",
                                       "Plus mauvais que bon",
                                       "Neutre",
                                       "Plus bon que mauvais",
                                       "Bon"), selected = character(0))
          ),
          
          h3("Horaire de travail comprimé - adaptation au travail"),
          p("Les questions suivantes concernent vos attentes concernant un horaire de travail comprimé par rapport à votre travail. Comment pensez-vous qu'une semaine de travail comprimée affecterait les éléments suivants ?"),
          
          radioMatrixInput("cws_job_fit", c(
            "Mon temps de trajet général",
            "Ma satisfaction de travail",
            "Mon niveau de stress aux jours ouvrables",
            "Nombre moyen d'heures supplémen-taires",
            "Risque global d'épuisement professionnel",
            "Absence globale du travail",
            "Disponibilité générale de l'employeur pendant les jours ouvrables",
            "Durée moyenne pour me concentrer",
            "Aptitude physique générale au travail",
            "Aptitude générale au travail mental"
          ), c("Un tel horaire diminuer-ait...", "Un tel horaire n'affecterait pas...", "Un tel horaire augment-erait..."),
          .required = TRUE),
          
          actionButton("back5", "Retour", class = "btn btn-primary"),
          actionButton("next5", "Suivant", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning5"))
      )
    )
  } else {  # Nederlands
    fluidPage(
      div(class = "consent-language-section",
          h3("Werkeisen"),
          p("De volgende vragen gaan over uw werkeisen. Geef aan in welke mate elke stelling op u van toepassing is door steeds het meest passende antwoord te selecteren."),
          
          radioMatrixInput("psych_conditions1", c(
            "Hoe vaak heeft u niet genoeg tijd om al uw werktaken af te maken?",
            "Loopt u achter met uw werk?",
            "Moet u erg snel werken?",
            "Moet u in uw werk de persoonlijke problemen van andere mensen behandelen?",
            "Op het werk voel ik me vol energie.",
            "Ik ben enthousiast over mijn werk.",
            "Ik ga helemaal op in mijn werk.",
            "Moet u tegelijkertijd op het werk en thuis zijn?"
          ), c("Nooit/zeer zelden", "Zelden", "Soms", "Vaak", "Altijd"),
          .required = TRUE),
          
          h3("Werkkenmerken"),
          p("De volgende vragen gaan over uw werkkenmerken. Geef aan in welke mate elke stelling op u van toepassing is door steeds het meest passende antwoord te selecteren."),
          
          radioMatrixInput("psych_conditions2", c(
            "Werkt u de hele dag in een hoog tempo?",
            "Is uw werk emotioneel veeleisend?",
            "Heeft u de mogelijkheid om nieuwe dingen te leren via uw werk?",
            "Kunt u uw vaardigheden of expertise in uw werk gebruiken?",
            "Heeft u het gevoel dat uw werk zoveel energie kost dat het een negatief effect heeft op uw privéleven?",
            "Heeft u het gevoel dat uw werk zoveel tijd in beslag neemt dat het een negatief effect heeft op uw privéleven?",
            "De eisen van mijn werk verstoren mijn privé- en gezinsleven.",
            "Vanwege werkgerelateerde verplichtingen moet ik veranderingen aanbrengen in mijn plannen voor privé- en gezinsactiviteiten."
          ), c("In zeer beperkte mate", "In beperkte mate", "Gedeeltelijk", "In grote mate", "In zeer grote mate"),
          .required = TRUE),
          
          h3("Job performantie"),
          div(class = "form-group",
              radioButtons("job_performance", "Hoe tevreden bent u over uw huidige job performantie als een geheel?", 
                           choices = c("Zeer ontevreden", 
                                       "Ontevreden", 
                                       "Neutraal", "Tevreden", "Zeer tevreden"), selected = character(0))
          ),
          
          h3("Welzijn op het werk"),
          p("De volgende vragen gaan over uw welzijn op het werk. Geef aan in welke mate elke stelling op u van toepassing is door steeds het meest passende antwoord te selecteren."),
          
          radioMatrixInput("psych_conditions3", c(
            "Op het werk voel ik me mentaal uitgeput.",
            "Na een werkdag heb ik moeite om mijn energie terug te krijgen.",
            "Op het werk voel ik me fysiek uitgeput.",
            "Ik heb moeite om enthousiast te zijn over mijn werk.",
            "Ik voel een sterke afkeer van mijn werk.",
            "Ik denk niet dat anderen waarde hechten aan mijn werk.",
            "Op het werk heb ik moeite om gefocust te blijven.",
            "Ik vergeet dingen en raak afgeleid op het werk.",
            "Ik maak fouten in mijn werk omdat mijn gedachten ergens anders zijn.",
            "Op het werk voel ik me niet in staat om mijn emoties te beheersen.",
            "Ik herken mezelf niet in mijn emotionele reacties op het werk.",
            "Op het werk reageer ik soms overdreven zonder dat ik dat wil."
          ), c("Nooit", "Zelden", "Soms", "Vaak", "Altijd"),
          .required = TRUE),
          
          h3("Algemene gezondheid"),
          
          div(class = "form-group",
              radioButtons("general_health", "Hoe zou u uw algemene gezondheid beschrijven?", 
                           choices = c("Slecht",
                                       "Meer slecht dan goed",
                                       "Neutraal",
                                       "Meer goed dan slecht",
                                       "Goed"), selected = character(0))
          ),
          
          h3("Gecomprimeerde werkweek - werkfit"),
          p("De volgende vragen gaan over uw verwachtingen met betrekking tot een gecomprimeerde werkweek in relatie tot uw werk. Hoe denkt u dat een gecomprimeerde werkweek de volgende elementen zou beïnvloeden?"),
          
          radioMatrixInput("cws_job_fit", c(
            "Mijn algemene reistijd",
            "Mijn werktevredenheid", 
            "Mijn stressniveau op werkdagen",
            "Gemiddeld aantal overuren",
            "Algemeen risico op burn-out",
            "Algemeen werkverlet",
            "Algemene beschikbaarheid van de werkgever tijdens werkdagen",
            "Gemiddelde tijd om te concentreren",
            "Algemene fysieke werkcapaciteit",
            "Algemene mentale werkcapaciteit"
          ), c("Zou verminderen...", "Zou niet beïnvloeden...", "Zou vermeerderen..."),
          .required = TRUE),
          
          actionButton("back5", "Terug", class = "btn btn-primary"),
          actionButton("next5", "Volgende", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning5"))
      )
    )
  }
}