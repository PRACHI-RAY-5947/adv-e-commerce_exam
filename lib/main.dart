import 'package:contact_diary/screens/homeScreen.dart';
import 'package:contact_diary/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import this for Firebase initialization
import 'firebase_options.dart';

void main() async {
  // Ensure that Flutter engine is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase before runApp()
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
