import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> idImages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  late ScrollController scrollController = ScrollController();

  bool loading = false;

  void add10() {
    int ultimo = idImages.last;
    idImages.addAll([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) => e + ultimo));
    setState(() {});
  }

  Future<void> esperarSegundos() async {
    if (loading) return;
    loading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 4));
    loading = false;
    setState(() {});
    add10();
    if (scrollController.position.pixels + 150 <
        scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.animateTo(scrollController.position.pixels + 150,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  Future<void> refrescar() async {
    await Future.delayed(const Duration(seconds: 2));
    int ultimo = idImages.last;
    idImages.clear();
    idImages.add(ultimo);
    add10();
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        esperarSegundos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: Colors.blueAccent,
              onRefresh: refrescar,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: idImages.length,
                  itemBuilder: (context, index) {
                    String imagen =
                        'https://picsum.photos/id/${idImages[index]}/200/300';

                    return FadeInImage(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(imagen),
                    );
                  }),
            ),
            if (loading)
              Positioned(
                bottom: 40,
                left: width * .5 - 30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
