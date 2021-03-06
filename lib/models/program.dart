
class Exercise {
  final String load;
  final int repeats;
  final int sets;

  const Exercise({required this.load, required this.repeats, required this.sets});

  Exercise.fromJson(Map<String, dynamic> json)
      : load = json['load'] as String,
        repeats = json['repeats'] as int,
        sets = json['sets'] as int;

  Map<String, dynamic> toJson() => {
        'load': load,
        'repeats': repeats,
        'sets': sets,
      };
}

class Day {
  final String name;
  final List<Exercise> exercises;
  // bool completed = false;

  const Day({required this.name, required this.exercises});

  Day.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        exercises = json['exercises'] != null
            ? List<Exercise>.from(
                (json['exercises'] as List).map((p) => Exercise.fromJson(p)).toList())
            : List<Exercise>.empty();

  Map<String, dynamic> toJson() => {
        'name': name,
        'exercises': exercises,
      };
}

class Week {
  final List<Day> days;

  const Week({required this.days});

  Week.fromJson(Map<String, dynamic> json)
      : days = json['days'] != null
            ? List<Day>.from((json['days'] as List).map((p) => Day.fromJson(p)).toList())
            : List<Day>.empty();

  Map<String, dynamic> toJson() => {
        'days': days,
      };
}

class Table {
  final String type;
  final List<Week> weeks;

  const Table({required this.type, required this.weeks});

  Table.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String,
        weeks = json['weeks'] != null
            ? List<Week>.from((json['weeks'] as List).map((p) => Week.fromJson(p)).toList())
            : List<Week>.empty();

  Map<String, dynamic> toJson() => {
        'type': type,
        'weeks': weeks,
      };
}

class Sheet {
  final int minPullups;
  final int maxPullups;
  final List<Table> tables;

  const Sheet({required this.minPullups, required this.maxPullups, required this.tables});

  Sheet.fromJson(Map<String, dynamic> json)
      : minPullups = json['minPullups'] as int,
        maxPullups = json['maxPullups'] as int,
        tables = json['tables'] != null
            ? List<Table>.from((json['tables'] as List).map((p) => Table.fromJson(p)).toList())
            : List<Table>.empty();

  Map<String, dynamic> toJson() => {
    'minPullups': minPullups,
    'maxPullups': maxPullups,
    'tables': tables,
  };
}

class Program {
  final List<Sheet> sheets;

  const Program({required this.sheets});

  Program.fromJson(Map<String, dynamic> json)
      : sheets = json['sheets'] != null
      ? List<Sheet>.from((json['sheets'] as List).map((p) => Sheet.fromJson(p)).toList())
      : List<Sheet>.empty();

  Map<String, dynamic> toJson() => {
    'sheets': sheets,
  };
}

/*
var program = Program(
  sheets: [
    Sheet(
      minPullups: 13,
      maxPullups: 16,
      tables: [
        Table(
          type: "?????????????? 1",
          weeks: [
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Table(
          type: "?????????????? 2",
          weeks: [
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    Sheet(
      minPullups: 17,
      maxPullups: 20,
      tables: [
        Table(
          type: "??????????????",
          weeks: [
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Table(
          type: "????????????????????????",
          weeks: [
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    Sheet(
      minPullups: 21,
      maxPullups: 24,
      tables: [
        Table(
          type: "?????????????? 2",
          weeks: [
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Table(
          type: "???????????????????????? 2",
          weeks: [
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
            Week(
              days: [
                Day(
                  name: "??????????????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "??????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "??????????????",
                  exercises: [
                    Exercise(
                      load: "????????????",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "?????? ??????",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2????",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
*/