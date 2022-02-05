import 'package:flutter/material.dart';
import 'package:lms_pullups/cubit/workout_cubit.dart';
import 'package:lms_pullups/models/program.dart' as models;
import 'package:provider/src/provider.dart';

import '../../lms_pullups_icons.dart';

class DayCard extends StatelessWidget {
  final models.Day day;

  const DayCard({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LmsPullups.calendar_day),
              ],
            ),
            subtitle: Text(day.name),
          ),
          _getExersiceTable(day),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                tristate: false,
                value: day.completed,
                onChanged: (v) {
                  context.read<WorkoutCubit>().toggleDayCompletted(day);
                },
              ),
              Text(
                "Готово",
                style: TextStyle(
                  // fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getExersiceTable(models.Day day) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Нагрузка',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        DataColumn(
          numeric: true,
          label: Text(
            'Повторения',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        DataColumn(
          numeric: true,
          label: Text(
            'Подходы',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
      rows: day.exercises
          .map((exercise) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(exercise.load)),
                  DataCell(Text(exercise.repeats.toString())),
                  DataCell(Text(exercise.sets.toString())),
                ],
              ))
          .toList(),
    );
  }
}
