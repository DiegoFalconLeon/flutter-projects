import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Menu Principal'),
            onTap: () {
              // Navigator.pushNamed(context, MenuScreen.routeName);
            },
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              label: const Text(
                'Salir de la Sesión',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                // Navigator.pushReplacementNamed(
                //     context, LoginScreen.routeName);
              }),
        ],
      ),
    );
  }
}
