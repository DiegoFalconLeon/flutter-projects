
import 'package:appfalcon/pregunta2item.dart';
import 'package:appfalcon/pregunta2model.dart';
import 'package:flutter/material.dart';

class Pregunta2 extends StatelessWidget {
  static const String routeName = "/pregunta2";
  //creamos un metodo que devuelva un VideoModel

  buildList() {
    return <VideoModel>[
      VideoModel(nombre: "Da 5 Bloods", genero: "Drama"),
      VideoModel(nombre: "Lady Bird", genero: "Comedia"),
      VideoModel(nombre: "Back to the Future", genero: "Ciencia Ficcion"),
      VideoModel(nombre: "Zodiac", genero: "Drama"),
      VideoModel(nombre: "Spider-man", genero: "Accion"),
    ];
  }

  List<ContactItem> buildContactList() {
    return buildList()
        //Funcion "map" recorre todos los elementos del dataSource
        .map<ContactItem>((contact) => ContactItem(contact: contact))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacto"),
        ),
        body: ListView(children: buildContactList(),
        ));
  }
}
