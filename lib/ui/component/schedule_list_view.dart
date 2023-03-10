import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/database/drift_database.dart';
import 'package:todo_app/provider/schedule_provider.dart';
import 'package:todo_app/ui/component/schedule_add_bottom_sheet.dart';
import 'package:todo_app/ui/component/schedule_card.dart';

class ScheduleListView extends StatelessWidget {
  const ScheduleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedules = context.watch<ScheduleProvider>().selectSchedules;

    return Expanded(
      child: schedules.isNotEmpty
          ? ListView.builder(
              itemCount: schedules.length,
              itemBuilder: (_, index) {
                final schedule = schedules[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Dismissible(
                    key: ValueKey(schedule.id),
                    onDismissed: (_) {
                      context
                          .read<ScheduleProvider>()
                          .deleteSchedule(schedule.id);
                    },
                    confirmDismiss: (_) {
                      return showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text('정말로 삭제하시겠습니까?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text(
                                  '취소',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: PRIMARY_COLOR),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text(
                                  '삭제',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: PRIMARY_COLOR),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: GestureDetector(
                      onTap: () => showScheduleBottomSheet(
                          context: context, schedule: schedule),
                      child: ScheduleCard(
                        content: schedule.content,
                        isDone: schedule.isDone,
                        onChanged: (newValue) {
                          if (newValue == null) return;
                          context.read<ScheduleProvider>().completeOrCancel(
                              schedule: schedule, isDone: newValue);
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          : Container(
              alignment: Alignment.center,
              child: Text('작업이 없습니다.'),
            ),
    );
  }
}
