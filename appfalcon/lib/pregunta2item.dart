
import 'package:appfalcon/pregunta2model.dart';
import 'package:flutter/material.dart';

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
        //title: Text("Rodrigo"),
        //subtitle: Text("rodrigo@gmail.com"),

    );
  }
}