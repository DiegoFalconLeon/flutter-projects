import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> heroes = [
      'Antman',
      'Batman',
      'Superman',
      'Ironamn',
      'Spiderman'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView1Screen'),
      ),
      body: ListView(
        children: heroes.map((e) => _HeroesItem(e)).toList(),
      ),
    );
  }
}

class _HeroesItem extends StatelessWidget {
  final String heroe;
  const _HeroesItem(this.heroe);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.ac_unit),
      title: Text(heroe),
    );
  }
}
