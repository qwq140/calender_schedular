import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/database/drift_database.dart';
import 'package:todo_app/provider/schedule_provider.dart';
import 'package:todo_app/utils/data_utils.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected; // 날짜 선택 시 실행할 함수
  final Function(DateTime focusedDate) onPageChanged;

  const MainCalendar(
      {Key? key, required this.onDaySelected, required this.onPageChanged})
      : super(key: key);

  Widget _dayStyle({
    required DateTime date,
    required List<Schedule> items,
    bool isComplete = false,
    bool isDaySchedules = false,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: isSelected ? Border.all(
          color: PRIMARY_COLOR,
          width: 1.0,
        ) : null,
        color: isSelected ? Colors.white : LIGHT_GREY_COLOR,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '${date.day}',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: isSelected ? PRIMARY_COLOR : DARK_GREY_COLOR),
            ),
          ),
          isDaySchedules ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 5,
              height: 5,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isComplete ? PRIMARY_COLOR : Colors.grey,
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = context.watch<ScheduleProvider>().selectedDate;
    List<Schedule> items = context.watch<ScheduleProvider>().monthSchedules;

    return TableCalendar(
      onDaySelected: onDaySelected,
      onPageChanged: onPageChanged,

      selectedDayPredicate: (date) =>
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay:
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
      // 포커스되는 날짜
      firstDay: DateTime(1800, 1, 1),
      // 첫째 날
      lastDay: DateTime(2100, 1, 1),
      // 마지막 날
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        // defaultDecoration: BoxDecoration(
        //   // 평일 날짜 스타일
        //   borderRadius: BorderRadius.circular(6.0),
        //   color: LIGHT_GREY_COLOR,
        // ),
        // weekendDecoration: BoxDecoration(
        //   // 주말 날짜 스타일
        //   borderRadius: BorderRadius.circular(6.0),
        //   color: LIGHT_GREY_COLOR,
        // ),
        // selectedDecoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(6.0),
        //   border: Border.all(
        //     color: PRIMARY_COLOR,
        //     width: 1.0,
        //   ),
        // ),
        // defaultTextStyle: TextStyle(
        //   fontWeight: FontWeight.w600,
        //   color: DARK_GREY_COLOR,
        // ),
        // weekendTextStyle: TextStyle(
        //   fontWeight: FontWeight.w600,
        //   color: DARK_GREY_COLOR,
        // ),
        // selectedTextStyle: const TextStyle(
        //   fontWeight: FontWeight.w600,
        //   color: PRIMARY_COLOR,
        // ),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, focusedDay) =>
            _dayStyle(date: date, items: items, isComplete: DataUtils.isComplete(items, date), isDaySchedules: DataUtils.isDaySchedules(items, date)),
        selectedBuilder: (context, date, focusedDay) => _dayStyle(date: date, items: items, isSelected: true),
      ),
      daysOfWeekHeight: 30,
      // 요일 row 높이
      locale: 'ko_kr',
    );
  }
}
