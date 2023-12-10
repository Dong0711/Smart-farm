// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  const Mybutton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.5,
      height: screenHeight * 0.06,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(0, 115, 12, 1)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: Colors.white),
        ),
      ),
    );
  }
}
