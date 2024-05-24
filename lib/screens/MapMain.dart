import 'package:flutter/material.dart';

class MapMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión Exitoso'),
      ),
      body: Center(
        child: Text(
          'Inicio de sesión exitoso',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
