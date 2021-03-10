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
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: height * .1),
                height: height * .7,
                width: height + (height * .2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: height * .2,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(.1),
                      blurRadius: height * .2,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: height * .2,
                      offset: Offset(-5, -5),
                    ),
                  ],
                ),
              ),
              Container(height: height * .92, child: image),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text(text, style: TextStyle(fontSize: 17)),
          ),
        ],
      ),
    );
  }
}
