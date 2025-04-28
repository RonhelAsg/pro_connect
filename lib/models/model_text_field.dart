import 'package:flutter/material.dart';

class ModelTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const ModelTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Champ requis' : null,
      ),
    );
  }
}