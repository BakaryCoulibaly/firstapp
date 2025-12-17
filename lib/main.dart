import 'package:firstapp/splash.dart';
import 'package:firstapp/Login.dart';
import 'package:firstapp/contactList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // Page d’accueil = page Splash (puis Login au bout de 5s)
      home: const SplashScreen(),

      // ✔️ Routes optionnelles
      routes: {
        '/login': (context) => const LoginPage(title: 'Login'),
        '/contacts': (context) => Contactlist(),
      },
    );
  }
}
