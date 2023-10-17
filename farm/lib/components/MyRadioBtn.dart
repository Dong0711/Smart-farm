import 'package:farm/config/theme/AppColor.dart';
import 'package:flutter/material.dart';

class MyRadioBtn extends StatefulWidget {
  const MyRadioBtn({
    super.key,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    required this.icon,
    required this.icoColor,
  });
  final Function(int?) onChanged;
  final int value;
  final int groupValue;
  final IconData icon;
  final Color icoColor;
  @override
  State<MyRadioBtn> createState() => _MyRadioBtnState();
}

class _MyRadioBtnState extends State<MyRadioBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: AppColor.primary[50],
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
        ),
        Icon(
          widget.icon,
          size: 25,
          color: widget.icoColor,
        ),
      ],
    );
  }
}
