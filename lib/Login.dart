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

  // --- Informations des utilisateurs ---
  final Map<String, Map<String, String>> usersData = {
    "3ii": {
      "name": "Classe 3ii",
      "image": "assets/3ii.JPG",
      "number": "70 00 00 01"
    },
    "admin": {
      "name": "Administrateur",
      "image": "assets/admin.JPG",
      "number": "70 00 00 02"
    },
    "gerant": {
      "name": "Gérant de Stock",
      "image": "assets/gerant.JPG",
      "number": "70 00 00 03"
    }
  };

  // SUPPRIMEZ CETTE LIGNE: get ScaffoldMessenger => null;

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
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
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

                bool ok = (login == "3ii" && password == "P@sser.3ii2025") ||
                    (login == "admin" && password == "Gestion@123.2025") ||
                    (login == "gerant" && password == "gerant.3ii@2025");

                if (ok) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Contactlist(),
                    ),
                  );
                } else {
                  // CORRECTION: Utilisez ScaffoldMessenger.of(context) directement
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login ou mot de passe incorrect"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Connexion',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
