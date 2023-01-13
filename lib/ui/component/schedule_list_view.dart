import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/drift_database.dart';
import 'package:todo_app/provider/schedule_provider.dart';
import 'package:todo_app/ui/component/schedule_card.dart';

class ScheduleListView extends StatelessWidget {
  const ScheduleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedules = context.watch<ScheduleProvider>().schedules;

    return Expanded(
      child: ListView.builder(
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final schedule = schedules[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: ScheduleCard(
            startTime: schedule.startTime,
            endTime: schedule.endTime,
            content: schedule.content,
          ),
        );
      },
    ));
  }
}
