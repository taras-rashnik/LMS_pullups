import 'dart:convert';
import 'package:lms_pullups/models/program.dart' as models;
import 'package:test/test.dart';

void main() {
  group(
    "Serialization tests",
    () {
      test(
        "Exersice",
        () {
          const String exersiceJson = '''
          {
            "load": "Резина",
            "repeats": 8,
            "sets": 3
          }
          ''';

          Map<String, dynamic> map = jsonDecode(exersiceJson);
          models.Exercise exercise = models.Exercise.fromJson(map);
          expect(exercise.load, "Резина");
          expect(exercise.repeats, 8);
          expect(exercise.sets, 3);
        },
      );

      test(
        "Day",
        () {
          const String dayJson = '''
          {
            "name": "Понедельник",
            "exercises": [
              {
                "load": "Резина",
                "repeats": 8,
                "sets": 3
              },
              {
                "load": "Соб вес",
                "repeats": 8,
                "sets": 1
              }
            ]
          }
          ''';

          Map<String, dynamic> map = jsonDecode(dayJson);
          models.Day day = models.Day.fromJson(map);
          expect(day.name, "Понедельник");
          expect(day.exercises.length, 2);

          expect(day.exercises[0].load, "Резина");
          expect(day.exercises[0].repeats, 8);
          expect(day.exercises[0].sets, 3);

          expect(day.exercises[1].load, "Соб вес");
          expect(day.exercises[1].repeats, 8);
          expect(day.exercises[1].sets, 1);
        },
      );

      test(
        "Week",
        () {
          const String weekJson = '''
            {
              "days": [
                {
                  "name": "Понедельник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 8,
                      "sets": 3
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                },
                {
                  "name": "Среда",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 1
                    },
                    {
                      "load": "5",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                },
                {
                  "name": "Пятница",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                }
              ]
            }
          ''';

          Map<String, dynamic> map = jsonDecode(weekJson);
          models.Week week = models.Week.fromJson(map);
          expect(week.days.length, 3);

          expect(week.days[0].name, "Понедельник");
          expect(week.days[0].exercises.length, 2);

          expect(week.days[1].name, "Среда");
          expect(week.days[1].exercises.length, 3);

          expect(week.days[2].name, "Пятница");
          expect(week.days[2].exercises.length, 2);
        },
      );

      test(
        "Table",
        () {
          const String tableJson = '''
        {
          "type": "Таблица 1",
          "weeks": [
            {
              "days": [
                {
                  "name": "Понедельник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 8,
                      "sets": 3
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                },
                {
                  "name": "Среда",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 1
                    },
                    {
                      "load": "5",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                },
                {
                  "name": "Пятница",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                }
              ]
            },
            {
              "days": [
                {
                  "name": "Понедельник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 12,
                      "sets": 3
                    }
                  ]
                },
                {
                  "name": "Среда",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 10,
                      "sets": 2
                    }
                  ]
                },
                {
                  "name": "Пятница",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 12,
                      "sets": 1
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 10,
                      "sets": 1
                    },
                    {
                      "load": "2",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                }
              ]
            },
            {
              "days": [
                {
                  "name": "Понедельник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 8,
                      "sets": 5
                    }
                  ]
                },
                {
                  "name": "Вторник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 4
                    }
                  ]
                },
                {
                  "name": "Пятница",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 12,
                      "sets": 3
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 12,
                      "sets": 1
                    }
                  ]
                },
                {
                  "name": "Суббота",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 12,
                      "sets": 4
                    }
                  ]
                }
              ]
            },
            {
              "days": [
                {
                  "name": "Понедельник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "4",
                      "repeats": 8,
                      "sets": 1
                    }
                  ]
                },
                {
                  "name": "Вторник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 12,
                      "sets": 3
                    }
                  ]
                },
                {
                  "name": "Пятница",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 3
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 3
                    }
                  ]
                },
                {
                  "name": "Суббота",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 2
                    },
                    {
                      "load": "6",
                      "repeats": 8,
                      "sets": 2
                    }
                  ]
                }
              ]
            },
            {
              "days": [
                {
                  "name": "Понедельник",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 12,
                      "sets": 2
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 10,
                      "sets": 2
                    }
                  ]
                },
                {
                  "name": "Среда",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 12,
                      "sets": 5
                    }
                  ]
                },
                {
                  "name": "Пятница",
                  "exercises": [
                    {
                      "load": "Резина",
                      "repeats": 10,
                      "sets": 3
                    },
                    {
                      "load": "Соб вес",
                      "repeats": 8,
                      "sets": 3
                    }
                  ]
                }
              ]
            }
          ]
        }
          ''';

          Map<String, dynamic> map = jsonDecode(tableJson);
          models.Table table = models.Table.fromJson(map);
          expect(table.weeks.length, 5);

          expect(table.weeks[0].days.length, 3);

          expect(table.weeks[1].days.length, 3);

          expect(table.weeks[2].days.length, 4);
        },
      );
    },
  );
}
