import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/screens/parameters/parameters_screen.dart';
import 'package:lms_pullups/screens/workout/workout_screen.dart';

import 'cubit/workout_cubit.dart';
import 'models/program.dart' as models;

void main() {
  runApp(LmsApp(program: models.program));
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
