import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/provider/schedule_provider.dart';

class SelectedDateBanner extends StatelessWidget {

  const SelectedDateBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle =
        TextStyle(fontWeight: FontWeight.w600, color: Colors.white);

    DateTime selectedDate = context.watch<ScheduleProvider>().selectedDate;
    return Container(
      color: PRIMARY_COLOR,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
            style: textStyle,
          ),
          Text(
            '${context.watch<ScheduleProvider>().count}개',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
