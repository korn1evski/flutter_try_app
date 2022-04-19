import 'package:flutter/material.dart';
import 'package:flutter_lesson2/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final IconData? icon;
  final String? text;
  final double size;
  final Color borderColor;
  final bool isIcon;

  const AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text,
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: isIcon == false? Center(child: AppText(text: text ?? "hi", color: color)) : Center(child: Icon(icon, color: color)),
    );
  }
}
