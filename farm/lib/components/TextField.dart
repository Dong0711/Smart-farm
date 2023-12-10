import 'package:farm/config/theme/AppColor.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField(
      {super.key, required this.isEnabled, required this.text});
  final bool isEnabled;
  final String text;
  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      initialValue: widget.text,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: widget.isEnabled ? const OutlineInputBorder() : InputBorder.none,
        focusedBorder: widget.isEnabled
            ? OutlineInputBorder(
                borderSide: BorderSide(
                color: AppColor.primary[50] ?? const Color.fromRGBO(44, 82, 39, 1),
                width: 2,
              ))
            : InputBorder.none,
        enabledBorder: widget.isEnabled
            ? OutlineInputBorder(
                borderSide: BorderSide(
                color: AppColor.primary[10] ?? const Color.fromRGBO(87, 164, 77, 1),
                width: 2,
              ))
            : InputBorder.none, // border: InputBorder.none,
      ),
    );
  }
}
