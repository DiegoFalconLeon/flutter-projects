import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finalproyect/screen/login_screen.dart';
import 'package:finalproyect/widget/custom_button.dart';
import 'package:finalproyect/widget/custom_registro.dart';
import 'package:finalproyect/widget/custom_textfield.dart';
import 'package:finalproyect/widget/custom_titulo.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);
  static const String routeName = "registro";

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String? email;
  String? password;

  void registroUsuario() async {
    final valido = keyForm.currentState!.validate();
    if (!valido) return;

    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!.trim(), password: password!.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomTitulo(
                titulo: "Registro",
              ),
              Column(
                children: [
                  CustomTextField(
                    texto: 'correo',
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    texto: 'contraseña',
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    texto: 'registrar',
                    onPressed: () {
                      registroUsuario();
                    },
                  ),
                ],
              ),
              const CustomRegistro(
                ruta: LoginScreen.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
