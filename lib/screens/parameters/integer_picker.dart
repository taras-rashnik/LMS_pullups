import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class IntegerPicker extends StatelessWidget {
  final String title;
  final int minValue;
  final int maxValue;
  final int value;
  final ValueChanged<int> onChanged;

  const IntegerPicker({
    Key? key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        NumberPicker(
          minValue: minValue,
          maxValue: maxValue,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
