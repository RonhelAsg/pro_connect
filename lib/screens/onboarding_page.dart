import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingSteps = [
      {
        "title": "Complétez vos informations personnelles",
        "description": "Nom, prénom, email...",
      },
      {
        "title": "Ajoutez vos compétences techniques",
        "description": "Langages, frameworks, outils...",
      },
      {
        "title": "Ajoutez vos projets",
        "description": "Présentez vos réalisations.",
      },
      {
        "title": "Choisissez votre thème",
        "description": "Mode clair ou sombre.",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: ListView.builder(
        itemCount: onboardingSteps.length,
        itemBuilder: (context, index) {
          final step = onboardingSteps[index];
          return ListTile(
            title: Text(step['title']!),
            subtitle: Text(step['description']!),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {
            // Quand c'est fini, aller sur le profil
          },
          child: const Text('Terminer l\'Onboarding'),
        ),
      ),
    );
  }
}
