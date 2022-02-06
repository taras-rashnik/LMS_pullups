import 'package:flutter/material.dart';
import '../../cubit/workout_state.dart';

class WeekCard extends StatelessWidget {
  final WorkoutState state;
  final int weekIndex;

  bool _completed = false;

  WeekCard({Key? key, required this.state, required this.weekIndex})
      : super(key: key) {
    _completed = state.isWeekCompleted(weekIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: _completed ? Colors.grey[300] : Colors.white,
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.arrow_back_ios),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.arrow_forward_ios),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Неделя ${weekIndex + 1}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${state.currentSheet.minPullups}-${state.currentSheet.maxPullups} раз"),
            Text(state.currentTable.type),
          ],
        ),
      ),
    );
  }
}
