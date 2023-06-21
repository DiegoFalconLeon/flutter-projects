import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Infinita extends StatefulWidget {
   static const String routeName = "/Infinita";

  @override
  _InfinitaState createState() => new _InfinitaState();
}

class _InfinitaState extends State<Infinita> {
  //suggestions: sugerencias de tipo lista
  //wordpair: clase de combinacion de 2 palabraas(English Words)
  final suggestions=<WordPair>[];
  //Para guardar los elementos que hacemos click
  final saved=<WordPair>[];
  List<int> precios=[];
  //Construimos una funcion
  //Construimos las filas
  ListTile buildRow(WordPair pair,int precios){
    final bool alreadySaved = saved.contains(pair);
    /*return ListTile(leading: Icon(Icons.shopping_cart),
      title: Text(pair.asPascalCase),//Agrego un formato a las palabras
    );*/
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
                      Navigator.pop(context);
                      pushSaved();
                    });
                  },
                ))
            .toList();
            title.add(ListTile(
              //title: Text("Total:"),
              title: Text("Total: ${saved.map((pair) => precios[suggestions.indexOf(pair)]).reduce((a, b) => a + b)} USD"),
              subtitle: Text("Cantidad de productos: ${saved.length}"),
            ));
        return Scaffold(
          appBar: AppBar(title: Text('Guardadas')),
          body: ListView(children: title),
        );
      }));
    }
    
    return Scaffold(
      appBar: AppBar( 
        title: Text("Lista Infinita"),
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
          /*return ListTile(
           leading: Icon(Icons.shopping_cart),
           title: Text('Producto $i'),
           subtitle: Text('Precio:${Random().nextInt(500)} USD'),
          );*/
          return buildRow(suggestions[i],precios[i]);
        },
      ),
    );
  }
}