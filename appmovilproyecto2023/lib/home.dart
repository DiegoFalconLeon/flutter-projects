import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Drawer getDrawer(BuildContext context){
    var header = DrawerHeader(child: Text("Ajustes"),decoration: BoxDecoration(color: Colors.blueAccent));
    var info = AboutListTile(
      child: Text("Informacion App"),
      applicationIcon: Icon(Icons.favorite),
      applicationVersion: "v1.0.0",
      icon: Icon(Icons.info),
    );
    ListTile getItem(Icon icon, String descripcion, String route){
    return ListTile(
      leading: icon,
      title: Text(descripcion),
      onTap: (){
        Navigator.pushNamed(context, route);
      },
    );
  }

  ListView getList(){//Drawer Contenedor
    return ListView(
      children: <Widget>[
       
        header,
        getItem(Icon(Icons.home), "Menu inicio", '/'),
        getItem(Icon(Icons.settings), "Coniguracion",'/configuracion'),
        getItem(Icon(Icons.battery_charging_full), "Bateria",'/bateria'),
        getItem(Icon(Icons.contact_phone), "Contacto",'/contacto'),
        getItem(Icon(Icons.shopping_cart), "Productos",'/Infinita'),
        getItem(Icon(Icons.login), "Validacion",'/validation'),
        getItem(Icon(Icons.login_sharp), "Login",'/bloc'),
        getItem(Icon(Icons.login), "Firebase",'/welcome'),
        info,
      ],
    );
  }

  return Drawer(child: getList());
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Pagina Principal"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){
            Navigator.pushNamed(context, '/');
          },
        ),],
    ),
    //drawer:  Drawer(child: getDrawer(context),),
    drawer: getDrawer(context),
  );
  }
}