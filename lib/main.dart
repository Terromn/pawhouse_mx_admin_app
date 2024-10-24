import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'assets/app_theme.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TeAppThemeData.darkTheme,
      home: const HomeScreen()
    );
  }
}
