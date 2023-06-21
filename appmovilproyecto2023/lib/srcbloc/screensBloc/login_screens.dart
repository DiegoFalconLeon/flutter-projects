import 'package:appmovilproyecto2023/srcbloc/bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
 // final bloc = Bloc();
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(),
        ],
      ),     
    );
  }

  Widget emailField(){
    return StreamBuilder( 
      stream: bloc.email,
      builder: (context, snapshot){
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "exampe@dominio.com",
            icon: Icon(Icons.person),
            errorText: snapshot.error.toString(),
          ),
          onChanged: (value) => bloc.emailChanged,
        );
      }
    );
  }

  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Contraseña",
            hintText: "Contraseña",
            icon: Icon(Icons.lock),
            errorText: snapshot.error.toString(),
          ),
          onChanged: (value) => bloc.passwordChanged,
        );
      }
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      onPressed: (){
       //
      }, 
      child: Text("Ingresar"));
  }
}