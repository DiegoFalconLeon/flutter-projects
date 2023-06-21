import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/screen/registro_screen.dart';
import 'package:proyectofinal/widget/custom_button.dart';
import 'package:proyectofinal/widget/custom_registro.dart';
import 'package:proyectofinal/widget/custom_textfield.dart';
import 'package:proyectofinal/widget/custom_titulo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  void iniciarUsuario() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!.trim(), password: password!.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CustomTitulo(titulo: "Inicio Login"),
            Column(
              children: [
                CustomTextField(
                    texto: 'correo',
                    onChanged: (value) {
                      email = value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    texto: 'contraseña',
                    onChanged: (value) {
                      password = value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  texto: 'Iniciar Sesión',
                  onPressed: () {
                    iniciarUsuario();
                  },
                ),
              ],
            ),
            const CustomRegistro(
              ruta: RegistroScreen.routeName,
            ),
          ],
        ),
      ),
    );
  }
}
