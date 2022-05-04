import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImageCard extends StatelessWidget {
  final int height;
  final int width;
  final String imageStr;

  const ImageCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.imageStr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: SizedBox(
        height: height.toDouble(),
        width: width.toDouble(),
        child: Image.network(imageStr),
      ),
    );
  }
}
