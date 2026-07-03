import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import de ta première page

void main() {
  runApp(const WorkZemApp());
}

class WorkZemApp extends StatelessWidget {
  const WorkZemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work_Zem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(), // Point d'entrée de ton app
    );
  }
}