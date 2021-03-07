import 'package:flutter/material.dart';

class ImageBottomTextCard extends StatelessWidget {
  final double height;
  final String text;
  final Image image;
  final EdgeInsets? margin;

  ImageBottomTextCard(
    this.text, {
    Key? key,
    required this.image,
    this.height = 250,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: Column(
        children: [
          Expanded(child: image),
          Container(
            alignment: Alignment.center,
            child: Text(text, style: TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
