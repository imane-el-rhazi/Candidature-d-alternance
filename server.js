const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const session = require('express-session');

const app = express();
const port = 3000;

// Middleware pour gérer les sessions et les fichiers statiques
app.use(session({
  secret: 'votre-secret',
  resave: false,
  saveUninitialized: true,
}));

// Middleware pour traiter les données du formulaire
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Servir les fichiers statiques (HTML, CSS, JS) à partir du répertoire courant
app.use(express.static(path.join(__dirname)));

// Utilisateur fictif pour la simulation de la connexion
const users = {
  'user@example.com': 'password123', // email: mot de passe
};

// Route pour la page de login
app.get('/login', (req, res) => {
  res.sendFile(path.join(__dirname, 'login.html'));
});

// Route pour la page d'accueil après login
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  if (users[email] && users[email] === password) {
    // Si les informations de connexion sont valides
    res.redirect('/index');
  } else {
    res.send('Identifiants incorrects. <a href="/login">Réessayez</a>');
  }
});

// Route d'accueil (après connexion réussie)
app.get('/index', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Route pour la page data.html (vérifier si elle est bien dans le répertoire de base)
app.get('/data.html', (req, res) => {
  res.sendFile(path.join(__dirname, 'data.html'));
});

// Déconnexion
app.get('/logout', (req, res) => {
  res.redirect('/login');
});

// Démarrer le serveur
app.listen(port, () => {
  console.log(`Serveur démarré sur http://localhost:${port}`);
});

// Route pour la déconnexion
app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
      if (err) {
        return res.redirect('/'); // En cas d'erreur, retourner à la page d'accueil
      }
      res.redirect('/login'); // Rediriger vers la page de connexion après la déconnexion
    });
  });
  