import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lms_pullups/cubit/workout_cubit.dart';
import 'package:lms_pullups/cubit/workout_state.dart';
import 'package:lms_pullups/screens/workout/week_card.dart';
import '../../lms_pullups_icons.dart';
import 'day_card.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 120.0,
            viewportFraction: 1,
            initialPage: state.weekIndex,
            enableInfiniteScroll: false,
            onPageChanged: (i, r) {
              context.read<WorkoutCubit>().changeWeekIndex(i);
            },
          ),
          itemCount: state.currentTable.weeks.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Center(child: WeekCard(state: state, weekIndex: itemIndex)),
        ),
        // WeekCard(state: state, weekIndex: 0),
        const SizedBox(
          height: 8,
        ),
        Flexible(
          child: ListView.builder(
            itemCount: state.currentWeek.days.length,
            itemBuilder: (BuildContext context, int index) {
              return DayCard(
                state: state,
                dayIndex: index,
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar _workuotToolBarBuilder(BuildContext context) {
    return AppBar(
      leading: const Icon(
        LmsPullups.pull_up_bar,
        size: 40,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings_outlined,
            size: 34,
          ),
          tooltip: "?????????????? ???????????? ????????????",
          onPressed: () {
            Navigator.of(context).pushNamed("/parameters");
          },
        ),
        PopupMenuButton<String>(
          // onSelected: (v) {},
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: "clear_progress",
                onTap: () {
                  context.read<WorkoutCubit>().clearProgress();
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("???????????????? ????????????????"),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
      title: const Text("????????????????????????"),
      centerTitle: true,
    );
  }
}
