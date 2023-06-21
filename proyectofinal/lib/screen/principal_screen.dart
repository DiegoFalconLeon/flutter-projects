import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/models/models.dart';
import 'package:proyectofinal/routes/routes.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({Key? key}) : super(key: key);
  static const String routeName = "principal";

  @override
  Widget build(BuildContext context) {
    List<Models> modelo = Routes.modelo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('PrincipalScreen'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Text(
              'Salir!!',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView.separated(
          itemCount: modelo.length,
          itemBuilder: (context, i) => HomeItem(modelo[i]),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  final Models modelItem;
  const HomeItem(this.modelItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(modelItem.icon),
      title: Text(modelItem.titulo),
      onTap: () => Navigator.pushNamed(context, modelItem.ruta),
    );
  }
}
