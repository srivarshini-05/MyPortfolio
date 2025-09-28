import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/education.dart';
import 'pages/skills.dart';
import 'pages/experience.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Arial',
      ),
      initialRoute: '/', // 👈 start with About page
      routes: {
        '/': (context) => const HomePage(), // About Page
        '/education': (context) => const EducationPage(),
        '/skills': (context) => const SkillsProjectsPage(), // 👈 fixed name
        '/experience': (context) => const ExperienceAwardsPage(),
      },
    );
  }
}
