import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardScreen'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            CustomcardOne(),
            CustomCardTwo(
                url:'https://images7.alphacoders.com/617/thumb-1920-617537.jpg'),
            CustomCardTwo(
                url:'https://images.wallpapersden.com/image/download/4k-beautiful-landscape-digital-art_bGhuZm6UmZqaraWkpJRobWllrWdma2U.jpg'),
            CustomCardTwo(url:'https://wallpapercave.com/wp/wp7728987.jpg'),
            CustomCardTwo(url:'https://wallpaperaccess.com/full/2117973.jpg'),
            CustomCardTwo(
                url:'https://c4.wallpaperflare.com/wallpaper/151/453/274/digital-art-digital-painting-fantasy-art-fantasy-landscape-wallpaper-preview.jpg'),
          ],
        ),
      ),
    );
  }
}

class CustomCardTwo extends StatelessWidget {
  final String url;
  final String? titulo;
  const CustomCardTwo({
    Key? key,
    required this.url,
    this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 15,
        shadowColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(url),
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            if (titulo != null)
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text('landscape'),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomcardOne extends StatelessWidget {
  const CustomcardOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Soy un titulo'),
            subtitle: Text(
              'Sunt aute magna magna labore occaecat in officia esse sunt. Magna aliqua veniam nisi non enim enim velit reprehenderit eu adipisicing exercitation mollit tempor. Deserunt Lorem adipisicing labore tempor.',
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('cancel'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('ok'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
