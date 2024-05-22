import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(PetfinderApp());
}

class PetfinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petfinder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
