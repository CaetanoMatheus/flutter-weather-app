import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/presentation/widgets/card/center_icon_card/styles.dart';

class CenterIconCard extends StatelessWidget with CenterIconCardStyles {
  final String text;
  final String? subText;
  final IconData icon;
  final EdgeInsets? margin;
  final double? width;
  final double? height;

  CenterIconCard(
    this.text, {
    Key? key,
    this.margin,
    this.width = 125,
    this.subText,
    required this.icon,
    this.height = 160,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: height,
        margin: margin,
        width: width,
        padding: containerPadding(),
        decoration: containerDecoration(context),
        child: Column(
          children: [
            Text(text),
            Expanded(child: Icon(icon, color: Colors.white, size: 48)),
            Text(subText ?? '', style: subTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
