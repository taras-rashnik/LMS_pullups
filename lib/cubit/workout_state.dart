import 'package:lms_pullups/models/program.dart' as models;

class WorkoutState {
  final int weight;
  final int pullups;
  final int tableIndex;
  final int weekIndex;
  final List<String> completedDays;
  final models.Program program;

  const WorkoutState({
    required this.program,
    required this.weight,
    required this.pullups,
    required this.tableIndex,
    required this.weekIndex,
    required this.completedDays,
  });

  WorkoutState copyWith({
    int? weight,
    int? pullups,
    int? sheetIndex,
    int? tableIndex,
    int? weekIndex,
  }) =>
      WorkoutState(
        program: program,
        weight: weight ?? this.weight,
        pullups: pullups ?? this.pullups,
        tableIndex: tableIndex ?? this.tableIndex,
        weekIndex: weekIndex ?? this.weekIndex,
        completedDays: completedDays,
      );

  models.Sheet get currentSheet => program.sheets[calculateSheetIndex(program, pullups)];

  models.Table get currentTable => currentSheet.tables[tableIndex];

  models.Week get currentWeek => currentTable.weeks[weekIndex];

  static calculateSheetIndex(models.Program program, int pullups) {
    int sheetIndex = program.sheets.length - 1;
    for (int i = 0; i < program.sheets.length; i++) {
      if (pullups <= program.sheets[i].maxPullups) {
        sheetIndex = i;
        break;
      }
    }

    if(pullups <= program.sheets[0].maxPullups) {
      sheetIndex = 0;
    }

    return sheetIndex;
  }

  bool isDayCompleted(int dayIndex) {
    return completedDays.contains(_completedDayKey(dayIndex));
  }

  void toggleDayCompletted(int dayIndex) {
    final key = _completedDayKey(dayIndex);
    if (completedDays.contains(key)) {
      completedDays.remove(key);
    } else {
      completedDays.add(key);
    }
  }

  String _completedDayKey(int dayIndex) {
    final sheetIndex = calculateSheetIndex(program, pullups);
    return "$sheetIndex-$tableIndex-$weekIndex-$dayIndex";
  }
}
