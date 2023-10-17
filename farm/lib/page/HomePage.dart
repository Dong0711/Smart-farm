// first_page.dart

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Thông tin của tôi',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    )); // UI của FirstPage
  }
}

// file sử dụng
