import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/database/drift_database.dart';
import 'package:todo_app/utils/data_utils.dart';

class ScheduleProvider extends ChangeNotifier {

  DateTime _selectedDate = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int _count = 0;
  List<Schedule> monthSchedules = [];
  List<Schedule> selectSchedules = [];
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
    selectSchedules = monthSchedules.where((schedule) => DataUtils.compareDate(schedule.date, selectedDate)).toList();
    count = selectSchedules.length;
    notifyListeners();
  }

  void init(){
    _getScheduleStream();
  }

  /// ex) 캘린터 페이지를 넘겨 달을 바꿨을 때
  void changeMonth(DateTime date) {
    _selectedDate = date;
    subscription.cancel();
    scheduleStream = GetIt.I<LocalDatabase>().watchSchedules(date);
    subscription = scheduleStream.listen((schedules) {
      monthSchedules = schedules;
      selectSchedules = schedules.where((schedule) => DataUtils.compareDate(schedule.date, selectedDate)).toList();
      count = selectSchedules.length;
      notifyListeners();
    });
  }

  void _getScheduleStream(){
    scheduleStream = GetIt.I<LocalDatabase>().watchSchedules(selectedDate);
    subscription = scheduleStream.listen((schedules) {
      monthSchedules = schedules;
      selectSchedules = schedules.where((schedule) => DataUtils.compareDate(schedule.date, selectedDate)).toList();
      count = selectSchedules.length;
      notifyListeners();
    });
  }

  Future<void> createSchedule({
    required String content,
  }) async {
    await GetIt.I<LocalDatabase>().createSchedule(
      SchedulesCompanion(
        content: Value(content),
        date: Value(selectedDate),
      ),
    );
  }

  Future<void> deleteSchedule(int id) async {
    await GetIt.I<LocalDatabase>().removeSchedule(id);
  }

  Future<void> completeOrCancel({required Schedule schedule, required bool isDone}) async {
    await GetIt.I<LocalDatabase>().doneSchedule(schedule.id, isDone);
  }

  Future<void> updateSchedule({required int id, required String content}) async {
    await GetIt.I<LocalDatabase>().updateSchedule(id, content);
  }
}
