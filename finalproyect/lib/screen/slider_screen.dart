import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _valor = 0;
  bool _activo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            value: _valor,
            min: 0,
            max: 400,
            activeColor: Colors.green,
            onChanged:
                _activo ? (value) => setState(() => _valor = value) : null,
          ),
          CheckboxListTile(
            value: _activo,
            activeColor: Colors.green,
            title: const Text('Habilitar Slider'),
            onChanged: (value) => setState(() => _activo = value ?? false),
          ),
          SwitchListTile.adaptive(
            value: _activo,
            title: const Text('Habilitar Slider'),
            activeColor: Colors.green,
            onChanged: (value) => setState(() => _activo = value),
          ),
          const AboutListTile(
            icon: Icon(Icons.info),
            child: Text('acerca de...'),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Image.network(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5b8d2b12-21e8-4931-8a6d-fb9ecdd60383/dexwcyf-e15d0afc-ebda-4121-8c01-e4aa277f1feb.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzViOGQyYjEyLTIxZTgtNDkzMS04YTZkLWZiOWVjZGQ2MDM4M1wvZGV4d2N5Zi1lMTVkMGFmYy1lYmRhLTQxMjEtOGMwMS1lNGFhMjc3ZjFmZWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.LIezljmXTQmS-JT9VNmOOM4yU9RU0SQBCqPoJe6svVQ',
                fit: BoxFit.cover,
                width: _valor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
