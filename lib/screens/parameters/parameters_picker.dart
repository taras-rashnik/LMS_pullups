import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/cubit/workout_cubit.dart';
import 'package:lms_pullups/cubit/workout_state.dart';
import 'package:lms_pullups/models/program.dart';
import 'package:lms_pullups/screens/parameters/table_picker.dart';
import 'package:collection/collection.dart';

import 'integer_picker.dart';

class ParametersPicker extends StatefulWidget {
  const ParametersPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<ParametersPicker> createState() => _ParametersPickerState();
}

class _ParametersPickerState extends State<ParametersPicker> {
  int _weight = 0;
  int _pullups = 0;
  String _selectedType = "";

  void _handleWeightChange(v) {
    setState(() {
      _weight = v;
    });
  }

  void _handlePullupsChange(v) {
    setState(() {
      _pullups = v;
    });
  }

  void _handleTypeChange(String? v) {
    setState(() {
      _selectedType = v ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (ctx, state) {
        if (_weight == 0) {
          _weight = state.weight;
        }

        if (_pullups == 0) {
          _pullups = state.pullups;
        }

        Sheet sheet = state.program.sheets
                .firstWhereOrNull((s) => s.minPullups <= _pullups && _pullups <= s.maxPullups) ??
            state.currentSheet;

        var types = sheet.tables.map((t) => t.type).toList();
        if (!types.contains(_selectedType)) {
          _selectedType = types[state.tableIndex];
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your data"),
            Spacer(),
            Divider(),
            IntegerPicker(
              title: "Your Weight",
              minValue: 30,
              maxValue: 150,
              value: _weight,
              onChanged: _handleWeightChange,
            ),
            Spacer(),
            Divider(),
            IntegerPicker(
              title: "Pullups",
              minValue: 10,
              maxValue: 50,
              value: _pullups,
              onChanged: _handlePullupsChange,
            ),
            Spacer(),
            Divider(),
            TablePicker(
              types: types,
              selectedType: _selectedType,
              onChanged: _handleTypeChange,
            ),
            Spacer(),
            Divider(),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<WorkoutCubit>().updateParameters(_weight, _pullups, _selectedType);
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
