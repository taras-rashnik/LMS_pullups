import 'package:lms_pullups/models/program.dart' as models;

class WorkoutState {
  final int weight;
  final int pullups;
  final int sheetIndex;
  final int tableIndex;
  final int weekIndex;
  final models.Program program;

  WorkoutState({
    required this.program,
    required this.weight,
    required this.pullups,
    required this.sheetIndex,
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
        sheetIndex: sheetIndex ?? this.sheetIndex,
        tableIndex: tableIndex ?? this.tableIndex,
        weekIndex: weekIndex ?? this.weekIndex,
      );

  models.Sheet get currentSheet => program.sheets[sheetIndex];
  models.Table get currentTable => currentSheet.tables[tableIndex];
  models.Week get currentWeek => currentTable.weeks[weekIndex];
}
