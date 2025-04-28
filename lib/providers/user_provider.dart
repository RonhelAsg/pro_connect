import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _nom = '';
  String _prenom = '';
  String _email = '';
  String _password = '';

  String get nom => _nom;
  String get prenom => _prenom;
  String get email => _email;
  String get password => _password;

  void setUserData({
    required String nom,
    required String prenom,
    required String email,
    required String password,
  }) {
    _nom = nom;
    _prenom = prenom;
    _email = email;
    _password = password;
    notifyListeners();
  }
}