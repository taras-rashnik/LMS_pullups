import 'package:lms_pullups/models/program.dart' as models;
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<WorkoutState> loadFromSharedPreferences(models.Program program) async {
    final prefs = await SharedPreferences.getInstance();

    return WorkoutState(
      program: program,
      weight: prefs.getInt('weight') ?? 80,
      pullups: prefs.getInt('pullups') ?? 12,
      tableIndex: prefs.getInt('tableIndex') ?? 0,
      weekIndex: prefs.getInt('weekIndex') ?? 0,
      completedDays: prefs.getStringList("completedDays") ?? List<String>.empty(growable: true),
    );
  }

  Future<void> saveToSharedPreferences({
    int? weight,
    int? pullups,
    int? tableIndex,
    int? weekIndex,
    List<String>? completedDays,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    if (weight != null) {
      await prefs.setInt('weight', weight);
    }
    if (pullups != null) {
      await prefs.setInt('pullups', pullups);
    }
    if (tableIndex != null) {
      await prefs.setInt('tableIndex', tableIndex);
    }
    if (weekIndex != null) {
      await prefs.setInt('weekIndex', weekIndex);
    }
    if (completedDays != null) {
      await prefs.setStringList('completedDays', completedDays);
    }
  }

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

    if (pullups <= program.sheets[0].maxPullups) {
      sheetIndex = 0;
    }

    return sheetIndex;
  }

  bool isWeekCompleted(int weekIndex) {
    final week = currentTable.weeks[weekIndex];
    for (int i = 0; i < week.days.length; i++) {
      if (!isWeekDayCompleted(weekIndex, i)) {
        return false;
      }
    }

    return true;
  }

  bool isWeekDayCompleted(int weekIndex, int dayIndex) {
    return completedDays.contains(_completedWeekDayKey(weekIndex, dayIndex));
  }

  bool isDayCompleted(int dayIndex) {
    return isWeekDayCompleted(weekIndex, dayIndex);
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
    return _completedWeekDayKey(weekIndex, dayIndex);
  }

  String _completedWeekDayKey(int weekIndex, int dayIndex) {
    final sheetIndex = calculateSheetIndex(program, pullups);
    return "$sheetIndex-$tableIndex-$weekIndex-$dayIndex";
  }
}
