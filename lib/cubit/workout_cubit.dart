import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/cubit/workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(WorkoutState state) : super(state);

  void changeWeekIndex(int weekIndex) {
    emit(state.copyWith(weekIndex: weekIndex));
    state.saveToSharedPreferences(weekIndex: weekIndex);
  }

  void toggleDayCompleted(int dayIndex) {
    state.toggleDayCompletted(dayIndex);
    emit(state.copyWith());
    state.saveToSharedPreferences(completedDays: state.completedDays);
  }

  void updateParameters(int weight, int pullups, String tableType) {
    var state1 = state.copyWith(weight: weight, pullups: pullups);
    var tableIndex = state1.currentSheet.tables.indexWhere((e) => e.type == tableType);
    tableIndex = max(0, tableIndex);
    var state2 = state1.copyWith(tableIndex: tableIndex);
    emit(state2);
    state.saveToSharedPreferences(weight: weight, pullups: pullups, tableIndex: tableIndex);
  }

  void clearProgress() {
    state.completedDays.clear();
    emit(state.copyWith());
    state.saveToSharedPreferences(completedDays: state.completedDays);
  }
}
