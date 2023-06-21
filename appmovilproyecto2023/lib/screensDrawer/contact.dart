import 'package:appmovilproyecto2023/screensDrawer/screenItem/contactItem.dart';
import 'package:appmovilproyecto2023/screensDrawer/screenItem/contactModel.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  static const String routeName = "/contacto";
  //creamos un metodo que devuelva un contactModel

  buildList() {
    return <ContactModel>[
      ContactModel(name: "Rodrigo Lopez", email: "r.lopez@gmail.com"),
      ContactModel(name: "Diego Falcon", email: "d.falcon@gmail.com"),
      ContactModel(name: "Mayra Cruz", email: "m.cruz@gmail.com"),
      ContactModel(name: "Evans Falcon", email: "e.falcon@gmail.com"),
      ContactModel(name: "Carlos Ipanaque", email: "c.ipananque@gmail.com"),
    ];
  }

  /*List<ContactItem> buildContactList() {
    return buildList()
        //Funcion "map" recorre todos los elementos del dataSource
        .map<ContactItem>((contact) => ContactItem(contact))
        .toList();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacto"),
        ),
        body: ListView(children: <Widget>[ContactItem()],
        ));
  }
}
