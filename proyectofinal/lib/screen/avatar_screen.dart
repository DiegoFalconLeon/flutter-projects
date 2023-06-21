import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AvatarScreen'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[800],
              child: const Text('LM'),
            ),
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.indigo.shade900,
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 10,
              top: 10,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7K_dUMVIC9Fskq9UXCAeMZlWAR1-2fWTU5g&usqp=CAU'),
                maxRadius: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
