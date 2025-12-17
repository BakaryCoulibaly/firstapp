import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firstapp/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Affiche l'écran de chargement pendant 5 secondes, puis redirige vers la page de login
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(title: 'Login'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // Icône ou logo
              FlutterLogo(size: 96),
              SizedBox(height: 24),
              // Indicateur de chargement
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Chargement...', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
