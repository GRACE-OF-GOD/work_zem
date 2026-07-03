import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Inscription', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Créer un compte',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 8),
            const Text(
              'Veuillez remplir les champs ci-dessous pour vous inscrire.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            
            // Champ Nom
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nom complet',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            
            // Champ Email
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Adresse Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            
            // Champ Mot de passe
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 40),
            
            // Bouton de validation final
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Logique d'inscription à venir
                },
                child: const Text(
                  "S'inscrire",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // Colle ici le code du Scaffold de la RegisterPage...
  }
}