import 'package:flutter/material.dart';
import 'package:ui/Screens/locate.dart';
import 'package:ui/Screens/loginscreen.dart';
import 'package:ui/Screens/sdfs.dart';
import 'package:ui/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'FireMed',
      // theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const Splash(),
        'locate': (context) => const LocateScreen(),
        'login': (context) => const LoginScreen(),
      },
      home: const Splash(),
    );
  }
}
