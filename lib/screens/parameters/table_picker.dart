import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/cubit/workout_cubit.dart';
import 'package:lms_pullups/cubit/workout_state.dart';

class TablePicker extends StatefulWidget {
  const TablePicker({Key? key}) : super(key: key);

  @override
  _TablePickerState createState() => _TablePickerState();
}

class _TablePickerState extends State<TablePicker> {
  String type = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (ctx, state) {
        if(type == "")
          type = state.currentTable.type;

        return Column(
          children: [
            for (var table in state.currentSheet.tables)
              Row(
                children: [
                  Radio<String>(
                    value: table.type,
                    groupValue: type,
                    onChanged: (v) {
                      print("Radio.onChange($v)");
                      setState(() {
                        type = v ?? "";
                      });
                    },
                  ),
                  Text(table.type),
                ],
              ),
          ],
        );
      },
    );
  }
}
