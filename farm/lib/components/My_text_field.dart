// ignore_for_file: prefer_const_constructors, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  style: BorderStyle.solid,
                  width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black, style: BorderStyle.solid, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          fillColor: Color.fromRGBO(217, 217, 217, 1),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
