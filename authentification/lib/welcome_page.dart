import 'package:flutter/material.dart';
import 'auth_page.dart'; // Nécessaire pour naviguer vers la page suivante

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(), // Espacement pour pousser le logo au centre
              
              // Logo au milieu
              const Center(
                child: Text(
                  'Work_Zem',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Logo en bleu
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              
              // Bouton Suivant tout en bas
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Bouton bleu
                    foregroundColor: Colors.white, // Texte blanc
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthOptionsPage()),
                    );
                  },
                  child: const Text(
                    'Suivant',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Colle ici le code du Scaffold de la WelcomePage...
  }
}