import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_pullups/cubit/workout_cubit.dart';
import 'package:lms_pullups/cubit/workout_state.dart';

import '../../lms_pullups_icons.dart';
import 'day_card.dart';

class WorkoutScreen extends StatelessWidget {

  const WorkoutScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _workuotToolBarBuilder(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<WorkoutCubit, WorkoutState>(
            builder: _workoutBodyBuilder,
          ),
        ),
      ),
    );
  }

  Widget _workoutBodyBuilder(BuildContext context, WorkoutState state) {
            var sheet = state.currentSheet;
            var week = state.currentWeek;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${sheet.minPullups}-${sheet.maxPullups} pullups"),
                Text(sheet.tables[0].type),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Неделя ${state.weekIndex + 1}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: week.days.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DayCard(
                        day: week.days[index],
                      );
                    },
                  ),
                ),
              ],
            );
  }

  AppBar _workuotToolBarBuilder(BuildContext context) {
    return AppBar(
      leading: Icon(LmsPullups.pull_up_bar, size: 40,),
      actions: [
        IconButton(
          icon: Icon(Icons.settings_outlined, size: 34,),
          tooltip: "Open User Parametes",
          onPressed: (){
            Navigator.of(context).pushNamed("/parameters");
          },
        ),
      ],
      title: Text("Подтягивания"),
      centerTitle: true,
    );
  }
}
