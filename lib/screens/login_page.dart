import 'package:flutter/material.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Encuentra a tu mascota',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/pet_logo.png'), // Añadir imagen de logo aquí
                    ),
                    SizedBox(height: 40),
                    // espacio para el formulario de inicio de sesión
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
                    // contraseña espacio
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
                    // boton de inicio de sesión
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // accion de inicio de sesión
                        }
                      },
                      child: Text('Iniciar Sesión'),
                    ),
                    SizedBox(height: 20),
                    // Google Sign boton
                    ElevatedButton.icon(
                      onPressed: () {
                        // accion de inicio de sesión con Google
                      },
                      icon: Image.asset('assets/images/google_logo.png', height: 24), // Añadir tu imagen de Google logo aquí
                      label: Text('Iniciar Sesión con Google'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Link para registrarse
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      child: Text("¿No tienes cuenta? Regístrate aquí"),
                    ),
                    // olvidaste tu contraseña link
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: Text("¿Olvidaste tu contraseña?"),
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
