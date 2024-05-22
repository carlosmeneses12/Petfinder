import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 100), // Añadir espacio para centrar verticalmente
                    // header con nombre de la app y espacio para el logo
                    Text(
                      'Petfinder',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Regístrate para encontrar tu mascota',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/pet_logo.png'), // añadir imagen de logo aquí
                    ),
                    SizedBox(height: 40),
                    // Email field
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
                    // Password field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: _validatePassword,
                    ),
                    SizedBox(height: 20),
                    // Confirm Password 
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmar Contraseña',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: _validateConfirmPassword,
                    ),
                    SizedBox(height: 20),
                    // Register button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // accion de registro
                        }
                      },
                      child: Text('Registrarse'),
                    ),
                    SizedBox(height: 20),
                    // boton de registro con Google
                    ElevatedButton.icon(
                      onPressed: () {
                        // accion de registro con Google
                      },
                      icon: Image.asset('assets/images/google_logo.png', height: 24), // Añadir tu imagen de Google logo aquí
                      label: Text('Registrarse con Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
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
