import 'package:appmovilproyecto2023/widgets/app_button.dart';
import 'package:appmovilproyecto2023/widgets/app_icon.dart';
import 'package:appmovilproyecto2023/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginFirebase";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth=FirebaseAuth.instance;
  String? _email;
  String? _password;

  void iniciarUsuario() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email!.trim(), password: _password!.trim());
           Navigator.pushNamed(context, '/loginFirebase');
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Firebase"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0,),
            AppTextField(inputText: "Ingrese Email", onChanged: (value){
              _email = value;
              print('email $_email');
            },),
             SizedBox(height: 8.0,),
            AppTextField(inputText: "Ingrese Clave",obscureTex: true,onChanged: (value){
              _password = value;
              print('Password $_password');
            },),
            AppButton(color: Colors.blueAccent, name: "Registrarse", onPressed:(){iniciarUsuario();})
          ],
        ),
      ),
    );
  }
}