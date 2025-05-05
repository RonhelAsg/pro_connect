import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingSteps = [
    {
      "title": "Bienvenue 👋",
      "description": "Commençons par compléter vos informations personnelles.",
      "image": "assets/images/personal_info.png",
    },
    {
      "title": "Vos compétences 💼",
      "description": "Ajoutez les langages, outils et frameworks que vous maîtrisez.",
      "image": "assets/images/skills.png",
    },
    {
      "title": "Vos projets 🚀",
      "description": "Mettez en valeur vos réalisations et expériences.",
      "image": "assets/images/projects.png",
    },
    {
      "title": "Apparence 🎨",
      "description": "Choisissez entre un thème clair ou sombre pour votre app.",
      "image": "assets/images/theme.png",
    },
  ];

  void nextPage() {
    if (currentPage < onboardingSteps.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Navigator.pushReplacementNamed(context, '/profile'); // à adapter
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingSteps.length,
              onPageChanged: (index) => setState(() => currentPage = index),
              itemBuilder: (context, index) {
                final step = onboardingSteps[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (step['image'] != null)
                        Image.asset(step['image']!, height: 250),
                      const SizedBox(height: 40),
                      Text(
                        step['title']!,
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        step['description']!,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: onboardingSteps.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: nextPage,
              child: Text(currentPage == onboardingSteps.length - 1 ? 'Terminer' : 'Suivant'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
