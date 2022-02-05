import 'package:flutter/material.dart';
import 'package:lms_pullups/lms_pullups_icons.dart';
import 'package:lms_pullups/screens/parameters/parameters_picker.dart';

class ParametersScreen extends StatelessWidget {
  const ParametersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          LmsPullups.pull_up_bar,
          size: 40,
        ),
        title: Text("Личные данные"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: ParametersPicker(),
        ),
      ),
    );
  }
}


