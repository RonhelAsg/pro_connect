import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Portfolio"),
        actions: [
          TextButton(onPressed: () {}, child: const Text("Intention", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () {}, child: const Text("Contact", style: TextStyle(color: Colors.white))),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Slogan ou phrase d'accroche",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Image.asset("assets/images/illustration.png", height: 200),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                    },
                    child: const Text("Créer mon portfolio"),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("En savoir plus"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text("Pourquoi créer un portfolio avec nous ?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Une plateforme simple pour vous valoriser, attirer des recruteurs et montrer vos talents avec style.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text("Ils nous font confiance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Placeholder(fallbackHeight: 60, fallbackWidth: 60),
                Placeholder(fallbackHeight: 60, fallbackWidth: 60),
                Placeholder(fallbackHeight: 60, fallbackWidth: 60),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Support", style: TextStyle(fontSize: 16)),
            const Text("Conditions & politique de confidentialité"),
          ],
        ),
      ),
    );
  }
}