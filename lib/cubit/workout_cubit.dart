import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/cubit/workout_state.dart';
import 'package:lms_pullups/models/program.dart' as models;

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(models.Program program)
      : super(
          WorkoutState(
            program: program,
            weight: 80,
            pullups: 12,
            sheetIndex: 0,
            tableIndex: 0,
            weekIndex: 0,
          ),
        );

  void changeWeight(int weight) => emit(state.copyWith(weight: weight));

  void changeWeekIndex(int weekIndex) => emit(state.copyWith(weekIndex: weekIndex));

  void changeNumPullups(int pullups) {
    int sheetIndex = state.program.sheets.length - 1;
    for (int i = 0; i < state.program.sheets.length; i++) {
      if (pullups < state.program.sheets[i].maxPullups) {
        sheetIndex = i;
        break;
      }
    }

    emit(state.copyWith(pullups: pullups, sheetIndex: sheetIndex));
  }

  void changeTableIndex(int tableIndex) => emit(state.copyWith(tableIndex: tableIndex));

  void toggleDayCompletted(models.Day day) {
    day.completed = !day.completed;
    emit(state.copyWith());
  }
}