import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;

  const MyText({
    Key? key,
    required this.text,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: color ?? Colors.black,
            fontSize: fontSize ?? 16.0,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
    );
  }
}
