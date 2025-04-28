import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  String nom = '';
  String prenom = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 50),
              const Text('Inscription', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nom'),
                onSaved: (value) => nom = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Prénom'),
                onSaved: (value) => prenom = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                onSaved: (value) => password = value ?? '',
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  Provider.of<UserProvider>(context, listen: false).setUserData(
                    nom: nom,
                    prenom: prenom,
                    email: email,
                    password: password,
                  );
                  Navigator.pushNamed(context, '/onboarding');
                },
                child: const Text('S\'inscrire'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
