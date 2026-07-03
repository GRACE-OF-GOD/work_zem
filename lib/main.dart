 import 'package:flutter/material.dart';
import 'authentification.dart';

void main() {
  runApp(const WorkZemApp());
}

class WorkZemApp extends StatelessWidget {
  const WorkZemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkZem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
        fontFamily: 'Roboto',
      ),
      home: const AuthentificationPage(),
    );
  }
}