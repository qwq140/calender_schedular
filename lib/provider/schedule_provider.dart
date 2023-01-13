import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/database/drift_database.dart';

class ScheduleProvider extends ChangeNotifier {

  DateTime _selectedDate = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int _count = 0;
  List<Schedule> schedules = [];
  late Stream<List<Schedule>> scheduleStream;
  late StreamSubscription<List<Schedule>> subscription;

  int get count => _count;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    subscription.cancel();
    _getScheduleStream();
    notifyListeners();
  }

  void init(){
    _getScheduleStream();
  }

  void _getScheduleStream(){
    scheduleStream = GetIt.I<LocalDatabase>().watchSchedules(selectedDate);
    subscription = scheduleStream.listen((event) {
      schedules = event;
      count = event.length;
      notifyListeners();
    });
  }

  Future<void> createSchedule({
    required int startTime,
    required int endTime,
    required String content,
  }) async {
    await GetIt.I<LocalDatabase>().createSchedule(
      SchedulesCompanion(
        startTime: Value(startTime),
        endTime: Value(endTime),
        content: Value(content),
        date: Value(selectedDate),
      ),
    );
  }
}
