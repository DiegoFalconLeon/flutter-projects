import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //variable de tipo FormState
  //La variable formKey obtenemos una referencia del FormsState
  //Accedemos con variable a los valores que contengan los inputs
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin:EdgeInsets.only(top: 25.0),),
          submiField(),
        ],
      )),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "exampe@dominio.com",
        icon: Icon(Icons.person),
      ),
      validator:(value){
        print(value);
        if(value!.isEmpty){
          return "El email es requerido";
        }
        if(!value!.contains("@")){
          return "email necesita @";
        }
        
      
      }
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Contraseña",
        icon: Icon(Icons.lock),
      ),
      validator:(value){
        print(value);
        if(value!.length < 6){
          return "contraseña debe ser mayor a 6 caracteres";
        }
        if(value!.isEmpty){
          return "Introduzca una contraseña";
        }
       
      }
    );
  }

  Widget submiField(){
    return ElevatedButton(
      onPressed: (){
        formKey.currentState!.validate();
      }, 
      child: Text("Ingresar"));
  }
}