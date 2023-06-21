
import 'package:appfalcon/pregunta2.dart';
import 'package:appfalcon/pregunta3.dart';
import 'package:appfalcon/pregunta4.dart';
import 'package:appfalcon/pregunta5.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(new MaterialApp(
    home: Home(),
    //debugShowCheckedModeBanner:  false,
    //Mapeamos las rutas
    routes: <String, WidgetBuilder>
    {
     Pregunta2.routeName: (BuildContext context) => Pregunta2(),
      Pregunta3.routeName: (BuildContext context) => Pregunta3(),
     Pregunta4.routeName: (BuildContext context) => Pregunta4(),
    Pregunta5.routeName: (BuildContext context) => Pregunta5(),
    }
  ));
}


