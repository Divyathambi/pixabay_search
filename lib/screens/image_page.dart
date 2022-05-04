import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final int height;
  final int width;
  final String imageUrl;
  const ImagePage(
      {Key? key,
      required this.height,
      required this.width,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Pixabay Search",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Center(
            child: SizedBox(
          height: height.toDouble(),
          width: width.toDouble(),
          child: Image.network(imageUrl),
        )));
  }
}
