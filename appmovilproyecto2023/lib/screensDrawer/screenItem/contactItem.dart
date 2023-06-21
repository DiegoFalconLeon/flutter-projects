import 'package:appmovilproyecto2023/screensDrawer/screenItem/contactModel.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final ContactModel? contact;
  ContactItem({this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("R" ), 
        ),
        //title: Text(contact.name),
        //subtitle: Text(contact.email),
        title: Text("Rodrigo"),
        subtitle: Text("rodrigo@gmail.com"),

    );
  }
}