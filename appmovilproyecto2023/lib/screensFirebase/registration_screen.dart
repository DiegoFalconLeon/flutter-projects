import 'package:appmovilproyecto2023/widgets/app_button.dart';
import 'package:appmovilproyecto2023/widgets/app_icon.dart';
import 'package:appmovilproyecto2023/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegistrationScreen extends StatefulWidget {
  static const String routeName = "/register";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final auth=FirebaseAuth.instance;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Usuario"),
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

            SizedBox(height: 23.0,),
            AppButton(color: Colors.blueAccent, name: "Register", onPressed: (){
              try{
                final newUser=auth.createUserWithEmailAndPassword(email: _email!, password: _password!);
                if(newUser!=null){
                  Navigator.pushNamed(context, '/loginFirebase');
                } 
              }catch(e){
                  print(e);
                }
              
            })
          ],
        ),
      ),
    );
  }
}