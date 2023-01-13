import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/const/color.dart';
import 'package:todo_app/provider/schedule_provider.dart';
import 'package:todo_app/ui/component/main_calendar.dart';
import 'package:todo_app/ui/component/schedule_add_bottom_sheet.dart';
import 'package:todo_app/ui/component/schedule_list_view.dart';
import 'package:todo_app/ui/component/selected_date_banner.dart';
import 'package:todo_app/ui/component/schedule_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    context.read<ScheduleProvider>().selectedDate = selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    print("홈스크린 빌드");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              onDaySelected: onDaySelected,
            ),
            const SizedBox(height: 8.0),
            const SelectedDateBanner(),
            const SizedBox(height: 8.0),
            const ScheduleListView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const ScheduleAddBottomSheet(),
            isScrollControlled: true,
          );
        },
        backgroundColor: PRIMARY_COLOR,
        child: const Icon(Icons.add),
      ),
    );
  }
}
