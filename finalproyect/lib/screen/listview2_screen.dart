import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({Key? key}) : super(key: key);

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
        title: const Text('ListView2Screen'),
      ),
      body: ListView.builder(
        itemCount: heroes.length,
        itemBuilder: (context, i) => _HeroesItem(heroes[i]),
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
