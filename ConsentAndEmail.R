# intro_consent_ui.R
create_intro_consent_ui <- function() {
  tabPanel("Introduction",
           # English version
           conditionalPanel(
             condition = "input.language == 'English'",
             div(class = "intro-section",
                 h2("Compressed Work Schedule Self-Assessment Tool"),
                 p("Dear employee,"),
                 p("Welcome to our Compressed Work Schedule Self-Assessment Tool! We're thrilled that you're considering this innovative work arrangement. But before getting started, there are a few things to note."),
                 
                 h3("Why we're here"),
                 p("We're here to help you figure out if a compressed work schedule might be a good fit for you and which risks may emerge. However, this isn't a crystal ball: it can't predict the future, but it can give you some valuable insights based on scientific research in work psychology, labour economics, work sociology, and real-life experiences of employees and employers who have recently tested a compressed work schedule. However, note that we do not know everything about compressed work schedules (yet), so feel free to reflect critically on our recommendations."),
                 
                 h3("Privacy first"),
                 p("Your privacy is a big deal to us. We – researchers linked to Ghent University and this research project – operate under European GDPR legislation and will respect your rights when collecting, storing and processing your data."),
                 p("First, your e-mail address will only be used to provide you with a personalized report in your mailbox. To generate this personalized report, the data collected via this MS Forms will be processed via Ghent University's MS OneDrive for Business. For more information on data protection and the platform, please visit https://learn.microsoft.com/en-us/compliance/regulatory/gdpr. Your personal report will never be shared with your employer, unless you hand it over to them yourself."),
                 p("Second, we will pseudonymize your data for statistical analysis in the context of our research project regarding compressed work schedules and socio-demographic variables, work-life balance and well-being at work. This pseudonymized data will be stored via MS OneDrive for Business until they are deleted; they will not be shared with third parties unless deemed necessary for the successful performance of the scientific tasks entrusted to us. Retention and use of the data will depend on the resulting scientific publications involving at least one of the researchers mentioned below. Results arising from analyses will be incorporated into (i) a personalized report for your use only, (ii) anonymized collective reporting at the company level and (iii) doctoral articles or other academic articles. These articles will never identify an individual participant."),
                 p("Nevertheless, you have a permanent right to withdraw your consent, view data or have it corrected or deleted at any time without any justification or negative consequences. If you wish to exercise one or more of the above rights, you can contact Kristen.duBois@UGent.be. You can also file a complaint with Ghent University via privacy@ugent.be."),
                 
                 h3("Be yourself"),
                 p("There are no right or wrong answers. Be true to yourself, and we'll give you the best guidance based on what we already know about compressed work schedules. This questionnaire takes around 5 to 15 minutes to complete."),
                 
                 p(strong("Ready to start?"), "Let's find out if compressed work schedules are your next big thing!"),
                 
                 p(class = "authors", "Dra. Kristen du Bois, Prof. dr. Stijn Baert, Prof. dr. Eva Derous, Dr. Claudia Rooman, & Dr. Louis Lippens", br(), "UGent @ Work"),
                 
                 div(class = "consent-section",
                     textInput("email", "E-mail"),
                     checkboxInput("consent", "I have read the information above and I wish to participate"),
                     actionButton("back1", "Back", class = "btn btn-primary"),
                     actionButton("next1", "Next", class = "btn btn-primary"),
                     div(class = "text-output", textOutput("warning1"))
                 )
             )
           ),
           
           # French version
           conditionalPanel(
             condition = "input.language == 'Français'",
             div(class = "intro-section",
                 h2("Outil d'auto-évaluation de l'horaire de travail comprimé"),
                 p("Cher(e) employé(e),"),
                 p("Bienvenue dans notre outil d'auto-évaluation de l'horaire de travail comprimé ! Nous sommes ravis que vous envisagiez ce mode de travail innovant. Avant de commencer, il y a quelques points à noter."),
                 
                 h3("Pourquoi nous sommes là"),
                 p("Nous sommes là pour vous aider à déterminer si un horaire de travail comprimé peut vous convenir et quels sont les risques qui peuvent en découler. Toutefois, il ne s'agit pas d'une boule de cristal : nous ne pouvons pas prédire l'avenir, mais nous pouvons vous donner des indications précieuses fondées sur des recherches scientifiques en psychologie, économie et sociologie du travail, ainsi que sur l'expérience réelle d'employés et d'employeurs qui ont récemment testé un horaire de travail comprimé. Notez toutefois que nous ne savons pas (encore) tout sur les horaires de travail comprimés. N'hésitez donc pas à faire preuve d'esprit critique à nos recommendations."),
                 
                 h3("La confidentialité de vos données est primordiale"),
                 p("Nous - chercheurs liés à l'Université de Gand et à ce projet de recherche - opérons dans le cadre de la législation européenne GDPR et respecterons vos droits lors de la collecte, du stockage et du traitement de vos données."),
                 p("Tout d'abord, votre adresse e-mail ne sera utilisée que pour vous envoyer un rapport personnalisé dans votre boîte au mail. Pour générer ce rapport personnalisé, les données collectées via ce MS Forms seront traitées via MS OneDrive for Business de l'Université de Gand. Pour plus d'informations sur la protection des données et la plateforme, veuillez consulter https://learn.microsoft.com/fr-be/compliance/regulatory/gdpr. Votre rapport personnel ne sera jamais partagé avec votre employeur, à moins que vous ne le lui remettiez vous-même."),
                 p("Deuxièmement, nous pseudonymiserons vos données à des fins d'analyse statistique dans le cadre de notre projet de recherche concernant les horaires de travail comprimés et les variables sociodémographiques, l'équilibre entre vie professionnelle et vie privée et le bien-être au travail. Ces données pseudonymisées seront stockées via MS OneDrive for Business jusqu'à ce qu'elles soient supprimées ; elles ne seront pas partagées avec des tiers, sauf si cela est jugé nécessaire pour mener à bien les tâches scientifiques qui nous ont été confiées. La conservation et l'utilisation des données dépendront des publications scientifiques qui en résulteront et qui impliqueront au moins l'un des chercheurs mentionnés ci-dessous. Les résultats des analyses seront incorporés dans (i) un rapport personnalisé réservé à votre usage, (ii) un rapport collectif anonymisé au niveau de l'entreprise et (iii) des articles de doctorat ou d'autres articles académiques. Ces articles n'identifieront jamais un participant individuel."),
                 p("Néanmoins, vous disposez d'un droit permanent de retirer votre consentement, de consulter les données ou de les faire corriger ou supprimer à tout moment, sans justification ni conséquences négatives. Si vous souhaitez exercer un ou plusieurs des droits susmentionnés, vous pouvez contacter Kristen.duBois@UGent.be. Vous pouvez également déposer une plainte auprès de l'Université de Gand via privacy@ugent.be."),
                 
                 h3("Soyez vous-même"),
                 p("Il n'y a pas de bonnes ou de mauvaises réponses. Soyez fidèle à vous-même et nous vous donnerons les meilleurs conseils possibles sur la base de ce que nous savons déjà. Ce questionnaire prend environ 5 à 15 minutes à remplir."),
                 
                 p(strong("Prêt à commencer?"), "Découvrons si les horaires de travail comprimés sont votre prochain atout!"),
                 
                 p(class = "authors", "Dra. Kristen du Bois, Prof. dr. Stijn Baert, Prof. dr. Eva Derous, Dr. Claudia Rooman & Dr. Louis Lippens", br(), "UGent @ Work"),
                 
                 div(class = "consent-section",
                     textInput("email", "E-mail"),
                     checkboxInput("consent", "J'ai lu les informations ci-dessus et je souhaite participer"),
                     actionButton("back1", "Retour", class = "btn btn-primary"),
                     actionButton("next1", "Suivant", class = "btn btn-primary"),
                     div(class = "text-output", textOutput("warning1")),
                 )
             )
           ),
           
           # Dutch version
           conditionalPanel(
             condition = "input.language == 'Nederlands'",
             div(class = "intro-section",
                 h2("Zelfevaluatietool voor Gecomprimeerde Werkroosters"),
                 p("Beste werknemer,"),
                 p("Welkom bij onze zelfevaluatietool voor gecomprimeerde werkroosters! We zijn blij dat je deze innovatieve werkregeling overweegt. Voordat je aan de slag gaat, zijn er een paar dingen die je moet weten."),
                 
                 h3("De bedoeling"),
                 p("We zijn hier om je te helpen erachter te komen of een gecomprimeerd werkschema goed bij je past en welke risico's eraan verbonden kunnen zijn. Deze tool is echter geen kristallen bol: het kan de toekomst niet voorspellen, maar het kan je wel een aantal waardevolle inzichten geven op basis van wetenschappelijk onderzoek in arbeidspsychologie, arbeidseconomie, arbeidssociologie en ervaringen uit het echte leven van werknemers en werkgevers die onlangs een gecomprimeerd werkrooster hebben getest. Houd er echter rekening mee dat we (nog) niet alles weten over gecomprimeerde werkschema's, dus voel je vrij om kritisch na te denken over onze aanbevelingen."),
                 
                 h3("Privacy op de eerste plaats"),
                 p("Jouw privacy is belangrijk voor ons. Wij - onderzoekers verbonden aan de Universiteit Gent en dit onderzoeksproject - werken onder de Europese GDPR-wetgeving en zullen je rechten respecteren bij het verzamelen, opslaan en verwerken van je gegevens."),
                 p("Ten eerste wordt je e-mailadres alleen gebruikt om je via e-mail een gepersonaliseerd rapport te bezorgen. Om dit gepersonaliseerd rapport te genereren, worden de gegevens die via deze MS Forms worden verzameld, verwerkt via MS OneDrive for Business van de Universiteit Gent. Meer informatie over gegevensbescherming en het platform vind je op https://learn.microsoft.com/nl-be/compliance/regulatory/gdpr. Je persoonlijk rapport zal nooit worden gedeeld met je werkgever, tenzij je het zelf aan hen overhandigt."),
                 p("Ten tweede zullen we je gegevens pseudonimiseren voor statistische analyse in het kader van ons onderzoeksproject naar gecomprimeerde werkroosters en socio-demografische variabelen, de balans tussen werk en privé en welzijn op het werk. Deze gepseudonimiseerde gegevens worden opgeslagen via MS OneDrive for Business totdat ze worden verwijderd; ze worden niet gedeeld met derden tenzij dit noodzakelijk wordt geacht voor het succesvol uitvoeren van de wetenschappelijke taken die aan ons zijn toevertrouwd. Bewaring en gebruik van de gegevens is afhankelijk van de daaruit voortvloeiende wetenschappelijke publicaties waarbij ten minste een van de hieronder genoemde onderzoekers betrokken is. Resultaten die voortkomen uit analyses zullen worden opgenomen in (i) een gepersonaliseerd rapport dat alleen voor uw gebruik is, (ii) geanonimiseerde collectieve rapportage op bedrijfsniveau en (iii) promotieartikelen of andere academische artikelen. Deze artikelen zullen nooit een individuele deelnemer identificeren."),
                 p("Desalniettemin heb je te allen tijde het recht om je toestemming in te trekken, gegevens in te zien of te laten corrigeren of verwijderen zonder enige rechtvaardiging of negatieve gevolgen. Als je een of meer van de bovenstaande rechten wilt uitoefenen, kun je contact opnemen met Kristen.duBois@UGent.be. U kunt ook een klacht indienen bij de Universiteit Gent via privacy@ugent.be."),
                 
                 h3("Wees jezelf"),
                 p("Er zijn geen goede of foute antwoorden. Wees trouw aan jezelf en wij geven je de beste begeleiding op basis van wat we al weten over gecomprimeerde werkroosters. Het invullen van deze vragenlijst duurt ongeveer 5 tot 15 minuten."),
                 
                 p(strong("Klaar om te beginnen?"), "Laten we kijken of gecomprimeerde werkroosters iets voor jou zijn!"),
                 
                 p(class = "authors", "Dra. Kristen du Bois, Prof. dr. Stijn Baert, Prof. dr. Eva Derous, Dr. Claudia Rooman, & Dr. Louis Lippens", br(), "UGent @ Work"),
                 
                 div(class = "consent-section",
                     textInput("email", "E-mail"),
                     checkboxInput("consent", "Ik heb de bovenstaande informatie gelezen en ik wil deelnemen"),
                     actionButton("back1", "Terug", class = "btn btn-primary"),
                     actionButton("next1", "Volgende", class = "btn btn-primary"),
                     div(class = "text-output", textOutput("warning1"))
                 )
             )
           )
  )
}

# Add CSS styling
tags$head(
  tags$style(HTML("
    .intro-section {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      line-height: 1.6;
    }
    .intro-section h2 {
      color: #2c3e50;
      margin-bottom: 20px;
    }
    .intro-section h3 {
      color: #34495e;
      margin-top: 30px;
      margin-bottom: 15px;
    }
    .intro-section p {
      margin-bottom: 15px;
      text-align: justify;
    }
    .authors {
      font-style: italic;
      margin-top: 30px;
      margin-bottom: 30px;
    }
    .consent-section {
      margin-top: 30px;
      padding-top: 20px;
      border-top: 1px solid #eee;
    }
    .text-output {
      color: red;
      margin-top: 10px;
    }
  "))
)