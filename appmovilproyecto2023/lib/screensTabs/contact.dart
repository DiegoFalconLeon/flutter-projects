import 'package:flutter/material.dart';

class Contact extends StatefulWidget{
  @override
  _ContactState createState() => new _ContactState();
}

class _ContactState extends State<Contact>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(Icons.contacts,
          size: 170.0,
          color: Colors.orange),
          Text("Pantalla de Contacto")
        ],
      ),
    );
  }
}