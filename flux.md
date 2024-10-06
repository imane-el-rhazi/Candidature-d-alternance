 #Noté bien :
Ce fichier Mermaid présente trois cas d'utilisation : connexion pour l'authentification des utilisateurs Rh ,page d'accueil pour l'affichage des informations principales, et filtrage pour rechercher des candidatures selon des critères spécifiques. Ces cas incluent les acteurs alternants et RH, et sont représentés sous forme de diagrammes.

#sequenceDiagram Acteurs :
    actor Alternant
    actor Entreprise
    Alternant->>Entreprise: postuler à une alternance
    Entreprise->>Alternant: Confirmer ou refuser la demande

#Entreprise
#sequenceDiagram Login
  Actor Customer as Entreprise
  participant LoginPage as Log in page
  participant P1 as Log in details storage
  participant P2 as Security Department

  Customer ->>+ LoginPage: Input: Username
  Customer ->>+ LoginPage: Input: Password
  LoginPage ->> P1: Username and password
  P1 ->> P1: Authenticate
  alt Successful Authentication
    LoginPage ->> LoginPage: Redirect to welcome page
    LoginPage ->> Customer: Log in successful, stand by
  else Failed Authentication
  P1 ->> LoginPage: If rejected
  Customer ->> Customer: I forgot my password...
  LoginPage ->> Customer: Password Hint
  Customer ->> Customer: I still can't remember...
end

LoginPage ->> Customer: Do you wish to reset your password
opt Password Reset Flow
  Customer ->> LoginPage: Yes
  LoginPage ->> P2: New password request
  P2 ->> P2: Validate email address
  P2 ->> Customer: Email sent with a reset link
  Customer ->> P2: Input new password
  P2 ->> P2: Process new password
  P2 ->> P1: Store new password
  P2 ->> P2: Redirect user to log in page
end
# sequenceDiagram HomePage :
  actor RH as Entreprise
  participant HomePage as Homepage
  participant P3 as Candidate Management System
  participant P4 as Base Donnée

  alt Visualisation des profils 
    RH ->> HomePage: Log in successful, consulter les profils
    HomePage ->> P3: checker les nouveaux profils
    P3 ->> P4 : chercher les nouveaux profils 
    P4 ->> P3 : retourner les nouveaux profils trouver 
    P3 ->> RH: List des nouveaux candidats
  end

#sequenceDiagram FiltrageRepond
  actor RH as Entreprise
  participant Profils as Profils intéressés
  participant P3 as Profils Management System

  alt Visualisation des profils
    RH ->> Profils: Consulter et choisir les profils
    Profils ->> P3: Ajouter les profils sélectionnés
  end

  alt Filtrage des profils intéressants
    RH ->> Profils: Appliquer des filtres (compétences, etc.)
    Profils ->> P3: Envoyer les critères de filtrage
    P3 ->> RH: Afficher la liste des candidats correspondant aux critères
  end

  alt Réponse aux candidats
    RH ->> P3: Accepter ou refuser les profils
    P3 ->> Candidats: Envoyer la réponse (accepté ou refusé)
  end
#Alternant
#sequenceDiagram SoumetDossier
  actor Alternant as Alternant
  participant SubmissionPage as Submission Page
  participant P1 as Candidate Management System
  participant P2 as Base Donnée
  participant P3 as Entreprise

  alt Soumettre le profil
    Alternant ->> SubmissionPage: Remplir et soumettre le formulaire
    SubmissionPage ->> P1: Envoyer les informations du profil
    P1 ->> P2: Stocker le profil dans la base de données
    P1 ->> Alternant: Confirmation de soumission réussie
  end

  alt Consulter les réponses de l'entreprise
    Alternant ->> P1: Consulter les réponses de l'entreprise
    P1 ->> P2: Vérifier l'état du profil (accepté ou refusé)
    P2 ->> P1: Retourner la réponse de l'entreprise
    P1 ->> Alternant: Afficher les réponses de l'entreprise (accepté ou refusé)
  end




