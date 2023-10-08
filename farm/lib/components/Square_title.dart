// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(16),
        //color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        height: 30,
      ),
    );
  }
}
