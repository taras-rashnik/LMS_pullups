import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/screens/parameters/parameters_screen.dart';
import 'package:lms_pullups/screens/workout/workout_screen.dart';

import 'cubit/workout_cubit.dart';
import 'cubit/workout_state.dart';
import 'models/program.dart' as models;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String json = await rootBundle.loadString('assets/json/pullups_program.json');
  models.Program program = models.Program.fromJson(jsonDecode(json));

  final state = await WorkoutState.loadFromSharedPreferences(program);

  runApp(LmsApp(state: state));
}

class LmsApp extends StatelessWidget {
  final WorkoutState state;

  const LmsApp({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WorkoutCubit(state),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 20.0),
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (ctx) => const WorkoutScreen(),
          "/parameters": (ctx) => const ParametersScreen(),
        },
      ),
    );
  }
}
