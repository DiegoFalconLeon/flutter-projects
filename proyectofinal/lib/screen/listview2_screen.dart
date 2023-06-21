import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);

  @override
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
          title: Text("Movies"),
        ),
        body: ListView(children: buildContactList(),
        ));
  }
}

class ContactItem extends StatelessWidget {
  final VideoModel contact;
  ContactItem({required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.video_call), 
        ),
        title: Text(contact.nombre),
        subtitle: Text(contact.genero),

    );
  }
}

class VideoModel{
  String nombre;
  String genero;

  VideoModel({required this.nombre, required this.genero});
}
