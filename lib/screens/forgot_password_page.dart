import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _emailController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su correo electrónico';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Olvidaste tu contraseña?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 100), // Añadir espacio para centrar verticalmente
                    // Header nombre de la app, espacio para el logo
                    Text(
                      'Petfinder',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Recupera tu contraseña',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/pet_logo.png'), // Añadir imagen de logo aquí
                    ),
                    SizedBox(height: 40),
                    // Email espacio
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo Electrónico',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: _validateEmail,
                    ),
                    SizedBox(height: 20),
                    // boton de enviar enlace de recuperación
                    ElevatedButton(
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          // Enviar enlace de recuperación
                        }
                      },
                      child: Text('Enviar enlace de recuperación'),
                    ),
                    SizedBox(height: 100), // Añadir espacio para centrar verticalmente
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
