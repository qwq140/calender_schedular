import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/provider/schedule_provider.dart';
import 'package:todo_app/utils/data_utils.dart';

class MainCalendar extends StatelessWidget {

  final OnDaySelected onDaySelected; // 날짜 선택 시 실행할 함수
  final Function(DateTime focusedDate) onPageChanged;

  const MainCalendar({Key? key, required this.onDaySelected, required this.onPageChanged}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    DateTime selectedDate = context.watch<ScheduleProvider>().selectedDate;

    return TableCalendar(
      onDaySelected: onDaySelected,
      onPageChanged: onPageChanged,
      selectedDayPredicate: (date) => date.year == selectedDate.year && date.month == selectedDate.month && date.day == selectedDate.day,
      focusedDay: DateTime(selectedDate.year, selectedDate.month, selectedDate.day), // 포커스되는 날짜
      firstDay: DateTime(1800, 1, 1), // 첫째 날
      lastDay: DateTime(2100, 1, 1), // 마지막 날
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
        defaultDecoration: BoxDecoration( // 평일 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        weekendDecoration: BoxDecoration( // 주말 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        selectedTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
        ),
      ),
      daysOfWeekHeight: 30, // 요일 row 높이
      locale: 'ko_kr',
    );
  }
}
