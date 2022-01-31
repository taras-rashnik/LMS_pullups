import 'package:lms_pullups/models/program.dart' as models;

class WorkoutState {
  final int weight;
  final int pullups;
  final int tableIndex;
  final int weekIndex;
  final models.Program program;

  WorkoutState({
    required this.program,
    required this.weight,
    required this.pullups,
    required this.tableIndex,
    required this.weekIndex,
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
      );

  models.Sheet get currentSheet => program.sheets[CalculateSheetIndex(program, pullups)];

  models.Table get currentTable => currentSheet.tables[tableIndex];

  models.Week get currentWeek => currentTable.weeks[weekIndex];

  static CalculateSheetIndex(models.Program program, int pullups) {
    int sheetIndex = program.sheets.length - 1;
    for (int i = 0; i < program.sheets.length; i++) {
      if (pullups <= program.sheets[i].maxPullups) {
        sheetIndex = i;
        break;
      }
    }

    return sheetIndex;
  }
}
