import 'package:flutter/material.dart';

class TablePicker extends StatelessWidget {
  final List<String> types;
  final String selectedType;
  final ValueChanged<String?> onChanged;

  const TablePicker({Key? key, required this.types, required this.selectedType, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var table in types)
          Row(
            children: [
              Radio<String>(
                value: table,
                groupValue: selectedType,
                onChanged: onChanged,
              ),
              Text(table),
            ],
          ),
      ],
    );
  }
}
