import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String text;
  final Image? icon;

  IconText(this.text, {Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(height: 28, child: icon),
      Text(text, style: TextStyle()),
    ]);
  }
}
