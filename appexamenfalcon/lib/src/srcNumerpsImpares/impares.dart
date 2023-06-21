import 'dart:math';

import 'package:flutter/material.dart';

class MyDialog04 extends StatefulWidget {
  @override
  _MyButtonState createState() => new _MyButtonState();
}

final _random = new Random();
var indice_par = 0;
var resultado = "";

class _MyButtonState extends State<MyDialog04> {
  int indice = 0;
  List<String> collection = [
    "WARRIORS",
    "NETS",
    "SUNS",
    "CECTIS",
    "LAKERS",
    "BUCKS",
    "BULLS",
    "HEATS"
  ];
  void onPressButton() {
    setState(() {
      // OBTENER EL VALOR DEL INDICE RANDOM
      indice_par = _random.nextInt(collection.length);
      for (indice = 0; indice < collection.length; indice++) {
        if (indice_par % 2 == 0) {
          if (indice_par == 0) {
            resultado = "";
          } else {
            resultado = collection[indice_par];
          }
          //IMPAR
        } else {
          resultado = "";
        }
      }
/*       indice = indice < collection.length ? indice + 1 : 0;
 */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTA "),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Equipo: " + resultado + " Indice: " + indice_par.toString(),
                style: TextStyle(fontSize: 25.0),
              ),
              IconButton(
                iconSize: 72,
                icon: const Icon(Icons.favorite_rounded),
                color: Colors.red,
                onPressed: onPressButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
