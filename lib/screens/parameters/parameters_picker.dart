import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/cubit/workout_cubit.dart';
import 'package:lms_pullups/cubit/workout_state.dart';
import 'package:lms_pullups/screens/parameters/table_picker.dart';

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
  String _tableType = "";

  void _handleWeightChange(v){
    setState(() {
      _weight = v;
    });
  }

  void _handlePullupsChange(v){
    setState(() {
      _pullups = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (ctx, state){
        if(_weight == 0)
          _weight = state.weight;

        if(_pullups == 0)
          _pullups = state.pullups;

        if(_tableType == "")
          _tableType = state.currentTable.type;

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
            TablePicker(),
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
                    context.read<WorkoutCubit>().updateParameters(_weight, _pullups, _tableType);
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