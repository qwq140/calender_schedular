import 'package:flutter/material.dart';
import 'package:todo_app/ui/component/main_calendar.dart';
import 'package:todo_app/ui/component/selected_date_banner.dart';
import 'package:todo_app/ui/component/schedule_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              onDaySelected: onDaySelected,
              selectedDate: selectedDate,
            ),
            SelectedDateBanner(selectedDate: selectedDate, count: 0),
            ScheduleCard(
              startTime: 7,
              endTime: 8,
              content: '플러터 공부',
            ),
          ],
        ),
      ),
    );
  }
}
