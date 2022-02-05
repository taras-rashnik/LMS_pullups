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
    var sheet = state.currentSheet;
    var table = state.currentTable;
    var week = state.currentWeek;

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
            onPageChanged: (i, r){context.read<WorkoutCubit>().changeWeekIndex(i);},
          ),
          itemCount: table.weeks.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Center(child: WeekCard(state: state, weekIndex: itemIndex)),
        ),
        // WeekCard(state: state, weekIndex: 0),
        SizedBox(
          height: 8,
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
      leading: Icon(
        LmsPullups.pull_up_bar,
        size: 40,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings_outlined,
            size: 34,
          ),
          tooltip: "Открыть личные данные",
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
                  children: [
                    Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Обнулить прогресс"),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
      title: Text("Подтягивания"),
      centerTitle: true,
    );
  }
}
