import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/screens/parameters/parameters_screen.dart';
import 'package:lms_pullups/screens/workout/workout_screen.dart';

import 'cubit/workout_cubit.dart';
import 'models/program.dart' as models;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String json = await rootBundle.loadString('assets/json/pullups_program.json');
  models.Program program = models.Program.fromJson(jsonDecode(json));

  runApp(LmsApp(program: program));
}

class LmsApp extends StatelessWidget {
  final models.Program program;

  const LmsApp({required this.program, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WorkoutCubit(program),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            caption: TextStyle(fontSize: 28.0),
            bodyText1: TextStyle(fontSize: 28.0),
            bodyText2: TextStyle(fontSize: 20.0),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (ctx) => WorkoutScreen(),
          "/parameters": (ctx) => ParametersScreen(),
        },
      ),
    );
  }
}
