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
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(LmsPullups.calendar_day),
            title: Text(day.name),
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
            'Load',
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          numeric: true,
          label: Text(
            'Repeats',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          numeric: true,
          label: Text(
            'Sets',
            style: TextStyle(fontWeight: FontWeight.bold),
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
