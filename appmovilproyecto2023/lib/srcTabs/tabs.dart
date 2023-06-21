import 'package:appmovilproyecto2023/screensTabs/contact.dart';
import 'package:appmovilproyecto2023/screensTabs/home.dart';
import 'package:appmovilproyecto2023/screensTabs/video.dart';
import 'package:flutter/material.dart';


class MyTabs extends StatefulWidget{
  @override
  _MyTabsState createState() => new _MyTabsState();
}
class _MyTabsState extends State<MyTabs>{
  @override
  Widget build(BuildContext context) {
    return
    DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text("Video Tabs"),
        backgroundColor: Colors.blueAccent,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.ondemand_video),
            ),
            Tab(
              icon: Icon(Icons.contacts),
            ),
           
          ]
        ),
      ),
       body: TabBarView(
              children: <Widget>[Home(),Video(),Contact(),],),
      ),
    );
  }
}