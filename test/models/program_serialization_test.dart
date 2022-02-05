import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms_pullups/models/program.dart' as models;


void main() {
  test('Deserialize program tree structure from asset json file', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    String json = await rootBundle.loadString('assets/json/pullups_program.json');
    models.Program program = models.Program.fromJson(jsonDecode(json));
    expect(program.sheets.length, 3);

    expect(program.sheets[0].tables.length, 2);
    expect(program.sheets[0].tables[0].type, "Программа 1");
    expect(program.sheets[0].tables[1].type, "Программа 2");
    expect(program.sheets[0].tables[0].weeks.length, 5);
    expect(program.sheets[0].tables[0].weeks[0].days.length, 3);
    expect(program.sheets[0].tables[0].weeks[0].days[0].name, "Понедельник");
    expect(program.sheets[0].tables[0].weeks[0].days[0].exercises.length, 2);
    expect(program.sheets[0].tables[0].weeks[0].days[0].exercises[0].load, "Резина");
    expect(program.sheets[0].tables[0].weeks[0].days[0].exercises[0].repeats, 8);
    expect(program.sheets[0].tables[0].weeks[0].days[0].exercises[0].sets, 3);

    expect(program.sheets[1].tables.length, 2);
    expect(program.sheets[1].tables[0].type, "Выносливость");
    expect(program.sheets[1].tables[1].type, "Сила");

    expect(program.sheets[2].tables.length, 2);
    expect(program.sheets[2].tables[0].type, "Выносливость");
    expect(program.sheets[2].tables[1].type, "Сила");
  });
}