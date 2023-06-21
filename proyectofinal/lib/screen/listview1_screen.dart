import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListView1Screen extends StatefulWidget {
   static const String routeName = "/ListView1Screen";
    
  @override
  _ListView1ScreenState createState() => new _ListView1ScreenState();
}

class _ListView1ScreenState extends State<ListView1Screen> {
  //suggestions: sugerencias de tipo lista
  //wordpair: clase de combinacion de 2 palabraas(English Words)
  
  final suggestions=<WordPair>[];
  //Para guardar los elementos que hacemos click
  final saved=<WordPair>[];
  
  List<int> precios=[];
  int counting=0;
  //Construimos una funcion
  //Construimos las filas
  ListTile buildRow(WordPair pair, int precios){
    counting++;
    final bool alreadySaved = saved.contains(pair);

    return ListTile(
      trailing: Icon(
        alreadySaved ? Icons.shopping_cart: Icons.shopping_bag_outlined,
         color: Colors.redAccent),
      title: Text(pair.asPascalCase),
      subtitle: Text("Precio: $precios USD"),
      onTap: (){//Captura los eventos de la pantalla
        setState(() {//Renderiza los widget
          if(alreadySaved){
            saved.remove(pair);//borra un elemento
          }else{
          saved.add(pair);//Agrega un elemento
          }
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    int cont =0;
    void pushSaved() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        final title = saved
            .map((pair) => ListTile(
                  title: Text(pair.asPascalCase),
                  subtitle: Text("Precio: ${precios[suggestions.indexOf(pair)]} USD"),
                  trailing: Icon(Icons.delete),
                  onTap: () {
                    setState(() {
                      saved.remove(pair);
                      print("Se borro desde guardados");
                      Navigator.pop(context);
                      pushSaved();
                      if(saved.remove(pair)==false){
                        cont++;
                        print("Contador de items borrados: $cont");
                      }
                    });
                  },
                ))
            .toList();
            title.add(ListTile(
              //La suma total de todos los items es: 
              title: Text("Total: ${saved.map((pair) => precios[suggestions.indexOf(pair)]).reduce((a, b) => a + b)} USD"),
              subtitle: Text("Contador de items: ${saved.length}"),
            
            ));
        return Scaffold(
          appBar: AppBar(title: Text('Guardadas'),
          actions:<Widget>[
          //Creamos un icon para acceder a otra pantalla
          IconButton(
            icon: Icon(Icons.delete), 
            onPressed: (){
              
              print("ok");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                final title2 = saved
                    .map((pair) => ListTile(
                         title: Text("Total eliminado:"),
                          subtitle: Text("Contador de items BORRADOS ES: $cont"),
                          //print("Contador de items borrados: $cont");
                        ))
                    .toList();
                return Scaffold(
                  appBar: AppBar(title: Text('Auditoria')),
                  body: Text("Contador de items BORRADOS ES: $cont")//ListView(children: title2),
                );
              }));
            }
            ),
           
        ]),
          body: ListView(children: title),
        );
      }));
    }
    
    void count(){
      cont++;
      print("Contador de items borrados: $cont");
    }

    return Scaffold(
      appBar: AppBar( 
        title: Text("Lista ListView1Screen"),
         actions:<Widget>[
          //Creamos un icon para acceder a otra pantalla
          IconButton(
            icon: Icon(Icons.list), 
            onPressed: pushSaved),
        ]
      ),

      body: ListView.builder(itemBuilder: (context, i) {
        //Si el indice es impar llamar al widget Divider
        if(i.isOdd) return Divider();
        //Si el indice es mayor igual a la canitdad de datos de la variable 
        if(i>=suggestions.length){
          //funcion addAll: puede agregar mas de 1 elemento a la lista
          //Funcion genereteWordPairs: tenemos 10 elementos del tipo WordPairs 
          // y agregamos a la coleccion de datos
          suggestions.addAll(generateWordPairs().take(10));
           for (var j = 0;  j< 10; j++) {
             precios.add(Random().nextInt(500));
          }
        }
          return buildRow(suggestions[i],precios[i]);
        },
      ),
    );
  }
}