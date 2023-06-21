import 'package:flutter/material.dart';
import 'package:appfalcon/global.dart';

class Home extends StatefulWidget {
  //const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Drawer getDrawer(BuildContext context){
    var header = DrawerHeader(child: Text("Ajustes"),decoration: BoxDecoration(color: Colors.blueAccent));

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
        getItem(Icon(Icons.settings), "Pregunta 2",'/pregunta2'),
        getItem(Icon(Icons.battery_charging_full), "Pregunta 3",'/pregunta3'),
        getItem(Icon(Icons.contact_phone), "Pregunta 4",'/pregunta4'),
        getItem(Icon(Icons.shopping_cart), "Pregunta 5",'/pregunta5'),
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