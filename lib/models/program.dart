
class Exercise {
  final String load;
  final int repeats;
  final int sets;

  Exercise({required this.load, required this.repeats, required this.sets});
}

class Day {
  final String name;
  final List<Exercise> exercises;
  bool completed = false;

  Day({required this.name, required this.exercises});
}

class Week {
  final List<Day> days;

  Week({required this.days});
}

class Table {
  final String type;
  final List<Week> weeks;

  Table({required this.type, required this.weeks});
}

class Sheet {
  final int minPullups;
  final int maxPullups;
  final List<Table> tables;

  Sheet(
      {required this.minPullups,
      required this.maxPullups,
      required this.tables});
}

class Program {
  final List<Sheet> sheets;

  Program({required this.sheets});
}

var program = Program(
  sheets: [
    Sheet(
      minPullups: 13,
      maxPullups: 16,
      tables: [
        Table(
          type: "Таблица 1",
          weeks: [
            Week(
              days: [
                Day(
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5кг",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
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
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2кг",
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
          type: "Таблица 2",
          weeks: [
            Week(
              days: [
                Day(
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5кг",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
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
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2кг",
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
          type: "Силовые",
          weeks: [
            Week(
              days: [
                Day(
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5кг",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
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
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2кг",
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
          type: "Выносливость",
          weeks: [
            Week(
              days: [
                Day(
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 8,
                      sets: 3,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 8,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+5кг",
                      repeats: 8,
                      sets: 1,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
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
                  name: "Понедельник",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 3,
                    ),
                  ],
                ),
                Day(
                  name: "Среда",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 10,
                      sets: 2,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 2,
                    ),
                  ],
                ),
                Day(
                  name: "Пятница",
                  exercises: [
                    Exercise(
                      load: "Резина",
                      repeats: 12,
                      sets: 1,
                    ),
                    Exercise(
                      load: "Соб вес",
                      repeats: 10,
                      sets: 1,
                    ),
                    Exercise(
                      load: "+2кг",
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
