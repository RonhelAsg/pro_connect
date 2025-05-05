import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Pour savoir si l'utilisateur est en mode "connexion" ou "inscription"
  bool isLogin = true;

  // Champs de texte pour les informations utilisateur
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();

  // Quand l'utilisateur clique sur "S'inscrire" ou "Se connecter"
  void Submit() {
    if (isLogin) {
      print("Connexion avec : ${emailController.text}");
    } else {
      print("Inscription de : ${prenomController.text} ${nomController.text}");
    }
  }

  // Simuler la connexion avec un fournisseur (Google, GitHub, etc.)
  void loginWith(String provider) {
    print("Connexion avec $provider");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Authentification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              isLogin ? "Se connecter" : "Créer un compte",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Champs Nom et Prénom seulement pour l'inscription
            if (!isLogin) ...[
              TextField(
                controller: prenomController,
                decoration: const InputDecoration(labelText: "Prénom"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nomController,
                decoration: const InputDecoration(labelText: "Nom"),
              ),
              const SizedBox(height: 10),
            ],

            // Email et mot de passe
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Mot de passe"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: Submit,
              child: Text(isLogin ? "Se connecter" : "S'inscrire"),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(isLogin
                  ? "Pas encore de compte ? S'inscrire"
                  : "Déjà inscrit ? Se connecter"),
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            const Text("Ou continuer avec :", textAlign: TextAlign.center),

            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => loginWith("Google"),
              icon: const Icon(Icons.g_mobiledata),
              label: const Text("Google"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => loginWith("GitHub"),
              icon: const Icon(Icons.code),
              label: const Text("GitHub"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => loginWith("Microsoft"),
              icon: const Icon(Icons.window),
              label: const Text("Microsoft"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
