import 'package:firstapp/contactList.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Welcome to login page",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: controllerLogin,
              decoration: const InputDecoration(
                label: Text("LOGIN"),
                hintText: "entrez votre nom",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controllerPassword,
              decoration: const InputDecoration(
                label: Text("PASSWORD"),
                hintText: "entrez votre mot de passe",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String login = controllerLogin.text;
                String password = controllerPassword.text;

                bool ok = (login == "3ii" && password == "TIPO") ||
                    (login == "admin" && password == "Gestion@123.2025") ||
                    (login == "gerant" && password == "gerant.3ii@2025");

                if (ok) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ContactList(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login ou mot de passe incorrect"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text("Connexion"),
            ),
          ],
        ),
      ),
    );
  }
}
