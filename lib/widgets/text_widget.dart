import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.label,
      this.fonSize = 18.0,
      this.color,
      this.fontWeight})
      : super(key: key);
  final String label;
  final double fonSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fonSize,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
