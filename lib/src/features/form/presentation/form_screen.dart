import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Konstruktor
  FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // Form is valid, proceed with the action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form is valid!')),
                  );
                } else {
                  // Form is not valid, show a message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please correct the errors in the form')),
                  );
                }
              },
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'Email darf nicht leer sein';
    }
    if (input.length <= 5) {
      return 'Email muss mehr als 5 Zeichen haben';
    }
    if (!input.contains('@')) {
      return 'Email muss ein "@" Zeichen enthalten';
    }
    if (!(input.endsWith('.com') || input.endsWith('.de'))) {
      return 'Email muss mit ".com" oder ".de" enden';
    }
    return null;
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return 'Passwort darf nicht leer sein';
    }
    if (input.length < 6 || input.length > 12) {
      return 'Passwort muss zwischen 6 und 12 Zeichen lang sein';
    }
    return null;
  }
}
