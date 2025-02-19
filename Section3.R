source("functions/raioMatrixInput.R")

section3 <- function(language) {
  if (language == "English") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Recovery after work hours"),
          p("The following statements concern how you experience your free time. Please indicate to what extent each statement applies to you by selecting the most appropriate response."),
          
          radioMatrixInput("recovery", c(
            "After work hours, I forget about work",
            "After work hours, I don't think about work at all",
            "After work hours, I distance myself mentally from work",
            "After work hours, I take a break from work demands",
            "After work hours, I can easily sit down and relax",
            "After work hours, I do relaxing things",
            "After work hours, I use my time to relax",
            "After work hours, I take time for leisure"
          ), c("Strongly disagree", "Disagree", "Neutral", "Agree", "Strongly agree"),
          .required = TRUE),
          
          h3("Compressed work schedule (CWS) - life fit"),
          p("The following questions are about your expectations regarding a compressed work schedule in relation to your personal life. How do you think a compressed work week would affect the following elements?"),
          
          radioMatrixInput("cws_life_fit", c(
            "Time for leisure (e.g., hobby, sports, free time)",
            "Opportunities to relax and detach from work",
            "Time for social relations outside work (e.g., family and friends)",
            "Stress level during days off",
            "General balance between work and private life"
          ), c("Would decrease...", "Would not affect...", "Would increase..."),
          .required = TRUE),
          
          h3("Compressed work schedule (CWS) - free time"),
          p("Within a compressed work schedule, how do you envision spending most of your additional day off?"),
          
          radioButtons("cws_free_time", "", choices = c(
            "Household tasks (cleaning, shopping and/or practical appointments)",
            "Childcare (taking care of children and/or grandchildren)",
            "Leisure (hobby, sports, shopping and/or cultural activities)",
            "Social relations (spending time with family and/or friends)",
            "Relaxation (reading, watching TV, playing, listening to music and/or walking)",
            "Taking care of a family member (child, parent or other family member)",
            "Additional employment (flexi-job or independent secondary profession)",
            "Construction work (renovation)",
            "Education (courses, degree)",
            "No specific plans yet"
          ), selected = character(0)),
          
          actionButton("back4", "Back", class = "btn btn-primary"),
          actionButton("next4", "Next", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning4"))
      )
    )
  } else if (language == "Français") {
    fluidPage(
      div(class = "consent-language-section",
          h3("Récupération après les heures de travail"),
          p("Les déclarations suivantes concernent la façon dont vous vivez votre temps libre. Indiquez à quel point chaque affirmation s'applique à vous en cochant toujours la réponse la plus appropriée."),
          
          radioMatrixInput("recovery", c(
            "Après mes heures de travail, j'oublie mon travail",
            "Après mes heures de travail, je ne pense pas du tout au travail",
            "Après mes heures de travail, je m'éloigne mentalement du travail",
            "Après mes heures de travail, je fais une pause dans mes exigences professionnelles",
            "Après mes heures de travail, je peux facilement m'asseoir et me détendre",
            "Après mes heures de travail, je fais des choses relaxantes",
            "Après mes heures de travail, j'utilise mon temps pour me détendre",
            "Après mes heures de travail, je prends du temps pour les loisirs"
          ), c("Pas du tout d'accord", "Pas d'accord", "Neutre", "D'accord", "Tout à fait d'accord"),
          .required = TRUE),
          
          h3("Horaire de travail comprimé - adaptation à la vie"),
          p("Les questions suivantes portent sur vos attentes concernant un horaire de travail comprimé par rapport à votre vie personnelle. Comment pensez-vous qu'une semaine de travail comprimée affecterait les éléments suivants ?"),
          
          radioMatrixInput("cws_life_fit", c(
            "Temps pour les loisirs (par ex. hobby, sport, temps libre)",
            "Possibilités de se détendre et de se détacher du travail",
            "Du temps pour mes relations sociales en dehors du travail (par exemple, famille et amis)",
            "Niveau de stress pendant les jours de congé",
            "Équilibre général entre vie professionnelle et vie privée"
          ), c("Un tel horaire diminuerait...", "Un tel horaire n'affecterait pas...", "Un tel horaire augmenterait..."),
          .required = TRUE),
          
          h3("Horaire de travail comprimé - temps libre"),
          p("Dans le cadre d'un horaire de travail comprimé, comment envisagez-vous de passer la plus grande partie de votre jour de congé supplémentaire ?"),
          
          radioButtons("cws_free_time", "", choices = c(
            "Travaux ménagers (ménage, courses et/ou rendez-vous pratiques)",
            "Garde d'enfants (s'occuper des enfants et/ou petits-enfants)",
            "Loisirs (hobby, sport, shopping et/ou activités culturelles)",
            "Relations sociales (passer du temps avec la famille et/ou les amis)",
            "Détente (lire, regarder la télévision, jouer, écouter de la musique et/ou se promener)",
            "S'occuper d'un membre de la famille (enfant, parent ou autre membre de la famille)",
            "Exercer un emploi supplémentaire (flexi-job ou profession secondaire indépendante)",
            "Travaux de construction (rénovation)",
            "Education (cours, diplôme)",
            "Pas encore de projets spécifiques"
          ), selected = character(0)),
          
          actionButton("back4", "Retour", class = "btn btn-primary"),
          actionButton("next4", "Suivant", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning4"))
      )
    )
  } else {  # Nederlands
    fluidPage(
      div(class = "consent-language-section",
          h3("Herstel na werkuren"),
          p("De volgende stellingen gaan over hoe u uw vrije tijd ervaart. Geef aan in welke mate elke stelling op u van toepassing is door steeds het meest passende antwoord aan te vinken."),
          
          radioMatrixInput("recovery", c(
            "Na mijn werkuren vergeet ik het werk",
            "Na mijn werkuren denk ik helemaal niet aan het werk",
            "Na mijn werkuren neem ik mentaal afstand van het werk",
            "Na mijn werkuren neem ik een pauze van werkeisen",
            "Na mijn werkuren kan ik gemakkelijk zitten en ontspannen",
            "Na mijn werkuren doe ik ontspannende dingen",
            "Na mijn werkuren gebruik ik mijn tijd om te ontspannen",
            "Na mijn werkuren neem ik tijd voor vrije tijd"
          ), c("Helemaal mee oneens", "Oneens", "Neutraal", "Eens", "Helemaal mee eens"),
          .required = TRUE),
          
          h3("Gecomprimeerde werkweek - levensaanpassing"),
          p("De volgende vragen gaan over uw verwachtingen met betrekking tot een gecomprimeerde werkweek in relatie tot uw persoonlijke leven. Hoe denkt u dat een gecomprimeerde werkweek de volgende elementen zou beïnvloeden?"),
          
          radioMatrixInput("cws_life_fit", c(
            "Tijd voor vrije tijd (bijv. hobby, sport, vrije tijd)",
            "Mogelijkheden om te ontspannen en los te komen van het werk",
            "Tijd voor sociale relaties buiten het werk (bijv. familie en vrienden)",
            "Stressniveau tijdens vrije dagen",
            "Algemene balans tussen werk en privéleven"
          ), c("Zou verminderen...", "Zou niet beïnvloeden...", "Zou vermeerderen..."),
          .required = TRUE),
          
          h3("Gecomprimeerde werkweek - vrije tijd"),
          
          radioButtons("cws_free_time", "Hoe bent u van plan het grootste deel van uw extra vrije dag te besteden binnen een gecomprimeerde werkweek?", choices = c(
            "Huishoudelijke taken (schoonmaken, boodschappen en/of praktische afspraken)",
            "Kinderopvang (zorgen voor kinderen en/of kleinkinderen)",
            "Vrije tijd (hobby, sport, winkelen en/of culturele activiteiten)",
            "Sociale relaties (tijd doorbrengen met familie en/of vrienden)",
            "Ontspanning (lezen, tv kijken, spelen, muziek luisteren en/of wandelen)",
            "Zorgen voor een familielid (kind, ouder of ander familielid)",
            "Extra werk (flexi-job of zelfstandig bijberoep)",
            "Bouwwerkzaamheden (renovatie)",
            "Opleiding (cursussen, diploma)",
            "Nog geen specifieke plannen"
          ), selected = character(0)),
          
          actionButton("back4", "Terug", class = "btn btn-primary"),
          actionButton("next4", "Volgende", class = "btn btn-primary"),
          div(class = "text-output", textOutput("warning4"))
      )
    )
  }
}