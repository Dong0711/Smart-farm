// first_page.dart

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
    Text(
      'Thông tin của tôi',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )
          ],
        ); // UI của FirstPage
  }
}

// file sử dụng
